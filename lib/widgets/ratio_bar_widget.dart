import 'package:flutter/material.dart';
import 'package:ratio_bar/widgets/animated_visibility.dart';

/// A style class for the Flutter RatioBar package used to style the ratio bar.
///
/// The `RatioBarStyle` class provides customization options for the appearance
/// of a ratio bar, including colors, text styles, and border styles for both sides of the bar.
class RatioBarStyle {
  /// Creates a new `RatioBarStyle` instance with the given customization options.
  ///
  /// All parameters are optional. If a parameter is not provided, a default value
  /// or no value will be used.
  RatioBarStyle({
    this.leftSideColor = Colors.red,
    this.rightSideColor = Colors.blue,
    this.disabledColor = Colors.grey,
    this.leftSideLabelTextStyle,
    this.rightSideLabelTextStyle,
    this.borderStyle,
  });

  /// The color of the left side of the ratio bar.
  ///
  /// This color is used to fill the left side of the bar.
  /// If not provided, a default color will be used.
  final Color leftSideColor;

  /// The color of the right side of the ratio bar.
  ///
  /// This color is used to fill the right side of the bar.
  /// If not provided, a default color will be used.
  final Color rightSideColor;

  /// The color of the bar when it is disabled - no ratio is provided.
  ///
  /// This color is used to fill the bar when disabled.
  /// If not provided, a default color will be used.
  final Color disabledColor;

  /// The text style for the label on the left side of the ratio bar.
  ///
  /// This text style is applied to the label text displayed on the left side.
  /// If not provided, a default text style will be used.
  final TextStyle? leftSideLabelTextStyle;

  /// The text style for the label on the right side of the ratio bar.
  ///
  /// This text style is applied to the label text displayed on the right side.
  /// If not provided, a default text style will be used.
  final TextStyle? rightSideLabelTextStyle;

  /// The border style for the ratio bar.
  ///
  /// This style is used to draw the border around the ratio bar.
  /// If not provided, a default border style will be used.
  final RatioBarBorderStyle? borderStyle;
}

/// A style class for defining the border of a ratio bar in the Flutter RatioBar package.
///
/// The `RatioBarBorderStyle` class provides customization options for the border
/// of a ratio bar, including border radius and border style.
class RatioBarBorderStyle {
  /// Creates a new `RatioBarBorderStyle` instance with the given customization options.
  ///
  /// All parameters are optional. If a parameter is not provided, a default value
  /// or no value will be used.
  RatioBarBorderStyle({
    this.borderRadiusGeometry,
    this.border,
  });

  /// The border radius for the ratio bar.
  ///
  /// This defines the rounding of the corners of the ratio bar.
  /// If not provided, the corners will not be round
  final BorderRadiusGeometry? borderRadiusGeometry;

  /// The border style for the ratio bar.
  ///
  /// This defines the appearance of the border around the ratio bar.
  /// If not provided, no border will be drawn.
  final BoxBorder? border;
}

/// A widget that displays a ratio bar with customizable styles and labels.
///
/// The `RatioBar` widget is used to visually represent a ratio between two values.
/// It can be customized with labels and styles for both sides of the bar.
class RatioBar extends StatelessWidget {
  /// Creates a new `RatioBar` widget.
  ///
  /// All parameters are optional. If a parameter is not provided, a default value
  /// or no value will be used.
  const RatioBar({
    super.key,
    this.ratio,
    this.leftSideLabel,
    this.rightSideLabel,
    this.showLabelsWhenDisabled = false,
    this.style,
  });

  /// The ratio between the two sides of the bar.
  ///
  /// This value should be between 0.0 and 1.0, where 0.0 represents
  /// 0% on the left side and 100% on the right side. See [example].
  /// If not provided, the bar will be in disabled mode with no labels displayed.
  final double? ratio;

  /// The label text for the left side of the ratio bar.
  ///
  /// This text is displayed on the left side of the bar.
  /// If not provided, no label will be displayed.
  final String? leftSideLabel;

  /// The label text for the right side of the ratio bar.
  ///
  /// This text is displayed on the right side of the bar.
  /// If not provided, no label will be displayed.
  final String? rightSideLabel;

  /// Whether to show the labels when the ratio bar is disabled / no ratio is provided.
  ///
  /// If set to `true`, the labels will be displayed even when the ratio bar
  /// is disabled. If set to `false`, the labels will be hidden when the
  /// ratio bar is disabled. The default value is `false`.
  final bool showLabelsWhenDisabled;

  /// The style for the ratio bar.
  ///
  /// This style is used to customize the appearance of the ratio bar,
  /// including colors, text styles, and border styles.
  /// If not provided, default styles will be used.
  final RatioBarStyle? style;

  @override
  Widget build(BuildContext context) {
    final ratioBarStyle = style ?? RatioBarStyle();
    final borderRadius = style?.borderStyle?.borderRadiusGeometry;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: ratioBarStyle.borderStyle?.border,
            color: ratio == null ? ratioBarStyle.disabledColor : null,
            gradient: ratio != null
                ? LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      ratioBarStyle.leftSideColor,
                      ratioBarStyle.rightSideColor,
                    ],
                    stops: [ratio!, ratio!],
                  )
                : null,
          ),
        ),
        const SizedBox(height: 4),
        AnimatedVisibility(
          isVisible: ratio != null || showLabelsWhenDisabled,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (leftSideLabel != null)
                Text(
                  leftSideLabel!,
                  style: ratioBarStyle.leftSideLabelTextStyle,
                ),
              const Spacer(),
              if (rightSideLabel != null)
                Text(
                  rightSideLabel!,
                  style: ratioBarStyle.rightSideLabelTextStyle,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
