import 'package:fitness2/utils/global.colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateViewer extends StatefulWidget {
  const DateViewer({Key? key}) : super(key: key);

  @override
  State<DateViewer> createState() => _DateViewerState();
}

class _DateViewerState extends State<DateViewer> {
  late DateTime _startDate;
  late DateTime _endDate;

  _DateViewerState() {
    _startDate = DateTime.now().subtract(Duration(days: DateTime.now().weekday));
    _endDate = _startDate.add(Duration(days: 6));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
    //     boxShadow: const [
    //   BoxShadow(
    //     color: Color.fromARGB(40, 158, 158, 158),
    //     spreadRadius: 2,
    //     blurRadius: 7,
    //     // offset: Offset(0, 3),
    //   ),
    // ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _startDate = _startDate.subtract(Duration(days: 7));
                    _endDate = _endDate.subtract(Duration(days: 7));
                  });
                },
              ),
              Text(
                '${DateFormat('MMM d').format(_startDate)} - ${DateFormat('MMM d').format(_endDate)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  setState(() {
                    _startDate = _startDate.add(Duration(days: 7));
                    _endDate = _endDate.add(Duration(days: 7));
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 7; i++)
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: DateTime.now().day == _startDate.add(Duration(days: i)).day
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          color:GlobalColors.mainColor,
                        )
                      : null,
                  child: Text(
                    DateFormat('EEE').format(_startDate.add(Duration(days: i))),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: DateTime.now().day == _startDate.add(Duration(days: i)).day
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 7; i++)
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: DateTime.now().day == _startDate.add(Duration(days: i)).day
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          color: GlobalColors.mainColor,
                        )
                      : null,
                  child: Text(
                    DateFormat('d').format(_startDate.add(Duration(days: i))),
                    style: TextStyle(
                      fontWeight: DateTime.now().day == _startDate.add(Duration(days: i)).day
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: DateTime.now().day == _startDate.add(Duration(days: i)).day
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}