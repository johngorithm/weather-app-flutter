import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ApiService {
  final String url;
  var data;

  ApiService({this.url});

  Future<dynamic> getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      data = convert.jsonDecode(response.body);
      return data;
    }

    return null;
  }

}