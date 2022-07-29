import 'dart:convert';
import 'package:covid_app/utils/utils.dart';

import '../models/WorldStatsModel.dart';
import 'package:http/http.dart' as http;

class WorldStatServices {
  Future<WorldStatsModel> worldStatApi() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatsApi));

    if (response.statusCode == 200) {
      var worldStatsData = jsonDecode(response.body);
      return WorldStatsModel.fromJson(worldStatsData);
    } else {
      throw Exception('Error');
    }
  }


  Future<List<dynamic>> countriesListApi() async {
    var countriesData;

    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
      countriesData = jsonDecode(response.body);
      return countriesData;
    } else {
      throw Exception('Error');
    }
  }
}
