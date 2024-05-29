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
      title: 'RatioBar example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sldierValue = 0.2;

  @override
  Widget build(BuildContext context) {
    int percentageValue = (sldierValue * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text('RatioBar Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 64),
              RatioBar(
                ratio: sldierValue,
                leftSideLabel: 'Left value: $percentageValue%',
                rightSideLabel: 'Right value: ${100 - percentageValue}%',
                style: RatioBarStyle(
                  leftSideColor: Colors.green,
                  rightSideColor: Colors.red,
                  leftSideLabelTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  rightSideLabelTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                  borderStyle: RatioBarBorderStyle(
                    borderRadiusGeometry: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text("Control the bar using the slider below"),
              Column(
                children: [
                  Slider(
                    label: '$percentageValue%',
                    value: sldierValue,
                    onChanged: (value) => setState(
                      () {
                        sldierValue = value;
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Left value: $percentageValue%'),
                      Text('Right value: ${100 - percentageValue}%'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
