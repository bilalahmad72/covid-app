import 'dart:convert';
import 'package:covid_app/utils/utils.dart';

import '../models/WorldStatsModel.dart';
import 'package:http/http.dart' as http;

class WorldStatServices {
  Future<WorldStatsModel> fetchWorldStatsRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatsApi));

    if (response.statusCode == 200) {
      var worldStatsData = jsonDecode(response.body);
      return WorldStatsModel.fromJson(worldStatsData);
    } else {
      throw Exception('Error');
    }
  }
}
