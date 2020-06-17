import 'package:bmi_calculator/bmiEquation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cardContent.dart';
import 'smallBox.dart';
import 'constant.dart';
import 'resultScreen.dart';
import 'downButton.dart';

void main() => runApp(BMICalculator());

enum Gender { male, female }

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        backgroundColor: kBackGroundColor,
        primaryColor: kPrimaryThemeColor,
        scaffoldBackgroundColor: kScaffoldBackgroundColor,
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color colorOfSelected = kColorOfCard;
  Gender gender;
  int height = 180;
  int weight = 1;
  int age = 1;

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
                SmallBox(
                    updateSelector: () {
                      setState(() {
                        gender = Gender.male;
                      });
                    },
                    colour: gender == Gender.male
                        ? kSelectedColorOfCard
                        : colorOfSelected,
                    cardWidget: CardContent(
                      icon: FontAwesomeIcons.male,
                      name: "Male",
                    )),
                SmallBox(
                    updateSelector: () {
                      setState(() {
                        gender = Gender.female;
                      });
                    },
                    colour: gender == Gender.female
                        ? kSelectedColorOfCard
                        : colorOfSelected,
                    cardWidget: CardContent(
                      icon: FontAwesomeIcons.female,
                      name: "Female",
                    ))
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                SmallBox(
                  colour: kColorOfCard,
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Height',
                        style: GoogleFonts.atma(fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(), style: kHeightFontStyle),
                          Text(' cm')
                        ],
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            thumbColor: Colors.amber,
                            overlayColor: Color(0x29e5ed0b),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 18.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30),
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 100.0,
                              max: 300,
                              onChanged: (double h) {
                                setState(() {
                                  height = h.toInt();
                                });
                              }),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                SmallBox(
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Weight',
                        style: GoogleFonts.atma(fontSize: 20.0),
                      ),
                      Text(
                        weight.toString(),
                        style: kHeightFontStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              }),
                        ],
                      )
                    ],
                  ),
                  colour: kColorOfCard,
                ),
                SmallBox(
                  cardWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Age ',
                        style: GoogleFonts.atma(fontSize: 20.0),
                      ),
                      Text(
                        age.toString(),
                        style: kHeightFontStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(
                                () {
                                  age--;
                                },
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  colour: kColorOfCard,
                )
              ],
            ),
          ),
          DownButton(
              onTap: () {
                setState(() {
                  BmiEquation calc =
                      BmiEquation(weight: weight, height: height);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ResultScreen(result: calc.calculateBmi()),
                    ),
                  );
                });
              },
              buttonName: "Calculate BMI"),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 3.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 40,
        height: 40,
      ),
      shape: CircleBorder(),
      fillColor: Colors.white10,
    );
  }
}
