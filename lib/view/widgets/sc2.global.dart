
import 'package:fitness2/utils/global.colors.dart';
import 'package:flutter/material.dart';
class WheelListHorizontal extends StatefulWidget {
  const WheelListHorizontal({
    Key? key,
    required this.itemCount,
    required this.itemExtent, 
  }) : super(key: key);

  final int itemCount;
  final double itemExtent;
  

  @override
  _WheelListState createState() => _WheelListState();
}

class _WheelListState extends State<WheelListHorizontal> {
  Color _buttonColor = GlobalColors.mainColor;

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
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: _buttonColor,
            ),
            child: Text(
              '${index + 1}',
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );

    return SizedBox(
      height: 60,
      child: ListView(
        itemExtent: widget.itemExtent,
        clipBehavior: Clip.antiAlias,
        scrollDirection: Axis.horizontal,
        children: items,
      ),
    );
  }
}