import 'package:fitness2/utils/global.colors.dart';
import 'package:flutter/material.dart';

class MyWeightPicker extends StatefulWidget {
  @override
  _MyWeightPickerState createState() => _MyWeightPickerState();
}

class _MyWeightPickerState extends State<MyWeightPicker> {
  int _selectedWeight = 60;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Selected weight: $_selectedWeight kg',
        ),
        SizedBox(height: 20),
        Container(
          height: 300,
          child: ListWheelScrollView.useDelegate(
            itemExtent: 40,
            diameterRatio: 2,
            offAxisFraction: -0.5,
            physics: FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (BuildContext context, int index) {
                final weight = index + 40;
                final isSelected = weight == _selectedWeight;
                return Container(
                  decoration: BoxDecoration(
                    color: isSelected ? GlobalColors.mainColor : null,
                    border: isSelected
                        ? Border.all(width: 2, color: Colors.blue)
                        : null,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text('$weight kg',
                    style: TextStyle(
                      color: isSelected? Colors.white : Colors.black
                    ),),
                  ),
                );
              },
              childCount: 121,
            ),
            onSelectedItemChanged: (int index) {
              setState(() {
                _selectedWeight = index + 40;
              });
            },
          ),
        ),
      ],
    );
  }
}