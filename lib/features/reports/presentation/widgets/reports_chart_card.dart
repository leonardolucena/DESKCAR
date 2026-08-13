import 'dart:math' as math;

import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ReportsLegendItem {
  const ReportsLegendItem({
    required this.label,
    this.color,
    this.backgroundColor,
    this.value = '---',
  });

  final String label;
  final Color? color;
  final Color? backgroundColor;
  final String value;
}

class ReportsChartLine {
  const ReportsChartLine({
    required this.color,
    this.values = const [],
    this.showArea = true,
  });

  final Color color;
  final List<double> values;
  final bool showArea;
}

class ReportsChartCard extends StatefulWidget {
  const ReportsChartCard({
    super.key,
    required this.title,
    required this.yAxisLabel,
    required this.xLabels,
    this.yMax = 10,
    this.yStep = 2,
    this.lines = const [],
    this.legendItems = const [],
    this.compactXLabels = false,
    this.useSimpleChart = false,
    this.useKilometerLabels = false,
  });

  final String title;
  final String yAxisLabel;
  final List<String> xLabels;
  final double yMax;
  final double yStep;
  final List<ReportsChartLine> lines;
  final List<ReportsLegendItem> legendItems;
  final bool compactXLabels;
  final bool useSimpleChart;
  final bool useKilometerLabels;

  @override
  State<ReportsChartCard> createState() => _ReportsChartCardState();
}

class _ReportsChartCardState extends State<ReportsChartCard> {
  LineChartData? _cachedChartData;

  double get _maxX => widget.xLabels.isEmpty ? 0 : widget.xLabels.length - 1;

  double get _bottomInterval {
    if (widget.xLabels.length <= 8) {
      return 1;
    }
    if (widget.xLabels.length <= 14) {
      return 2;
    }
    return 3;
  }

  bool get _hasVisibleData {
    for (final line in widget.lines) {
      for (final value in line.values) {
        if (value > 0) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  void didUpdateWidget(covariant ReportsChartCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.title != widget.title ||
        oldWidget.yAxisLabel != widget.yAxisLabel ||
        !listEquals(oldWidget.xLabels, widget.xLabels) ||
        oldWidget.yMax != widget.yMax ||
        oldWidget.yStep != widget.yStep ||
        oldWidget.compactXLabels != widget.compactXLabels ||
        oldWidget.useSimpleChart != widget.useSimpleChart ||
        oldWidget.useKilometerLabels != widget.useKilometerLabels ||
        !_sameLines(oldWidget.lines, widget.lines)) {
      _cachedChartData = null;
    }
  }

  bool _sameLines(List<ReportsChartLine> a, List<ReportsChartLine> b) {
    if (a.length != b.length) {
      return false;
    }

    for (var index = 0; index < a.length; index++) {
      final left = a[index];
      final right = b[index];
      if (left.color != right.color ||
          left.showArea != right.showArea ||
          !listEquals(left.values, right.values)) {
        return false;
      }
    }

    return true;
  }

  double get _resolvedYStep => widget.useKilometerLabels
      ? _resolveMileageChartStep(widget.yMax)
      : _resolveChartStep(widget.yMax, widget.yStep);

  String _formatYLabel(double value) => widget.useKilometerLabels
      ? _formatKilometerAxisLabel(value)
      : _formatAxisLabel(value);

  double get _yAxisLabelWidth => widget.useKilometerLabels ? 38 : 30;

  double get _bottomTitlesReservedSize =>
      widget.compactXLabels ? 56.0 : 32.0;

  Widget _buildCenteredChart({
    required TextStyle? labelStyle,
    required Widget chart,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: _yAxisLabelWidth,
          child: Padding(
            padding: EdgeInsets.only(bottom: _bottomTitlesReservedSize),
            child: _ReportsExternalYAxisLabels(
              yMax: widget.yMax,
              yStep: _resolvedYStep,
              formatYLabel: _formatYLabel,
              labelStyle: labelStyle,
            ),
          ),
        ),
        Expanded(child: chart),
        SizedBox(width: _yAxisLabelWidth),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.labelSmall;
    final chartHeight = widget.compactXLabels ? 260.0 : 220.0;
    final primaryLine = widget.lines.isEmpty ? null : widget.lines.first;

    return RepaintBoundary(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(AppSizes.cardPadding),
        decoration: BoxDecoration(
          color: AppColors.backgroundCardLight,
          borderRadius: BorderRadius.circular(AppSizes.cardRadius),
          border: Border.all(color: AppColors.reportsChartBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: AppSizes.spacingSm),
            Text(
              widget.yAxisLabel,
              textAlign: TextAlign.center,
              style: labelStyle,
            ),
            SizedBox(height: AppSizes.spacingSm),
            SizedBox(
              height: chartHeight,
              child: _buildCenteredChart(
                labelStyle: labelStyle,
                chart: widget.useSimpleChart || !_hasVisibleData
                    ? _ReportsSimpleChart(
                        yMax: widget.yMax,
                        xLabels: widget.xLabels,
                        compactXLabels: widget.compactXLabels,
                        bottomInterval: _bottomInterval,
                        labelStyle: labelStyle,
                        lineColor: primaryLine?.color,
                        lineValues: primaryLine?.values ?? const [],
                      )
                    : LineChart(
                        _chartData(context),
                        duration: Duration.zero,
                      ),
              ),
            ),
            if (widget.legendItems.isNotEmpty) ...[
              SizedBox(height: AppSizes.spacingMd),
              ...widget.legendItems.map(
                (item) => Padding(
                  padding: EdgeInsets.only(bottom: AppSizes.spacingXs),
                  child: _LegendRow(item: item),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  LineChartData _chartData(BuildContext context) {
    return _cachedChartData ??= _buildChartData(context);
  }

  LineChartData _buildChartData(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.labelSmall;
    final showAreaFill = widget.lines.length == 1;

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: _resolvedYStep,
        getDrawingHorizontalLine: (_) => const FlLine(
          color: AppColors.repairsListDivider,
          strokeWidth: 1,
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: _bottomTitlesReservedSize,
            interval: _bottomInterval,
            getTitlesWidget: (value, meta) =>
                _bottomTitleWidgets(value, meta, labelStyle),
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: AppColors.repairsListDivider),
      ),
      minX: 0,
      maxX: _maxX,
      minY: 0,
      maxY: widget.yMax,
      lineTouchData: const LineTouchData(enabled: false),
      lineBarsData: [
        for (final line in widget.lines)
          if (_lineHasData(line.values))
            _lineBarData(line, showAreaFill && line.showArea),
      ],
    );
  }

  bool _lineHasData(List<double> values) {
    for (final value in values) {
      if (value > 0) {
        return true;
      }
    }
    return false;
  }

  List<FlSpot> _spotsFor(List<double> values) {
    return [
      for (var index = 0; index < values.length; index++)
        FlSpot(index.toDouble(), values[index]),
    ];
  }

  LineChartBarData _lineBarData(ReportsChartLine line, bool showArea) {
    return LineChartBarData(
      spots: _spotsFor(line.values),
      isCurved: false,
      color: line.color,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: showArea,
        color: line.color.withValues(alpha: 0.15),
      ),
    );
  }

  Widget _bottomTitleWidgets(
    double value,
    TitleMeta meta,
    TextStyle? labelStyle,
  ) {
    final index = value.round();
    if (index < 0 || index >= widget.xLabels.length) {
      return const SizedBox.shrink();
    }

    if (index % _bottomInterval.round() != 0 &&
        index != widget.xLabels.length - 1) {
      return const SizedBox.shrink();
    }

    final label = Text(
      widget.xLabels[index],
      textAlign: TextAlign.center,
      style: labelStyle,
    );

    if (widget.compactXLabels) {
      return SideTitleWidget(
        meta: meta,
        child: RotatedBox(
          quarterTurns: 1,
          child: label,
        ),
      );
    }

    return SideTitleWidget(
      meta: meta,
      child: Transform.rotate(
        angle: -0.6,
        child: label,
      ),
    );
  }
}

class _ReportsExternalYAxisLabels extends StatelessWidget {
  const _ReportsExternalYAxisLabels({
    required this.yMax,
    required this.yStep,
    required this.formatYLabel,
    required this.labelStyle,
  });

  final double yMax;
  final double yStep;
  final String Function(double value) formatYLabel;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    final labels = _yAxisTickValues(yMax, yStep)
        .reversed
        .map(formatYLabel)
        .toList(growable: false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (final label in labels)
          Text(
            label,
            style: labelStyle,
            textAlign: TextAlign.right,
            maxLines: 1,
          ),
      ],
    );
  }
}

double _resolveMileageChartStep(double yMax) {
  if (yMax <= 20) {
    return 2;
  }
  if (yMax <= 10000) {
    return 2000;
  }
  return 10000;
}

String _formatKilometerAxisLabel(double value) {
  if (value == 0) {
    return '0';
  }
  if (value >= 1000) {
    final thousands = value / 1000;
    if (thousands == thousands.roundToDouble()) {
      return '${thousands.round()}k';
    }
    return '${thousands.toStringAsFixed(1)}k';
  }
  return value.round().toString();
}

double _resolveChartStep(double yMax, double configuredStep) {
  if (yMax <= 20) {
    return configuredStep;
  }

  final targetLines = 5;
  final rough = yMax / targetLines;
  final magnitude = _pow10((math.log(rough) / math.ln10).floor());
  final normalized = rough / magnitude;

  final niceMultiplier = normalized <= 1
      ? 1
      : normalized <= 2
          ? 2
          : normalized <= 5
              ? 5
              : 10;

  return niceMultiplier * magnitude;
}

double _pow10(int exponent) {
  var value = 1.0;
  for (var index = 0; index < exponent; index++) {
    value *= 10;
  }
  return value;
}

String _formatAxisLabel(double value) {
  if (value >= 1000000) {
    return '${(value / 1000000).toStringAsFixed(1)} mi';
  }
  if (value >= 1000) {
    return '${(value / 1000).round()} mil';
  }
  if (value == value.roundToDouble()) {
    return value.toInt().toString();
  }
  return value.toStringAsFixed(1);
}

List<double> _yAxisTickValues(double yMax, double step) {
  if (yMax <= 0) {
    return const [0];
  }

  final ticks = <double>[];
  for (var value = 0.0; value <= yMax; value += step) {
    ticks.add(value);
  }

  if (ticks.isEmpty || ticks.last < yMax) {
    ticks.add(yMax);
  }

  return ticks;
}

class _ReportsSimpleChart extends StatelessWidget {
  const _ReportsSimpleChart({
    required this.yMax,
    required this.xLabels,
    required this.compactXLabels,
    required this.bottomInterval,
    required this.labelStyle,
    required this.lineColor,
    required this.lineValues,
  });

  final double yMax;
  final List<String> xLabels;
  final bool compactXLabels;
  final double bottomInterval;
  final TextStyle? labelStyle;
  final Color? lineColor;
  final List<double> lineValues;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomPaint(
            painter: _ReportsSimpleLinePainter(
              yMax: yMax,
              horizontalLines: _yAxisTickValues(yMax, 2).length,
              lineColor: lineColor,
              lineValues: lineValues,
            ),
          ),
        ),
        SizedBox(height: AppSizes.spacingSm),
        _XAxisLabels(
          labels: xLabels,
          compact: compactXLabels,
          interval: bottomInterval.round(),
          labelStyle: labelStyle,
        ),
      ],
    );
  }
}

class _ReportsSimpleLinePainter extends CustomPainter {
  _ReportsSimpleLinePainter({
    required this.yMax,
    required this.horizontalLines,
    required this.lineColor,
    required this.lineValues,
  });

  final double yMax;
  final int horizontalLines;
  final Color? lineColor;
  final List<double> lineValues;

  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = AppColors.repairsListDivider
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    final gridPaint = Paint()
      ..color = AppColors.repairsListDivider
      ..strokeWidth = 1;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), borderPaint);

    if (horizontalLines > 1) {
      for (var index = 0; index < horizontalLines; index++) {
        final y = size.height * index / (horizontalLines - 1);
        canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
      }
    }

    if (lineColor == null || lineValues.isEmpty || yMax <= 0) {
      return;
    }

    final points = <Offset>[];
    for (var index = 0; index < lineValues.length; index++) {
      final value = lineValues[index];
      final x = lineValues.length <= 1
          ? size.width / 2
          : size.width * index / (lineValues.length - 1);
      final y = size.height - ((value / yMax) * size.height);
      points.add(Offset(x, y));
    }

    if (points.isEmpty) {
      return;
    }

    if (points.length == 1) {
      canvas.drawCircle(
        points.first,
        4,
        Paint()..color = lineColor!,
      );
      return;
    }

    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var index = 1; index < points.length; index++) {
      path.lineTo(points[index].dx, points[index].dy);
    }

    final linePaint = Paint()
      ..color = lineColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant _ReportsSimpleLinePainter oldDelegate) {
    return oldDelegate.yMax != yMax ||
        oldDelegate.horizontalLines != horizontalLines ||
        oldDelegate.lineColor != lineColor ||
        !listEquals(oldDelegate.lineValues, lineValues);
  }
}

class _XAxisLabels extends StatelessWidget {
  const _XAxisLabels({
    required this.labels,
    required this.compact,
    required this.interval,
    required this.labelStyle,
  });

  final List<String> labels;
  final bool compact;
  final int interval;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: compact ? 72 : 36,
      child: Row(
        children: [
          for (var index = 0; index < labels.length; index++)
            if (index % interval == 0 || index == labels.length - 1)
              Expanded(
                child: compact
                    ? RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          labels[index],
                          textAlign: TextAlign.center,
                          style: labelStyle,
                        ),
                      )
                    : Transform.rotate(
                        angle: -0.6,
                        child: Text(
                          labels[index],
                          textAlign: TextAlign.center,
                          style: labelStyle,
                        ),
                      ),
              )
            else
              const Spacer(),
        ],
      ),
    );
  }
}

class _LegendRow extends StatelessWidget {
  const _LegendRow({required this.item});

  final ReportsLegendItem item;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      children: [
        if (item.color != null) ...[
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: item.color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: AppSizes.spacingSm),
        ],
        Expanded(
          child: Text(
            item.label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Text(
          item.value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.repairsCostMuted,
              ),
        ),
      ],
    );

    if (item.backgroundColor == null) {
      return content;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.spacingSm,
        vertical: AppSizes.spacingXs,
      ),
      decoration: BoxDecoration(
        color: item.backgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: content,
    );
  }
}
