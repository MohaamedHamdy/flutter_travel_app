import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_app/data/models/travel_model.dart';

class WebService {
  String baseUrl = 'http://mark.bslmeiyu.com/api';

  Future<List<travelModel>> fetchData() async {
    var apiUrl = '/getplaces';
    var response = await http.get(Uri.parse(baseUrl + apiUrl));

    var data = json.decode(response.body);

    List<travelModel> travelList = [];

    if (response.statusCode == 200) {

      for (var item in data) {
        travelModel TravelModel = travelModel.fromJson(item);
        travelList.add(TravelModel);
      }
      return travelList;
    }
    return [];
  }
}
