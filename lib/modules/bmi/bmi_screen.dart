import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/models/bmi_result/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;

  double height = 120.0;
  int weight = 40;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI CALCULATOR"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isMale ? Colors.blue : Colors.grey[400],
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.ac_unit,
                                size: 70,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "MALE",
                                style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.normal),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isMale ? Colors.grey[400] : Colors.blue,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.anchor,
                                size: 70,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                "FEMALE",
                                style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "HEIGHT",
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontSize: 25.0,
                              fontWeight: FontWeight.w100),
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('${height.round()}',
                                style: const TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w900)),
                            const Text("cm",
                                style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Slider(
                          value: height,
                          max: 220.0,
                          min: 80.0,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "WEIGHT",
                                style:
                                TextStyle(fontFamily: 'Gilroy', fontSize: 25.0),
                              ),
                              Text(
                                '$weight',
                                style: const TextStyle(
                                    fontFamily: 'Gilroy', fontSize: 25.0),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                      mini: true,heroTag: 'weight-',
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                      child: Icon(Icons.remove)),
                                  FloatingActionButton(
                                      mini: true,heroTag: 'weight+',
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      child: Icon(CupertinoIcons.add,)),
                                ],
                              )
                            ],
                          ),
                        )),
                    const SizedBox(width: 20),
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "AGE",
                                style:
                                TextStyle(fontFamily: 'Gilroy', fontSize: 25.0),
                              ),
                              Text(
                                '$age',
                                style:
                                TextStyle(fontFamily: 'Gilroy', fontSize: 25.0),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FloatingActionButton(
                                      child: const Icon(Icons.remove),
                                      mini: true,heroTag: 'age-',
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      }),
                                  FloatingActionButton(
                                      child: const Icon(CupertinoIcons.add),
                                      mini: true,heroTag: 'age+',
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      }),
                                ],
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: MaterialButton(
                      onPressed: () {
                        var result =( weight / pow(height / 100, 2)).round();
                        print(result.round());
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context)=> BMIResultScreen(age: age,isMale: isMale,result: result)));
                      },
                      child: const Text(
                        "Calculate",
                        style: TextStyle(
                            fontFamily: 'ShareTechMono',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w200,
                            color: Colors.white),
                      ))),
            )
          ],
        ));
  }
}
