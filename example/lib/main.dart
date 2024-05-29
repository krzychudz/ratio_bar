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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashbaord'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: RatioBar(
            ratio: 1 / 5,
            leftSideLabel: 'left',
            rightSideLabel: 'right',
            style: RatioBarStyle(
              rightSideColor: Colors.green,
              leftSideLabelTextStyle: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w400,
                color: Colors.green,
              ),
            ),
            // leftSideColor: Colors.red,
            // rightSideColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
