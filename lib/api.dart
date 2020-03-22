import 'dart:convert';

import 'package:corona/model.dart';
import 'package:http/http.dart' as http;

final String url =
    "https://coronavirus-monitor.p.rapidapi.com/coronavirus/cases_by_country.php";

Future<WorldStat> getStat() async {
  WorldStat worldStat;
  var response = await http.get(Uri.parse(url), headers: {
    "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
    "x-rapidapi-key": "83fcbd9c1cmsh8ddf3f599cbb2c8p1cb9f2jsnd7b1946d6e23"
  });
  var convertDataToJson = json.decode(response.body);
  worldStat = WorldStat.fromJson(convertDataToJson);
  return worldStat;
}

Future<SearchCountry> searchCountry(String country) async {
  String url;
  url =
      "https://coronavirus-monitor.p.rapidapi.com/coronavirus/latest_stat_by_country.php?country=$country";
  SearchCountry searchCountry;
  var response = await http.get(Uri.parse(url), headers: {
    "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
    "x-rapidapi-key": "83fcbd9c1cmsh8ddf3f599cbb2c8p1cb9f2jsnd7b1946d6e23"
  });
  var convertDataToJson = json.decode(response.body);
  searchCountry = SearchCountry.fromJson(convertDataToJson);
  return searchCountry;
}

Future<World> getWorldStat()async {
  String url;
  url = "https://coronavirus-monitor.p.rapidapi.com/coronavirus/worldstat.php";
  World world;
  var response = await http.get(Uri.parse(url), headers: {
    "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
    "x-rapidapi-key": "83fcbd9c1cmsh8ddf3f599cbb2c8p1cb9f2jsnd7b1946d6e23"
  });
  var convertDataToJson = json.decode(response.body);
  world= World.fromJson(convertDataToJson);
  return world;
}
