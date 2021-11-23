import 'package:flutter/material.dart';
import 'result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double currentHeightValue = 150;
  double currentWeightValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(fontSize: 24),
        ),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 12.0,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text(
                          'Your Height',
                          style: TextStyle(fontSize: 28),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '${currentHeightValue.toStringAsFixed(1)} cm',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Slider(
                        value: currentHeightValue,
                        min: 100,
                        max: 180,
                        label: currentHeightValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            currentHeightValue = value;
                          });
                        },
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      ListTile(
                        title: const Text(
                          'Your Weight',
                          style: TextStyle(fontSize: 28),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            '${currentWeightValue.toStringAsFixed(1)} kg',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      Slider(
                        value: currentWeightValue,
                        min: 30,
                        max: 80,
                        label: currentWeightValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            currentWeightValue = value;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ResultPage(
                                      weight: currentWeightValue,
                                      height: currentHeightValue,
                                    ),
                                  ),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Calculate',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
