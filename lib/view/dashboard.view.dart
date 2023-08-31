import 'package:fitness2/view/ready.view.dart';
import 'package:fitness2/view/widgets/activity.global.dart';
import 'package:fitness2/view/widgets/appbar.global.dart';
import 'package:fitness2/view/widgets/button.global.dart';
import 'package:fitness2/view/widgets/carosel.global.dart';
import 'package:fitness2/view/widgets/courosel.global.dart';
import 'package:fitness2/view/widgets/dateCircle.global.dart';
import 'package:fitness2/view/widgets/dateviewer.global.dart';
import 'package:fitness2/view/widgets/footer.global.dart';
import 'package:fitness2/view/widgets/footerbutton.global.dart';
import 'package:fitness2/view/widgets/heigthpicker.global.dart';
import 'package:fitness2/view/widgets/timepicker.global.dart';
import 'package:fitness2/view/widgets/toggleButton.global.dart';
import 'package:fitness2/view/widgets/whitebutton.global.dart';
import 'package:fitness2/view/widgets/wtextimage.global.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'allexercises.view.dart';

class PackageData {
  final String id;
  final String text;
  final String text2;
  final List<String> imageUrl;
  final List<String> categoryIds;
  final List<String> categories;
  final List<String> levelId;

  PackageData({
    required this.id,
    required this.text,
    required this.text2,
    required this.imageUrl,
    required this.categories,
    required this.levelId,
    required this.categoryIds,
  });
}

class SubPackage {
  final String name;
  final String image;

  SubPackage({
    required this.name,
    required this.image,
  });
}

class DashboardView extends StatefulWidget {
  @override
  _MyImageWidgetState createState() => _MyImageWidgetState();
}

class _MyImageWidgetState extends State<DashboardView> {
  // _MyImageWidgetState({super.key});
  final TextEditingController searchController = TextEditingController();
  late Future<Uint8List> _imageData;
  bool isRefreshing = false;

  List<PackageData> packageDataList = [];
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  Future<void> _handleRefresh() async {
    setState(() {
      isRefreshing = true;
    });
    await Future.delayed(Duration(seconds: 2));
    fetchDataFromServer();
    setState(() {
      isRefreshing = false;
    });
  }

  void fetchDataFromServer() async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.229.195:4000/exerciselevel'));
      if (response.statusCode == 200) {
        // Parse the response data (list of photos) into a List<dynamic>
        final List<dynamic> responseData = jsonDecode(response.body);
        final List<String> levelId =
            responseData.map((data) => data['_id'].toString()).toList();
        // Convert the list of dynamic data into a list of PackageData objects
        final List<PackageData> dataList = responseData.map((data) {
          final List<dynamic> categoriesData =
              data['categories'] as List<dynamic>;
          final List<String> categories = categoriesData
              .map((category) => category['name'].toString())
              .toList();
          final List<String> categoryIds = categoriesData
              .map((category) => category['_id'].toString())
              .toList();

          final List<String> imageUrl = categoriesData
              .map((category) =>
                  'http://192.168.229.195:4000${category['imageUrl']}'
                      .toString())
              .toList();

          return PackageData(
              text: data[
                  'name'], // Replace 'caption' with the actual key in your data
              text2:
                  'http://192.168.229.195:4000${data['imageUrl']}', // Replace 'imageUrl' with the actual key in your data
              imageUrl: imageUrl,
              categories: categories,
              levelId: levelId,
              id: data['_id'],
              categoryIds: categoryIds
              // Replace 'imageUrl' with the actual key in your data
              );
        }).toList();

        // Update the packageDataList with the fetched data using setState
        setState(() {
          packageDataList = dataList;
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
  void initState() {
    super.initState();
    fetchDataFromServer();
    _scrollController.addListener(() {
      setState(() {
        _isScrolled = _scrollController.offset > 0;
      });
    });

    // Call the function to fetch data when the widget initializes
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  //  void initState() {
  //   super.initState();
  //   _imageData = _loadImage();
  // }
  //  Future<Uint8List> _loadImage() async {
  //   final response = await http.get(Uri.parse('http://your-server.com/image'));
  //   if (response.statusCode == 200) {
  //     return response.bodyBytes;
  //   } else {
  //     throw Exception('Failed to load image');
  //   }
  // }
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _handleRefresh,
        child: MaterialApp(
          // backgroundColor: Colors.white,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.white,
            appBar: MyAppBar(
                searchController: searchController, title: 'SWEATSQUAD'),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, top: 15, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyCarousel(),
                        const SizedBox(height: 30),
                        // CourosalGlobal(),
                        // const SizedBox(height: 30),
                        DateViewer(),
                        const SizedBox(height: 30),
                        Text("7X4 CHALLENGE"),
                        const SizedBox(height: 6),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: packageDataList.length,
                          itemBuilder: (context, index) {
                            final packageData = packageDataList[index];
                            final List<String> categories =
                                packageData.categories;
                            final List<String> imageUrl = packageData.imageUrl;
                            final List<String> categoryIds =
                                packageData.categoryIds;

                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    packageData.text,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(height: 6),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: categories.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            top: 3.0, bottom: 3.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            // When tapped, navigate to SecondActivity and pass the 'id' argument
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SecondActivity(
                                                        categoryIds: categoryIds[index]
                                                        // packageData.id
                                                        ),
                                              ),
                                            );
                                          },
                                          child: PackageGlobal(
                                            text: imageUrl[
                                                index], // Pass the imageUrl as 'text'
                                            text2: categories[
                                                index],
                                                numb: .9, // Pass the category name as 'text2'
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(height: 30),
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
                            );
                          },
                        )
                      ],
                    )),
              ),
            ),
            bottomNavigationBar: const FooterGlobal(),
          ),
        ));
  }
}
