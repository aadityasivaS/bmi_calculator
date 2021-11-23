import 'package:flutter/material.dart';
import 'dart:math';

enum Categories { underweight, normal, overweight, obesity }

class ResultPage extends StatefulWidget {
  final double weight, height;
  const ResultPage({
    Key? key,
    required this.weight,
    required this.height,
  }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late double bmi;
  late Categories result;
  late Color statusColor;
  List<String> resultText = ['Underweight', 'Normal', 'Overweight', 'Obesity'];

  @override
  void initState() {
    bmi = widget.weight / pow(widget.height / 100, 2);
    if (bmi < 18.5) {
      result = Categories.underweight;
      statusColor = Colors.yellow.shade700;
    } else if (bmi > 25 && bmi <= 29.9) {
      result = Categories.overweight;
      statusColor = Colors.yellow.shade700;
    } else if (bmi > 30) {
      result = Categories.obesity;
      statusColor = Colors.red;
    } else {
      result = Categories.normal;
      statusColor = Colors.green;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Result',
          style: TextStyle(fontSize: 24,),
        ),
        backgroundColor: statusColor,
        elevation: 0,
      ),
      backgroundColor: statusColor,
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 12.0,
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Your BMI is ${bmi.toStringAsFixed(1)}',
                      style: const TextStyle(fontSize: 28),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: [
                          const Text(
                            'It is considered ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            resultText[result.index],
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
