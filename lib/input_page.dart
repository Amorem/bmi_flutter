import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconCard.dart';
import 'reusableCard.dart';

const bottomContainerColor = Color(0XFFEB1555);
const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0XFF111328);
bool maleCardActivated = false;
bool femaleCardActivated = false;

enum GenderEnum { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateColor(GenderEnum gender) {
    maleCardActivated =
        (gender == GenderEnum.male) ? !maleCardActivated : false;
    femaleCardActivated =
        (gender == GenderEnum.female) ? !femaleCardActivated : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() => updateColor(GenderEnum.male));
                  },
                  child: ReusableCard(
                    couleur:
                        maleCardActivated ? activeCardColor : inactiveCardColor,
                    cardChild: CardChildWithIcon(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                  ),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() => updateColor(GenderEnum.female));
                  },
                  child: ReusableCard(
                    couleur: femaleCardActivated
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: CardChildWithIcon(
                      icon: FontAwesomeIcons.venus,
                      text: "FEMALE",
                    ),
                  ),
                ))
              ],
            )),
            Expanded(
                child: ReusableCard(
              couleur: activeCardColor,
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  couleur: activeCardColor,
                )),
                Expanded(
                    child: ReusableCard(
                  couleur: activeCardColor,
                ))
              ],
            )),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
