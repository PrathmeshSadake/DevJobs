import 'dart:async';
import 'dart:convert';
import 'package:DevJobs/helpers/job_json_converter.dart';
import 'package:DevJobs/models/job.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Jobs extends ChangeNotifier {
  List<Job> allJobs = [];
  List<Job> searchedJobs = [];
  List<Job> categoryJobs = [];

  Future<List<Job>> getAllJobs() async {
    var response = await http.get('https://jobs.github.com/positions.json');
    var extractedData = json.decode(response.body);
    allJobs = [];
    extractedData
        .forEach((data) => JsonConverter().jsonConverter(data, allJobs));
    notifyListeners();
    print(allJobs.length);
    // allJobs.forEach((data) => print(data.title));
    return allJobs;
  }

  Future<List<Job>> searchJobs(String description) async {
    var response = await http
        .get('https://jobs.github.com/positions.json?description=$description');
    var extractedData = json.decode(response.body);
    searchedJobs = [];
    extractedData
        .forEach((data) => JsonConverter().jsonConverter(data, searchedJobs));
    notifyListeners();
    print(searchedJobs.length);
    return searchedJobs;
  }

  Future<List<Job>> categorizedJobs(String category) async {
    var response = await http
        .get('https://jobs.github.com/positions.json?description=$category');
    var extractedData = json.decode(response.body);
    categoryJobs = [];
    extractedData
        .forEach((data) => JsonConverter().jsonConverter(data, categoryJobs));
    notifyListeners();
    print(categoryJobs.length);
    return categoryJobs;
  }
}
