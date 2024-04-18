import 'dart:ui';
import 'result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool male = true;
  int selectGender = 0, height = 170, age = 20, weight = 60;
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              male = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: male ? Colors.blue : Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage("image/male.png"),
                                  height: 100,
                                  width: 100,
                                ),
                                Text(
                                  "male",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              male = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: male ? Colors.grey : Colors.blue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                Image(
                                  image: AssetImage("image/female.png"),
                                  height: 100,
                                  width: 100,
                                ),
                                Text(
                                  "Female",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 30),
                                )
                              ],
                            ),
                          ),
                        ),
                      ), //female
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Height(cm)", style: TextStyle(fontSize: 30)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                      ),
                      Slider(
                          value: height.toDouble(),
                          min: 0,
                          max: 300,
                          divisions: 300,
                          activeColor: Colors.black,
                          inactiveColor: Colors.black26,
                          onChanged: (value) {
                            setState(() {
                              height = value.toInt();
                            });
                          }),
                      Text("$height cm",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w900))
                    ],
                  ),
                ),
              )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // Adjust alignment as needed
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        height: MediaQuery.of(context).size.height/3,

                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Weight(Kg)",
                                style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold)),
                            ItemCount(
                              buttonSizeHeight: 50,
                              buttonSizeWidth: 20,
                              initialValue: weight,
                              minValue: 50,
                              maxValue: 350,
                              onChanged: (value) {
                                setState(() {
                                  weight = value.toInt();
                                });
                              },
                              decimalPlaces: 0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                         width: MediaQuery.of(context).size.width/3,
                        height: MediaQuery.of(context).size.height/3,

                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Age", style: TextStyle(fontSize: 30)),
                            ItemCount(
                              buttonSizeHeight: 50,
                              buttonSizeWidth: 20,
                              initialValue: age,
                              minValue: 1,
                              maxValue: 120,
                              onChanged: (value) {
                                setState(() {
                                  age = value.toInt();
                                });
                              },
                              decimalPlaces: 0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical:20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "CALCULATE BMI",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w900),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(
                            male:male,
                            height:height,
                            age:age,
                            weight:weight,
                            bmi:bmi,

                        ),
                      ),
                    );
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
