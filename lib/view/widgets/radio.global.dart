import 'package:flutter/material.dart';

class RadioButton<T> extends StatefulWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?> onChanged;
  final String label;

  RadioButton({
    required this.value,
    required this.onChanged,
    required this.label,
    required this.groupValue,
  });

  @override
  _RadioButtonState createState() => _RadioButtonState<T>();
}

class _RadioButtonState<T> extends State<RadioButton<T>> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(widget.value);
      },
      child: Row(
        children: <Widget>[
          Radio<T>(
            value: widget.value,
            groupValue: widget.groupValue,
            onChanged: widget.onChanged,
          ),
          Text(widget.label),
        ],
      ),
    );
  }
}