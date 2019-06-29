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
  GenderEnum selectGender;

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
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectGender = GenderEnum.male;
                    });
                  },
                  couleur: selectGender == GenderEnum.male
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: CardChildWithIcon(
                    icon: FontAwesomeIcons.mars,
                    text: "MALE",
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectGender = GenderEnum.female;
                    });
                  },
                  couleur: selectGender == GenderEnum.female
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: CardChildWithIcon(
                    icon: FontAwesomeIcons.venus,
                    text: "FEMALE",
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
