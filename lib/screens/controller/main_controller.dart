// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getxflutterapp/screens/modal/getDataModel.dart';
import 'package:getxflutterapp/screens/modal/postDataModel.dart';
import 'package:getxflutterapp/screens/utils.dart';
import 'package:getxflutterapp/services/apiServices.dart';
import 'package:http/http.dart' as http;

class MainController extends GetxController {
  var isLoading = true.obs;
  RxBool genderMale = true.obs,
      genderFemale = false.obs,
      genderOthers = false.obs,
      firstClicked = true.obs,
      secondClicked = false.obs,
      isSuccess = false.obs;
  var userList = List<UserDataModel>().obs;
  List userVal = [].obs;
  List<GetUserDataModel> myUserList = [];
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  RxString dropdownvalue = 'Active'.obs;
  String gender = "Male";
  static final RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  var apiData = Get.put(ApiServices());
  @override
  void onInit() {
    super.onInit();
  }

  updateTab() {
    if (firstClicked.value == true) {
      firstClicked.value = true;
      secondClicked.value = false;
    } else {
      firstClicked.value = false;
      secondClicked.value = true;
    }
    update();
  }

  updateGender() {
    if (gender == "Male") {
      genderMale.value = true;
      genderFemale.value = false;
      genderOthers.value = false;
    } else if (gender == "Female") {
      genderMale.value = false;
      genderFemale.value = true;
      genderOthers.value = false;
    } else {
      genderMale.value = false;
      genderFemale.value = false;
      genderOthers.value = true;
    }
  }

  void fetchUsers() async {
    isLoading(true);
    dynamic response = await http.get(
      apiData.getEndpoint,
      headers: apiData.headers,
    );
    if (response.statusCode == 200) {
      isLoading(false);
      var responseJson = json.decode(response.body);
      this.myUserList = List.generate(responseJson.length, (index) {
        return GetUserDataModel.fromJson(responseJson[index]);
      });
    }
  }

  void register() async {
    UserDataModel register = UserDataModel();
    register.name = firstName.text;
    register.email = email.text;
    register.status = dropdownvalue.value;
    register.gender = gender;

    dynamic response = await http.post(
      apiData.postEndpoint,
      headers: apiData.headers,
      body: json.encode(register.toJson()),
    );
    if (response.statusCode == 201) {
      isSuccess(true);
      var responseJson = response.body;
    } else {
      var responseJson = response.body;
      print(responseJson);
    }
  }

  String validateEmail(String value) {
    value = value.trim();
    if (!emailRegExp.hasMatch(value))
      return 'Enter valid email';
    else
      return null;
  }

  bool validateInputs() {
    String emailCheck = validateEmail(email.text);
    if (firstName.text.isEmpty) {
      showToast("Kindly enter your Name!");
      return false;
    } else if (email.text.isEmpty) {
      showToast("Kindly enter your Email!");
      return false;
    } else if (emailCheck != null) {
      showToast('Your email format is incorrect!');
      return false;
    } else {
      return true;
    }
  }
}
