import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MainProvider with ChangeNotifier {
  //QUOTE PROVIDER
  final _urlQuotes = "https://zenquotes.io/api/random";

  String _actualQuote = "";
  String get quote => _actualQuote;
  String _actualAuthor = "";
  String get author => _actualAuthor;

  Future<void> updateQuote() async {
    var url = Uri.parse(_urlQuotes);
    var response = await http.get(url);
    final List list = json.decode(response.body);
    final res = list[0];
    _actualQuote = res['q'];
    _actualAuthor = res['a'];
    notifyListeners();
  }

  //IMAGE PROVIDER
  var _imageurl = "https://picsum.photos/id/${Random().nextInt(100)}/700/1000";
  get imageUrl => _imageurl;
  Future<void> updateImage() async {
    _imageurl = "https://picsum.photos/id/${Random().nextInt(100)}/700/1000";
    notifyListeners();
  }

  //TIME PROVIDER
  final _urlTime = "http://worldtimeapi.org/api/timezone";

  String _country = "Mexico";
  String get country => _country;
  String _time = "00:00:00";
  String get time => _time;

  Future<void> updateTime(String country) async {
    var preUrl = "http://worldtimeapi.org/api/timezone/America/Mexico_City";
    switch (country) {
      case "Andorra":
        preUrl = "http://worldtimeapi.org/api/timezone/Europe/Andorra";
        break;
      case "Mexico":
        preUrl = "http://worldtimeapi.org/api/timezone/America/Mexico_City";
        break;
      case "Peru":
        preUrl = "http://worldtimeapi.org/api/timezone/America/Lima";
        break;
      case "Canada":
        preUrl = "http://worldtimeapi.org/api/timezone/America/Vancouver";
        break;
      case "Argentina":
        preUrl =
            "http://worldtimeapi.org/api/timezone/America/Argentina/Buenos_Aires";
        break;
      default:
        preUrl = "http://worldtimeapi.org/api/timezone/America/Mexico_City";
    }
    var uri = Uri.parse(preUrl);
    var response = await http.get(uri);

    var res = json.decode(response.body);
    var pretime = res['datetime'].toString();
    var list = pretime.split('T');
    var list2 = list[1].split('.');
    _time = list2[0];
    _country = country;
    notifyListeners();
  }
}
