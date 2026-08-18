import 'package:deskcar/features/repairs/presentation/widgets/vehicle_note_timeline_constants.dart';
import 'package:flutter/material.dart';

class VehicleNoteTimelineRail extends StatelessWidget {
  const VehicleNoteTimelineRail({
    super.key,
    required this.connectTop,
    required this.connectBottom,
    required this.child,
  });

  final bool connectTop;
  final bool connectBottom;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final roadColor = isDark ? const Color(0xFF8A8A8A) : const Color(0xFF5F6368);
    final dashColor = isDark ? const Color(0xFFE0E0E0) : Colors.white;

    return SizedBox(
      width: VehicleNoteTimelineConstants.railWidth,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: _TimelineRailPainter(
                roadColor: roadColor,
                dashColor: dashColor,
                connectTop: connectTop,
                connectBottom: connectBottom,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _TimelineRailPainter extends CustomPainter {
  _TimelineRailPainter({
    required this.roadColor,
    required this.dashColor,
    required this.connectTop,
    required this.connectBottom,
  });

  final Color roadColor;
  final Color dashColor;
  final bool connectTop;
  final bool connectBottom;

  static const _overlap = 1.5;

  @override
  void paint(Canvas canvas, Size size) {
    if (!connectTop && !connectBottom) {
      return;
    }

    final centerX = size.width / 2;
    final midY = size.height / 2;

    var top = connectTop ? 0.0 : midY;
    var bottom = connectBottom ? size.height : midY;

    if (connectTop) {
      top -= _overlap;
    }
    if (connectBottom) {
      bottom += _overlap;
    }

    final height = bottom - top;
    if (height <= 0) {
      return;
    }

    final roadRect = Rect.fromLTWH(
      centerX - VehicleNoteTimelineConstants.roadWidth / 2,
      top,
      VehicleNoteTimelineConstants.roadWidth,
      height,
    );
    canvas.drawRect(roadRect, Paint()..color = roadColor);

    final dashPaint = Paint()
      ..color = dashColor
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    const dashLength = 5.0;
    const dashGap = 4.0;
    var y = top;

    while (y < bottom) {
      final dashEnd = (y + dashLength).clamp(top, bottom);
      canvas.drawLine(Offset(centerX, y), Offset(centerX, dashEnd), dashPaint);
      y += dashLength + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant _TimelineRailPainter oldDelegate) {
    return oldDelegate.roadColor != roadColor ||
        oldDelegate.dashColor != dashColor ||
        oldDelegate.connectTop != connectTop ||
        oldDelegate.connectBottom != connectBottom;
  }
}
