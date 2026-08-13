import 'package:flutter/material.dart';
import 'package:deskcar/core/responsive/app_sizes.dart';
import 'package:deskcar/theme/app_surface_colors.dart';
import 'package:shimmer/shimmer.dart';

class AppLoadingState extends StatelessWidget {
  const AppLoadingState({
    super.key,
    this.itemCount = 3,
    this.minHeight,
  });

  final int itemCount;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    final baseColor = AppSurfaceColors.shimmerBase(context);
    final highlightColor = AppSurfaceColors.cardBackground(context);

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: minHeight ?? AppSizes.stateMinHeight,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Shimmer.fromColors(
          baseColor: baseColor,
          highlightColor: highlightColor,
          child: Column(
            children: List.generate(itemCount, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: AppSizes.spacingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: AppSizes.shimmerHeight * 5,
                      decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius:
                            BorderRadius.circular(AppSizes.cardRadius),
                      ),
                    ),
                    SizedBox(height: AppSizes.spacingSm),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      height: AppSizes.shimmerHeight * 2,
                      decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius:
                            BorderRadius.circular(AppSizes.shimmerRadius),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
