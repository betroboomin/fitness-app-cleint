import 'package:http/http.dart' as http;

Future<http.Response> makeServerRequest(
    String url, Map<String, dynamic> requestData) async {
  final response = await http.post(Uri.parse(url), body: requestData);
  return response;
}
