import 'dart:convert';

import 'package:flutter_crud/models/cases.dart';
import 'package:http/http.dart';

class ApiService {
  final String apiUrl = "https://api.10andar.gestaobytes.com/api/v1/admin/clients/1";

  Future<List<Cases>> getCases() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Cases> cases = body.map((dynamic item) => Cases.fromJson(item)).toList();
      return cases;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Cases> getCaseById(String id) async {
    final response = await get(Uri.parse('$apiUrl/$id'));

    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<Cases> createCase(Cases cases) async {
    Map data = {
      'name': cases.name,
      'lastname': cases.lastname,
      'birthdate': cases.birthdate,
      'age': cases.age,
      'salarary': cases.salarary,
      'description': cases.description,
    };

    final Response response = await post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  Future<Cases> updateCases(String id, Cases cases) async {
    Map data = {
      'name': cases.name,
      'lastname': cases.lastname,
      'birthdate': cases.birthdate,
      'age': cases.age,
      'salarary': cases.salarary,
      'description': cases.description,
    };

    final Response response = await put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a case');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete(Uri.parse('$apiUrl/$id'));

    if (res.statusCode == 200) {
      print("Case deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }

}