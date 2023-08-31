import 'package:fitness2/utils/global.colors.dart';
import 'package:fitness2/view/wheretrain.view.dart';
import 'package:fitness2/view/widgets/button.global.dart';
import 'package:fitness2/view/widgets/radio.global.dart';
import 'package:fitness2/view/widgets/whitebutton.global.dart';
import 'package:flutter/material.dart';

class ChooseTrainingView extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ChooseTrainingView> {
  int? _selectedValue;

  void _handleRadioValueChanged(int? value) {
    setState(() {
      _selectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
          width: double.infinity,
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15, top: 15, bottom: 10),
          child: Column(
              children: <Widget>[
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.arrow_back),
              Text(
                'load',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text('4/8')
            ],
          ),
          const SizedBox(height: 10),
           const Text(
              "Choose your Training",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            ),
          
          const SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Do you consider your self active? how often do you train?",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                height: 1.5,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 8.0, top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 90,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Beginner",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "I don't train and want to start",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    RadioButton<int>(
                      value: 1,
                      groupValue: _selectedValue,
                      onChanged: _handleRadioValueChanged,
                      label: '',
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 8.0, top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 90,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Normal",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "I train 1- 2 times a week",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    RadioButton<int>(
                      value: 2,
                      groupValue: _selectedValue,
                      onChanged: _handleRadioValueChanged,
                      label: '',
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 8.0, top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 90,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Medium",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "I train 3-4 times a week",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    RadioButton<int>(
                      value: 3,
                      groupValue: _selectedValue,
                      onChanged: _handleRadioValueChanged,
                      label: '',
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 15,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 8.0, top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 90,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Advanced",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "I train 5 times a week or more",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    RadioButton<int>(
                      value: 4,
                      groupValue: _selectedValue,
                      onChanged: _handleRadioValueChanged,
                      label: '',
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 70),
          WhiteButtonGlobal(
            text: "Next",
            onTap: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WhereTrainView(),
                        ),
                      );
            },
          ),
          const SizedBox(height: 15),
                  ButtonGlobal(
                    text: "I'll do it latter",
                    onTap: () {
                      
                    },
                  ),
              ],
            ),
        ));
  }
}
