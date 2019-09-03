import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.1.103/bot.php";

class API {
  static Future getApps(String url) {
   
    return http.get(url);
  }
}