import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/ui/home_screen/home_screen.dart';

class ResultScreen extends StatelessWidget {
  final int trueCount;
  final int falseCount;

  ResultScreen(this.trueCount, this.falseCount);

  @override
  Widget build(BuildContext context) {
    // Calculate the percentage of correct answers
    int totalCount = trueCount + falseCount;
    double percentage = (totalCount == 0) ? 0 : (trueCount / totalCount) * 100;

    // Determine the color of the indicator based on the percentage
    Color indicatorColor;
    if (percentage >= 90) {
      indicatorColor = Colors.green;
    } else if (percentage >= 50) {
      indicatorColor = Colors.yellow;
    } else {
      indicatorColor = Colors.red;
    }

    return WillPopScope(
      onWillPop: () async {
        // Return true to allow the app to exit
        return false;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: percentage / 100),
                      duration: const Duration(seconds: 1, milliseconds: 500),
                      builder: (context, value, child) {
                        return SizedBox(
                          width: 250,
                          height: 250,
                          child: CircularProgressIndicator(
                            value: value,
                            strokeWidth: 10,
                            backgroundColor: Colors.grey[300],
                            valueColor:
                                AlwaysStoppedAnimation<Color>(indicatorColor),
                          ),
                        );
                      },
                    ),
                    Text(
                      '${percentage.toStringAsFixed(1)}%',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Yakunlandi',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Sizga 1 ball taqdim etildi',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  "Ja'mi to'plangan ballaringiz soni: 0 ta",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Umumiy testlar soni: 20',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '$trueCount',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            Text('To\'g\'ri javob',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.green)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '$falseCount',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            Text('Noto\'g\'ri javob',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.timer, color: Colors.orange),
                      Text(
                        '20:00',
                        style: TextStyle(fontSize: 15, color: Colors.orange),
                      ),
                      Text(
                        "/",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '11:34',
                        style: TextStyle(fontSize: 15, color: Colors.orange),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Container(
                  height: 56,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.restart_alt,
                        color: Colors.white,
                      ),
                      Text(
                        "Qayta urinish",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: (){
                  SystemNavigator.pop();
                },
                child: Container(
                  height: 56,
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Chiqish",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
