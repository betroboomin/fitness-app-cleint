
import 'package:fitness2/utils/global.colors.dart';
import 'package:flutter/material.dart';
class WheelList extends StatefulWidget {
  const WheelList({
    Key? key,
    required this.itemCount,
    this.itemExtent = 100,
  }) : super(key: key);

  final int itemCount;
  final double itemExtent;

  @override
  _WheelListState createState() => _WheelListState();
}

class _WheelListState extends State<WheelList> {
  Color _buttonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final items = List<Widget>.generate(
      widget.itemCount,
      (index) => GestureDetector(
        onTap: () {
          setState(() {
            // change the button color to red when it is tapped
            _buttonColor = Colors.red;
          });
        },
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: _buttonColor,
          ),
          child: Text(
            '${index + 1}',
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {},
        ),
      ),
    );

    return SizedBox(
      height: 400,
      child: ListWheelScrollView(
        itemExtent: widget.itemExtent,
        clipBehavior: Clip.antiAlias,
        children: items,
      ),
    );
  }
}