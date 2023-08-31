// import 'package:flutter/material.dart';

// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final ExerciseData? packageData;

//   MyAppBar({required this.packageData});

//   @override
//   Size get preferredSize => Size.fromHeight(150);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text('Second Activity'),
//       flexibleSpace: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Colors.black.withOpacity(0.9),
//               Colors.black.withOpacity(0.2),
//             ],
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             packageData != null
//                 ? PackageGlobal(
//                     text: packageData!.image,
//                     text2: packageData!.name,
//                     numb: 1,
//                   )
//                 : const Text(
//                     'Name not available',
//                     style: TextStyle(fontSize: 24),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }