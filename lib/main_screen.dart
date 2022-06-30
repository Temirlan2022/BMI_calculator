import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/container_box.dart';
import 'widgets/data_container.dart';

const activeColor = Color(0xFF0073dd);
const inActiveColor = Color(0xFF212121);

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color maleBoxColor = activeColor;
  Color femaleBoxColor = inActiveColor;
  int height = 180;
  int ves = 70;
  int age = 20;
  String rezult = "";
  String rezultDetali = "";
  double BMI = 0;

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = activeColor;
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

  String calculateBMI(int ves, int height) {
    double BMI = ves / pow(height / 100, 2);
    return BMI.toStringAsFixed(1);
  }

  String getInterpretation(double BMI) {
    if (BMI >= 25) {
      return 'У вас вес высше нормы. Старайтесь больше заниматься спортом';
    } else if (BMI > 18.0) {
      return 'Ваш рост с весом соответствует. Вы молодец';
    } else {
      return 'У вас вес ниже нормы, старайтесь есть чаще';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: const Text(
            'BMI CALCULATOR',
          ),
          centerTitle: true,
          backgroundColor: inActiveColor),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateBoxColor(1);
                      });
                    },
                    child: ContainerBox(
                      boxColor: maleBoxColor,
                      childWidget: DataContainer(
                          icon: FontAwesomeIcons.mars, title: 'Эркек'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateBoxColor(2);
                      });
                    },
                    child: ContainerBox(
                      boxColor: femaleBoxColor,
                      childWidget: DataContainer(
                          icon: FontAwesomeIcons.venus, title: 'Аял'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ContainerBox(
              boxColor: inActiveColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Рост', style: textStyle1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(), style: textStyle2),
                      const Text('см', style: textStyle1),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 20,
                      max: 220,
                      activeColor: activeColor,
                      inactiveColor: inActiveColor,
                      onChanged: (double newValue) {
                        height = newValue.round();
                        setState(() {});
                      })
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ContainerBox(
                    boxColor: inActiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Вес', style: textStyle1),
                        Text(ves.toString(), style: textStyle1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  if (ves < 1) {
                                    return 0;
                                  }
                                  ves--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  ves++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ContainerBox(
                    boxColor: inActiveColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Возраст', style: textStyle1),
                        Text(age.toString(), style: textStyle1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  if (age < 1) {
                                    return 0;
                                  }
                                  age--;
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: activeColor,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {});
              rezult = calculateBMI(ves, height);
              rezultDetali = getInterpretation(BMI);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: inActiveColor,
                  content: Expanded(
                    child: Container(
                      color: inActiveColor,
                      height: 200.0,
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Результат',
                            style: textStyle1,
                          ),
                          Text(
                            rezult.toString(),
                            style: textStyle1,
                          ),
                          Text(
                            rezultDetali,
                            style: textStyle1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Закрыть'))
                  ],
                ),
              );
            },
            child: Container(
              child: Center(
                  child: Text(
                'Результат',
                style: textStyle3,
              )),
              width: double.infinity,
              height: 80.0,
              color: activeColor,
              margin: const EdgeInsets.only(top: 10.0),
            ),
          )
        ],
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const <Widget>[
      Icon(
        FontAwesomeIcons.mars,
        size: 80.0,
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        'Эркек',
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      )
    ],
  );
}
