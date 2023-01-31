import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getxflutterapp/screens/controller/main_controller.dart';
import 'package:getxflutterapp/screens/utils.dart';

class Registration extends StatefulWidget {
  Registration({
    Key key,
  }) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final MainController mainController = Get.put(MainController());

  bool firstClicked = true, secondClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: pageBody(),
        ),
      ),
      // bottomNavigationBar: registerBtn(),
    );
  }

  Widget pageBody() {
    return Container(
        child: Column(children: [
      Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.2,
                  0.5,
                  0.5,
                  0.9,
                ],
                colors: [
                  Color(0Xff002b8a),
                  Color(0Xff016786),
                  Color(0Xff016786),
                  Color(0Xff04dc82),
                ],
              )),
              // color: const Color(0xff077a60),
              child: Column(
                children: [
                  SizedBox(height: 70),
                  Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                  SizedBox(height: 10),
                  Container(
                      child: Text(
                    "Hello! Signup to get started",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )),
                  SizedBox(height: 70),
                ],
              )),
          Container(margin: EdgeInsets.only(top: 170), child: userTabWidget())
        ],
      ),
      Obx(
        () => mainController.firstClicked.value
            ? userForm()
            : Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Column(
                  children: [
                    tableHeader(),
                    tableDetails(),
                  ],
                ),
              ),
      ),
      SizedBox(
        height: 20,
      ),
    ]));
  }

  Widget userTabWidget() {
    double btnTop = 10.0;
    double btnBottom = 10.0;
    return Container(
      padding:
          EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0, bottom: 10.0),
      child: Material(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          elevation: 4.0,
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    onTap: () {
                      mainController.firstClicked.value = true;
                      mainController.updateTab();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: (mainController.firstClicked.value)
                            ? const Color(0Xff016786)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      padding: EdgeInsets.only(top: btnTop, bottom: btnBottom),
                      child: Text(
                        "User Form",
                        style: (mainController.firstClicked.value)
                            ? TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)
                            : TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      mainController.firstClicked.value = false;
                      mainController.updateTab();
                      mainController.fetchUsers();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: (mainController.secondClicked.value)
                            ? const Color(0Xff016786)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      padding: EdgeInsets.only(top: btnTop, bottom: btnBottom),
                      child: Text(
                        "Registered Users",
                        style: (mainController.secondClicked.value)
                            ? TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)
                            : TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            );
          })),
    );
  }

  Widget userForm() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 30),
      child: Column(
        children: [
          //UserForm
          Column(
            children: [
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color(0xff077a60).withOpacity(0.2),
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    color: Colors.white),
                padding:
                    EdgeInsets.only(left: 25.0, top: 1, bottom: 1, right: 25),
                child: Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Image.asset(
                        'assets/images/user1.png',
                        height: 15,
                        width: 15,
                        color: const Color(0xff077a60),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: TextFormField(
                          controller: mainController.firstName,
                          enableInteractiveSelection: false,
                          decoration: inputBoxFieldDecoration('Name *'),
                          style: inputLabelStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: const Color(0xff077a60).withOpacity(0.2),
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                    color: Colors.white),
                padding:
                    EdgeInsets.only(left: 25.0, top: 1, bottom: 1, right: 25),
                child: Row(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Image.asset(
                        'assets/images/envelope.png',
                        height: 20,
                        width: 20,
                        color: const Color(0xff077a60),
                      ),
                    ),
                    Expanded(
                      flex: 9,
                      child: Container(
                        padding: EdgeInsets.only(left: 15),
                        child: TextFormField(
                          controller: mainController.email,
                          keyboardType: TextInputType.emailAddress,
                          enableInteractiveSelection: false,
                          decoration:
                              inputBoxFieldDecoration('youremail@domain.com'),
                          style: inputLabelStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: const Color(0xff077a60).withOpacity(0.2),
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      color: Colors.white),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Obx(() {
                    return Row(
                      children: [
                        Expanded(flex: 2, child: Text("My Status:")),
                        Expanded(
                          flex: 6,
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: Text("Status"),
                            underline: SizedBox(),
                            items: [
                              'Active',
                              'Inactive',
                            ]
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ))
                                .toList(),
                            value: mainController.dropdownvalue.value,
                            onChanged: (value) {
                              mainController.dropdownvalue.value = value;
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down_sharp,
                            ),
                            buttonHeight: 50,
                          ),
                        ),
                      ],
                    );
                  })),
              SizedBox(height: 20),
              Container(
                  child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender *",
                        style: TextStyle(fontSize: 15),
                      )),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Obx(() {
                        return Expanded(
                          flex: 3,
                          child: InkWell(
                            onTap: () {
                              mainController.gender = "Male";
                              mainController.updateGender();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: (mainController.genderMale.value)
                                        ? Colors.white
                                        : const Color(0xff077a60)
                                            .withOpacity(0.2)),
                                color: (mainController.genderMale.value)
                                    ? const Color(0Xff016786)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 15, right: 15),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/male.png',
                                    height: 22,
                                    width: 22,
                                    color: (mainController.genderMale.value)
                                        ? Colors.white
                                        : Colors.black54,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Male",
                                    style: (mainController.genderMale.value)
                                        ? TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white)
                                        : TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                      SizedBox(width: 15),
                      Obx(() {
                        return Expanded(
                          flex: 3,
                          child: InkWell(
                            onTap: () {
                              mainController.gender = "Female";
                              mainController.updateGender();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: (mainController.genderFemale.value)
                                        ? Colors.white
                                        : const Color(0xff077a60)
                                            .withOpacity(0.2)),
                                color: (mainController.genderFemale.value)
                                    ? const Color(0Xff016786)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.only(
                                  top: 20, bottom: 20, left: 15, right: 15),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/female.png',
                                    height: 22,
                                    width: 22,
                                    color: (mainController.genderFemale.value)
                                        ? Colors.white
                                        : Colors.black54,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Female",
                                    style: (mainController.genderFemale.value)
                                        ? TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white)
                                        : TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 30),
                  registerBtn(),
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }

  Widget tableDetails() {
    return Obx(() {
      if (mainController.isLoading.value) {
        return Container();
      } else {
        return Container(
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: mainController.myUserList.length,
            itemBuilder: (context, index) {
              return Table(
                columnWidths: {
                  0: FlexColumnWidth(1.0),
                  1: FlexColumnWidth(2.0),
                  2: FlexColumnWidth(1.0),
                },
                border: TableBorder.all(width: 1.0, color: Colors.black12),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            mainController.myUserList[index].id
                                .toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            mainController.myUserList[index].name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            mainController.myUserList[index].status,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        );
      }
    });
  }

  Widget tableHeader() {
    return Table(
        columnWidths: {
          0: FlexColumnWidth(1.0),
          1: FlexColumnWidth(2.0),
          2: FlexColumnWidth(1.0),
        },
        border: TableBorder(
            top: BorderSide(width: 1.0, color: Colors.black12),
            left: BorderSide(width: 1.0, color: Colors.black12),
            right: BorderSide(width: 1.0, color: Colors.black12),
            verticalInside: BorderSide(width: 1.0, color: Colors.black12)),
        children: [
          TableRow(
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            children: [
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Id',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Status',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          )
        ]);
  }

  void _showSuccessDialog() {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Success!!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(
              'User has been registered successfully',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                "Okay",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () async {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }

  Widget registerBtn() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.2,
              0.5,
              0.5,
              0.9,
            ],
            colors: [
              Color(0Xff002b8a),
              Color(0Xff016786),
              Color(0Xff016786),
              Color(0Xff04dc82),
            ],
          )),
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 15.0, right: 15.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 0.0,
        onPressed: () {
          if (mainController.validateInputs()) {
            mainController.register();
            _showSuccessDialog();
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        textColor: Colors.white,
        color: Colors.transparent,
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Register",
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
