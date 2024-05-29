# RatioBar Flutter Package

A simple and customizable Flutter widget for displaying a ratio bar, which visually represents the proportion between two values.

<img src="https://raw.githubusercontent.com/krzychudz/ratio_bar/main/assets/preview.jpg" width="200">

## Features

- **Customizable Colors**: Easily set different colors for the left and right sides of the ratio bar.
- **Text Labels**: Add labels to both sides of the bar with customizable text styles.
- **Border Styles**: Customize the border with rounded corners and different border styles.
- **Disabled State**: Display a disabled state with a different color and optional labels.
- **Easy Integration**: Simple to integrate and use in your Flutter applications.

## Usage

To use the `RatioBar` widget, add it to your widget tree and customize its appearance using the provided properties.


### Example

```dart
import 'package:flutter/material.dart';
import 'package:ratio_bar/ratio_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('RatioBar Example')),
        body: Center(
          child: RatioBar(
            ratio: 0.6,
            leftSideLabel: '60%',
            rightSideLabel: '40%',
            style: RatioBarStyle(
              leftSideColor: Colors.green,
              rightSideColor: Colors.red,
              leftSideLabelTextStyle: const TextStyle(fontSize: 14, color: Colors.white),
              rightSideLabelTextStyle: const TextStyle(fontSize: 14, color: Colors.black),
              borderStyle: RatioBarBorderStyle(
                borderRadiusGeometry: BorderRadius.circular(8),
                border: Border.all(color: Colors.black, width: 2),
              ),
            ),
            showLabelsWhenDisabled: true,
          ),
        ),
      ),
    );
  }
}
```

## Classes

### RatioBar

A widget that displays a ratio bar with customizable styles and labels. It visually represents a ratio between two values.

- **ratio**: The ratio between the two sides of the bar (0.0 to 1.0).
- **leftSideLabel**: The label text for the left side.
- **rightSideLabel**: The label text for the right side.
- **showLabelsWhenDisabled**: Whether to show the labels when the bar is disabled.
- **style**: The style for customizing the appearance of the bar.

### RatioBarStyle

A style class for customizing the appearance of the ratio bar.

- **leftSideColor**: The color of the left side.
- **rightSideColor**: The color of the right side.
- **disabledColor**: The color when the bar is disabled.
- **leftSideLabelTextStyle**: The text style for the left side label.
- **rightSideLabelTextStyle**: The text style for the right side label.
- **borderStyle**: The border style for the ratio bar.

### RatioBarBorderStyle

A style class for defining the border of the ratio bar.

- **borderRadiusGeometry**: The border radius for rounding corners.
- **border**: The border style for the ratio bar.