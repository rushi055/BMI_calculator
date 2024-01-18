import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusableCard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomContainerColour = Color(0xFFEB1555);
const activecardcolour = Color(0xFF1D1E33);
const inactivecardcolour = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactivecardcolour;
  Color femaleCardColour = inactivecardcolour;

  // 1 = male, 2 = female
  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactivecardcolour) {
        maleCardColour = activecardcolour;
        femaleCardColour = inactivecardcolour;
      } else {
        maleCardColour = inactivecardcolour;
      }
    }
    if (gender == 2) {
      if (femaleCardColour == inactivecardcolour) {
        femaleCardColour = activecardcolour;
        maleCardColour = inactivecardcolour;
      } else {
        femaleCardColour = inactivecardcolour;
      }
      // Add logic for female card color update if needed
    }
  }

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
                        updateColour(1);
                      });
                    },
                    child: Builder(
                      builder: (context) => ReusableCard(
                        colour: maleCardColour,
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
                    onTap: () {
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: Builder(
                      builder: (context) => ReusableCard(
                        colour: femaleCardColour,
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
          // Expanded(
          //   child: ReusableCard(
          //     colour: activecardcolour,
          //     cardChild: IconContent(
          //
          //     ),
          //   ),
          // ),
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
