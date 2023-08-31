import "package:fitness2/utils/global.colors.dart";
import "package:fitness2/view/signin.view.dart";
import "package:fitness2/view/widgets/button.global.dart";
import "package:fitness2/view/widgets/social.login.dart";
import "package:fitness2/view/widgets/text.form.global.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginView extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginView> {
  // LoginView({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> sendUserInput(String inputText, String password) async {
    final apiUrl = Uri.parse('http://192.168.1.156:3000/users');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'email': inputText, 'password': password});

    try {
      final response = await http.post(apiUrl, headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        // Handle successful response
        print('Success: ${responseBody['message']}');
      } else {
        final responseBody = json.decode(response.body);
        // Handle error response
        print('Error: ${responseBody['error']}');
      }
    } catch (e) {
      // Handle error
      print('Error sending HTTP request: $e');
    }
  }

  void sendmessage(String msg, String password) {
    final data = jsonEncode({'msg': msg, 'password': password});
    print(msg);
    print(password);
    WebSocketChannel channel;

    try {
      channel = WebSocketChannel.connect(Uri.parse('ws://192.168.1.156:3000/'));
      channel.sink.add(data);
      channel.stream.listen((data) {
         final todo = jsonDecode(data);
         
        print(todo['_id']);
      });
    } catch (e) {
      print(e);
    }
    emailController.clear();
  }

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
                      'Login to your account',
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

                  const SizedBox(height: 20),
                  ButtonGlobal(
                    text: 'Login',
                    onTap: () {
                      // if (_formKey.currentState?.validate() ?? false) {
                      //   final inputText = emailController.text;
                      //   final password = passwordController.text;
                      //   sendUserInput(inputText, password);
                      // }
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => SignView(),
                      //   ),
                      // );
                      if (emailController.text.isNotEmpty ||
                          passwordController.text.isNotEmpty) {
                        sendmessage(
                            emailController.text, passwordController.text);
                      }
                    },
                  ),

                  const SizedBox(height: 50),
                  SocialLogin(
                    text: '- or sign in with -',
                  ),

                  const SizedBox(height: 50),
                  Container(
                    alignment: Alignment.center,
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Dont have an account?'),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignView()),
                            );
                          },
                          child: Text(
                            'signup',
                            style: TextStyle(
                              color: GlobalColors.mainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
