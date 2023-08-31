import "dart:convert";

import "package:fitness2/utils/global.colors.dart";
import "package:fitness2/view/intro.view.dart";
import "package:fitness2/view/widgets/button.global.dart";
import "package:fitness2/view/widgets/social.login.dart";
import "package:fitness2/view/widgets/text.form.global.dart";
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class SignView extends StatelessWidget {
  SignView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 80.0),
                    alignment: Alignment.center,
                    child: Text(
                      'logo',
                      style: TextStyle(
                          color: GlobalColors.mainColor,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 50),

                  Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  ///email input
                  TextFormGlobal(
                    controller: emailController,
                    text: 'Email',
                    obscure: false,
                    textInputType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 10),
                  TextFormGlobal(
                      controller: passwordController,
                      text: 'password',
                      textInputType: TextInputType.text,
                      obscure: true),

                  const SizedBox(height: 10),
                  TextFormGlobal(
                      controller: confirmpasswordController,
                      text: 'confirm password',
                      textInputType: TextInputType.text,
                      obscure: true),
                  // const SizedBox(height: 10),
                  // TextFormGlobal(
                  //     controller: confirmpasswordController,
                  //     text: 'confirm password',
                  //     textInputType: TextInputType.text,
                  //     obscure: false),

                  const SizedBox(height: 20),
                  ButtonGlobal(
                      text: 'sign up',
                      onTap: () /*async*/ {
                        // final url =
                        //     'http://192.168.1.124:4000/users'; // Replace with your API endpoint URL

                        // final response = await http.post(
                        //   Uri.parse(url),
                        //   headers: {'Content-Type': 'application/json'},
                        //   body: jsonEncode({
                        //     'email': emailController.text,
                        //     'password': passwordController.text,
                        //   }),
                        // );

                        // if (response.statusCode == 200) {
                        //   // Successful response
                        //   final data = jsonDecode(response.body);
                        //   print(data);
                        //   // ...
                        // } else {
                        //   // Request failed
                        //   print(
                        //       'Request failed with status: ${response.statusCode}');
                        // }

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => IntroView()),
                        );
                      }),

                  const SizedBox(height: 50),
                  const SocialLogin(text: '-or sign up with -'),

                  const SizedBox(height: 50),
                ],
              )),
        ),
      ),
    );
  }
}
