library ratio_bar;

import 'package:flutter/material.dart';

class RatioBar extends StatelessWidget {
  const RatioBar({
    super.key,
    this.ratio,
    this.leftSideColor = Colors.orange,
    this.rightSideColor = Colors.green,
    this.leftSideLabel = 'Left value',
    this.rightSideLabel = 'Right value',
  });

  final double? ratio;
  final Color leftSideColor;
  final Color rightSideColor;
  final String leftSideLabel;
  final String rightSideLabel;

  @override
  Widget build(BuildContext context) {
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
              Text(leftSideLabel),
              Text(rightSideLabel),
            ],
          ),
        ),
      ],
    );
  }
}

class AnimatedVisibility extends StatelessWidget {
  const AnimatedVisibility({
    super.key,
    required this.child,
    required this.isVisible,
  });

  final Widget child;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 150),
      curve: Curves.fastOutSlowIn,
      child: isVisible ? child : const SizedBox.shrink(),
    );
  }
}
