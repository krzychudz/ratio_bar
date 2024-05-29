import 'package:flutter/material.dart';
import 'package:ratio_bar/widgets/animated_visibility.dart';

class RatioBarStyle {
  RatioBarStyle({
    this.leftSideColor,
    this.rightSideColor,
    this.leftSideLabelTextStyle,
    this.rightSideLabelTextStyle,
  });

  final Color? rightSideColor;
  final Color? leftSideColor;
  final TextStyle? leftSideLabelTextStyle;
  final TextStyle? rightSideLabelTextStyle;
}

class RatioBar extends StatelessWidget {
  const RatioBar({
    super.key,
    this.ratio,
    this.leftSideLabel,
    this.rightSideLabel,
    this.style,
  });

  final double? ratio;
  final String? leftSideLabel;
  final String? rightSideLabel;
  final RatioBarStyle? style;

  @override
  Widget build(BuildContext context) {
    final leftSideColor = style?.leftSideColor ?? Colors.red;
    final rightSideColor = style?.rightSideColor ?? Colors.blue;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ratio == null ? Colors.grey : null,
            gradient: ratio != null
                ? LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [leftSideColor, rightSideColor],
                    stops: [ratio!, ratio!],
                  )
                : null,
          ),
        ),
        const SizedBox(height: 4),
        AnimatedVisibility(
          isVisible: ratio != null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (leftSideLabel != null)
                Text(
                  leftSideLabel!,
                  style: style?.leftSideLabelTextStyle,
                ),
              const Spacer(),
              if (rightSideLabel != null)
                Text(
                  rightSideLabel!,
                  style: style?.rightSideLabelTextStyle,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
