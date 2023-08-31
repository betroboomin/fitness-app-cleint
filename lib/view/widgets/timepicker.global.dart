import 'package:fitness2/utils/global.colors.dart';
import 'package:flutter/material.dart';

class MyTimePicker extends StatefulWidget {
  @override
  _MyTimePickerState createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State<MyTimePicker> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (newTime != null) {
      setState(() {
        _selectedTime = newTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
        Text(
          'Selected time: ${_selectedTime.format(context)}',
        ),
        SizedBox(height: 15),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: GlobalColors.mainColor
            ),
            onPressed: () => _selectTime(context),
            child: Container(
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                    Icon(
                    Icons.lock_clock
                    ),
                  Text('Select time'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}