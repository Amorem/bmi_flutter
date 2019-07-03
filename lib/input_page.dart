import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconCard.dart';
import 'reusableCard.dart';
import 'constants.dart';

enum GenderEnum { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderEnum selectGender;
  int height = 180;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      ? kActiveCardColor
                      : kInactiveCardColor,
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
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  cardChild: CardChildWithIcon(
                    icon: FontAwesomeIcons.venus,
                    text: "FEMALE",
                  ),
                ))
              ],
            )),
            Expanded(
                child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "HEIGHT",
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
                        "cm",
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0XFF8D8E98),
                        thumbColor: Color(0XFFEB1555),
                        overlayColor: Color(0X29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (val) {
                        setState(() {
                          height = val.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
              couleur: kActiveCardColor,
            )),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "WEIGHT",
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            callback: () {
                              this.setState(() {
                                weight = weight + 1;
                              });
                            },
                          ),
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            callback: () {
                              this.setState(() {
                                weight = weight - 1;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  couleur: kActiveCardColor,
                )),
                Expanded(
                    child: ReusableCard(
                  couleur: kActiveCardColor,
                ))
              ],
            )),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.callback});
  final IconData icon;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () {
        callback();
      },
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 50.0, height: 50.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Color(0XFF4C4F5E),
    );
  }
}
