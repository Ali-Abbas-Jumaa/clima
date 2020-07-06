import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({@required this.url});
  var url;
  Future getData() async {
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      print(res.body);
      return jsonDecode(res.body);
    } else {
      print(res.statusCode);
    }
    print(res.body);
    // var temperature = jsonDecode(res.body)['main']['temp'];
    // var condition = jsonDecode(res.body)['weather'][0]['id'];
    // var cityName = jsonDecode(res.body)['name'];
    // print([temperature, condition, cityName]);
  }
}
