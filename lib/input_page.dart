import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusableCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

const bottomContainerColour = Color(0xFFEB1555);
const activecardcolour = Color(0xFF1D1E33);
const inactivecardcolour = Color(0xFF111328);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var selectedgender;
  int height = 180;
  int weight = 60;
  int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    child: Builder(
                      builder: (context) => ReusableCard(
                        colour: selectedgender == Gender.male
                            ? activecardcolour
                            : inactivecardcolour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: "Male",
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    //we can also remove gesture detector and add in ReusableCard page by adding a function of onPress just same as
                    // we add cardChild and color so we dont have to write Gesture Detector multiple time
                    // we can just add onefunction of onPress(can give whatever name we like) and it will work
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    child: Builder(
                      builder: (context) => ReusableCard(
                        colour: selectedgender == Gender.female
                            ? activecardcolour
                            : inactivecardcolour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: "Female",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),

               Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),

                ],
              ),
            ),
          ),
          // Expanded(
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: ReusableCard(
          //           colour: activecardcolour,
          //           cardChild: IconContent(), // Column
          //         ),
          //       ),
          //       Expanded(
          //         child: ReusableCard(
          //           colour: activecardcolour,
          //           cardChild: IconContent(),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            height: 50,
            color: bottomContainerColour,
          ),
        ],
      ),
    );
  }
}

//Specialise Widget to reuse the set of code
