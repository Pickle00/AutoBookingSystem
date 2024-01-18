// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:auto_booking/constants.dart';

class Repo {
  String input;
  Repo({required this.input});
  // Repo._();
// var uuid = Uuid();

  dynamic getSuggestions() async {
    // String input = 'Hetauda';

    var _placelist = [];
    print(input);
    try {
      String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request = '$baseURL?input=$input&key=$googleApiKey';
      var response = await http.get(Uri.parse(request));
      var data = json.decode(response.body);
      // print("datas");
      // print(data);

      if (response.statusCode == 200) {
        _placelist = data['predictions'];
        // print("This is place list");
        // print(_placelist);
      }
    } catch (e) {
      print('Failed to load predicitions');
    }
    return _placelist;
  }
}

// void main() async {
//   Repo repo = Repo();
//   await repo.getSuggestions();
// }
