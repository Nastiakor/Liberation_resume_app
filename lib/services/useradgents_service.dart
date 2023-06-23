import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:convert/convert.dart';
import 'package:cv_flutter_libe/models/useradgents.dart';

class UseradgentsService {
  static Future<http.Response> fetchUseradgentsFeed() async {
    print(http.get(
        Uri.parse('https://www.useradgents.com/api/wp-json/v1/posts')));
    return http.get(
        Uri.parse('https://www.useradgents.com/api/wp-json/v1/posts'));
  }
}



