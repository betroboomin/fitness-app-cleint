import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextEditingController searchController;

  const MyAppBar({Key? key, required this.title, required this.searchController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.w700),
      ),
      // actions: [
      //   Container(
      //     width: MediaQuery.of(context).size.width * 0.4,
      //     child: TextField(
      //       controller: searchController,
      //       style: TextStyle(color: Colors.white),
      //       decoration: InputDecoration(
      //         hintText: ' Search',
      //         fillColor: Color.fromARGB(28, 255, 255, 255),
      //         filled: true,
      //       ),
      //     ),
      //   ),
      //   IconButton(
      //     icon: Icon(Icons.search, color: Colors.black),
      //     onPressed: () {
      //       // Implement search functionality here
      //     },
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}