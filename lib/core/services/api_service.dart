import 'dart:async';
import 'dart:convert';
import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

enum RequestType { GET, POST, DELETE, PUT }

class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  ApiService._internal();

  http.Client client = http.Client();
  BaseRequest? request;

  Map<String, String>? _headers;

  Future<Response> requestApi({
    required RequestType requestType,
    required String endPoint,
    required BuildContext context,
    bool isMultiPartForm = false,
    Map<String, String>? fields,
    Map<String, String>? headers,
    String? token,
    dynamic parameter,
  }) async {
    try {
      _initHeaders();
      Uri url = Uri.parse("${RemoteConstants.BASE_URL}/$endPoint");
      switch (requestType) {
        case RequestType.GET:
          {
            final response = await http.get(url, headers: _headers);
            return response;
          }
        case RequestType.POST:
          {
            final response = await http.post(url,
                headers: _headers, body: json.encode(parameter));
            return response;
          }

        case RequestType.DELETE:
          {
            final response = await http.delete(url);
            return response;
          }
        case RequestType.PUT:
          {
            final response = await http.put(url,
                headers: _headers, body: json.encode(parameter));
            return response;
          }
      }
    } catch (e) {
      print("Error From API Service $e");
      throw ServerFailure(e.toString());
    }
  }

  void _initHeaders() {
    _headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "X-Requested-With",
      "Access-Control-Allow-Methods": "POST, OPTIONS, GET",
    };
  }
}
