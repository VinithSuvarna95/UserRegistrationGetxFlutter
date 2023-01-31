import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:getxflutterapp/screens/modal/postDataModel.dart';
import 'package:http/http.dart' as http;

class ApiServices {
final String getEndpoint = "https://gorest.co.in/public/v2/users/";
final String postEndpoint = "https://gorest.co.in/public/v2/users/";
final  headers = {
        'Content-Type': 'application/json',
        "Authorization":
            "Bearer 4e0695b4ae2e108786586d9f086cd04732e05112553852c79e04daf6960faa4d",
      };
      
    
      
  // static Future<List<UserDataModel>> fetchUsers() async {
  //   dynamic response =
  //       await http.get(Uri.parse("https://gorest.co.in/public/v2/users/"));
  //   if (response.statusCode == 200) {
  //     var responseJson = response.body;
  //     return userDataModelFromJson(responseJson);
  //   }
  // }
}
