import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final bool male;
  final int height;
  final int age;
  final int weight;
  final double bmi;

  Result({
    required this.male,
    required this.height,
    required this.age,
    required this.weight,
    required this.bmi,
  });

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    int bmi = (widget.weight / ((widget.height * 0.01) * (widget.height * 0.01))).round();
    String bmiCategory = "";
    String recommendation = "";

    if (bmi < 18.5) {
      bmiCategory = "Underweight";
      recommendation = "Increase calorie intake with nutrient-dense foods and incorporate strength training while consulting a healthcare professional for personalized guidance.";
    } else if (bmi >= 18.5 && bmi < 25) {
      bmiCategory = "Normal";
      recommendation = "Maintain your weight by focusing on a balanced diet rich in fruits, vegetables, whole grains, lean proteins, and regular physical activity to support overall health and well-being.";
    } else if (bmi >= 25 && bmi < 30) {
      bmiCategory = "Overweight";
      recommendation = "Reduce calorie intake and increase physical activity to achieve a healthy weight. Consider consulting a healthcare professional for personalized guidance.";
    } else {
      bmiCategory = "Obese";
      recommendation = "Seek medical advice and consider lifestyle changes to reduce health risks associated with obesity.";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Back",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Information:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gender: ${widget.male ? 'Male' : 'Female'}",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Age: ${widget.age}",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height: ${widget.height} cm",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Weight: ${widget.weight} kg",
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Your Result:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: 400,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  SizedBox(height: 26),
                  Text(
                    "BMI=$bmi",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bmiCategory,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 26),
                  Text(
                    recommendation,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous screen
                },
                child: Text("Try Again"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

