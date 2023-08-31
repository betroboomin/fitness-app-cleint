import 'package:fitness2/view/timer.view.dart';
import 'package:flutter/material.dart';

import '../dashboard.view.dart';

class FooterGlobal extends StatelessWidget {
  const FooterGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      height: 60,
     color: Colors.white,
          child: Container(
            height: 50.0,
            child: Padding(
              padding: const EdgeInsets.only(left:8.0, right:8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DashboardView()),
);
                    },
                  ),
                  Spacer(),
                  // IconButton(
                  //   icon: Icon(Icons.explore),
                  //   onPressed: () {},
                  // ),
                  // IconButton(
                  //   icon: Icon(Icons.person),
                  //   onPressed: () {},
                  // ),
                ],
              ),
            ),
          ),
        
    );
  }
}