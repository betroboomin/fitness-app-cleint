import 'dart:ffi' as ui;

import 'package:fitness2/utils/global.colors.dart';
import 'package:fitness2/view/timer.view.dart';
import 'package:fitness2/view/widgets/exerciseSnippet.global.dart';
import 'package:fitness2/view/widgets/footer.global.dart';
import 'package:fitness2/view/widgets/whitebutton.global.dart';
import 'package:fitness2/view/widgets/wtextimage.global.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PackageData {
  final String name;
  final String image;

  PackageData({
    required this.name,
    required this.image,
  });
}

class ExerciseData {
  final String name;
  final String image;
  final List<String> exNames;
  final List<String> exID;

  ExerciseData({
    required this.exNames,
    required this.exID,
    required this.name,
    required this.image,
  });
}

class SecondActivity extends StatefulWidget {
  // final String id;
  final String categoryIds;

  SecondActivity({required this.categoryIds});

  @override
  _SecondActivityState createState() => _SecondActivityState();
}

class _SecondActivityState extends State<SecondActivity> {
  // final List<String> levelId;
  ExerciseData? packageData;
  // ExerciseData? exerciseData;
  List<ExerciseData> packageDataList = [];
  String? exerciseIds;

  @override
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  void fetchDataFromServer() async {
    try {
      final response = await http.get(
        Uri.parse(
          'http://192.168.229.195:4000/exercisecategory/${widget.categoryIds}',
        ),
      );
      if (response.statusCode == 200) {
        // Handle the response data here
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String name = responseData['name'];
        final String image =
            'http://192.168.229.195:4000${responseData['imageUrl']}';

        final List<dynamic> categoriesData =
            responseData['exercises'] as List<dynamic>;
        final List<String> exNames = categoriesData
            .map((category) => category['name'].toString())
            .toList();
        final List<String> exID = categoriesData
            .map((category) => category['_id'].toString())
            .toList();

        final ExerciseData data =
            ExerciseData(name: name, exNames: exNames, image: image, exID:exID);

        setState(() {
          packageData = data;
        });
      } else {
        // Handle error if the request is not successful
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that may occur during the request
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // fetchDataFromServer();
    final String appBarTitle =
        packageData != null ? packageData!.name : 'SWEATSQUAD';
    return Scaffold(
      
      appBar: MyCustomAppBar(
        packageData: packageData,
        customTitle: 'Custom Title Here', // Provide a custom title
      ),
      body: SingleChildScrollView(
              child: SafeArea( child:
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // packageData != null
            //     ? PackageGlobal(
            //         text: packageData!.image, text2: packageData!.name, numb: 1)
            //     : const Text(
            //         'Name not available',
            //         style: TextStyle(fontSize: 24),
            //       ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text('${packageData?.exNames.length ?? 0} Exercises ',
              style: TextStyle(
                color: GlobalColors.mainColor,
                fontSize: 25,
                fontWeight: FontWeight.w700
              ),),
            ),
            // packageData != null
            //     ? ExerciseGlobal(image: packageData!.image, text: 'text')
            //     : const Text(
            //         'Name not available',
            //         style: TextStyle(fontSize: 24),
            //       ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: packageData?.exNames.length ?? 0,
              itemBuilder: (context, index) {
                final exerciseName = packageData?.exNames[index] ?? '';
                final exerciseIds = packageData?.exID[index] ?? '';
                // final packageData = packageDataList[index];
                // final List<String> exerciseNames = packageData.exNames;

                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => CountdownTimer(exerciseIds: exerciseIds)),
);

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text(
                        //   exerciseName, // Display the exercise name from exNames
                        //   style: TextStyle(
                        //       fontSize: 20, fontWeight: FontWeight.w700),
                        // ),
                        const SizedBox(height: 6),
                        ExerciseGlobal(
                          image:
                              packageData!.image, // Pass the imageUrl as 'text'
                          text:
                              exerciseName, // Pass the category name as 'text2'
                        ),
                        
                        // ElevatedButton(
                        //   child: Text('Go to Second Activity'),
                        //   onPressed: () {
                        //     //   Navigator.push(
                        //     //     context,
                        //     //     MaterialPageRoute(
                        //     //       builder: (context) => SecondActivity( levelId: packageData.levelId),
                        //     //     ),
                        //     //   );
                        //   },
                        // ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
        ),
        ),
        bottomNavigationBar: SizedBox(
          height: 125,
          child: Column(
            
            children: [
              WhiteButtonGlobal(text: 'start', onTap: () {
//                  Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => CountdownTimer(exerciseIds: exerciseIds)),
// );
              },),
              const SizedBox(height: 8),
              const FooterGlobal(),
            ],
          ),
        ),
     
    );
  }
}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ExerciseData? packageData;
  final String customTitle;

  MyCustomAppBar({required this.packageData, required this.customTitle});

  @override
  Size get preferredSize => Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('SWEATSQUAD',
      style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.2),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            packageData != null
                ? PackageGlobal(
                    text: packageData!.image,
                    text2:'',
                    numb: 1,
                  )
                : const Text(
                    'Name not available',
                    style: TextStyle(fontSize: 24),
                  ),
          ],
        ),
      ),
    );
  }
}
