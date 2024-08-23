import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ride_project/core/resources/colors.dart';
import 'package:ride_project/core/resources/string.dart';
import 'package:ride_project/core/widgets/app_Button.dart';

import 'createpassword.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

// var username;
// var userphone;

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fitrstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController birthDateeController = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  DateTime birthDateController = new DateTime.timestamp();
  bool termsAccepted = false;
  // String phoneNumber = '';
  bool showErrorName = false;
  bool showErrorPhone = false;
  bool showErrorLastname = false;
  bool showErrorfirstname = false;
  bool showErrorbirthdate = false;

  void login() {
    setState(() {
      showErrorName = nameController.text.isEmpty;
      showErrorPhone = phoneNumber.text.isEmpty;
      showErrorLastname = lastNameController.text.isEmpty;
      showErrorfirstname = fitrstNameController.text.isEmpty;
      showErrorbirthdate = birthDateeController.text.isEmpty;
    });

    if (!showErrorName &&
        !showErrorLastname &&
        !showErrorfirstname &&
        !showErrorPhone &&
        !showErrorbirthdate) {
      Navigator.pushNamed(context, '/CreatePassword',
          arguments: CreatePassword(
              fitrstName: fitrstNameController.text,
              lastName: lastNameController.text,
              username: nameController.text,
              phone: "8888899999",
              birthDate: DateTime(2020, 12, 11))
          // MaterialPageRoute(
          //   builder: (_) => BlocProvider.value(
          //     value: context.read<AutheBloc>()
          //       ..add(
          //         Register(
          //           user: SingUpModel(
          //             lastName: "enas",
          //             firstName: "esraa",
          //             phone: phoneNumber,
          //             username: nameController.text,
          //             birthDate: "2024-08-02",
          //           ),
          //         ),
          //       ),
          //     child: CreatePassword(
          //         fitrstName: "esra'a",
          //         lastName: 'enas',
          //         userName: nameController.text,
          //         mobail: phoneNumber,
          //         birthDate: DateTime(2024, 08, 02)
          //         ),
          //   ),
          // )
          );
      //   // Navigator.push(
      //   //     context,ar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
        // BlocProvider(
        //   create: (context) => AutheBloc()
        //     ..add(Register(
        //         user: SingUpModel(
        //             username: nameController.text, phone: phoneNumber))),
        // child:
        LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        appBar: AppBar(),
        body:
            // padd(
            //   paddnumber: constraints.maxHeight * 0.0015,
            //   paddwidget
            //   :
            Center(
          child: Container(
            height: constraints.minHeight * 0.90,
            width: constraints.minWidth * 0.80,
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Text(
                    titlesignup,
                    // style: TextStyle(
                    //     // fontSize: 18
                    //     fontSize: constraints.maxWidth * 0.035),
                  ),
                  // SizedBox(height: constraints.maxHeight * 0.008
                  //     // height: 20
                  //     ),
                  Container(
                    width: constraints.minWidth * 0.05,
                    height: constraints.minHeight * 0.1,
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(fontSize: constraints.maxWidth * 0.03),
                        labelText: NAME,
                        border: OutlineInputBorder(),
                        errorText:
                            showErrorName ? Please_enter_your_name : null,
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.minWidth * 0.05,
                    height: constraints.minHeight * 0.1,
                    child: TextFormField(
                      controller: fitrstNameController,
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(fontSize: constraints.maxWidth * 0.03),
                        labelText: Please_enter_your_firstname,
                        border: OutlineInputBorder(),
                        errorText: showErrorfirstname
                            ? Please_enter_your_firstname
                            : null,
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.minWidth * 0.05,
                    height: constraints.minHeight * 0.1,
                    child: TextFormField(
                      controller: lastNameController,
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(fontSize: constraints.maxWidth * 0.03),
                        labelText: Please_enter_your_lastname,
                        border: OutlineInputBorder(),
                        errorText: showErrorLastname
                            ? Please_enter_your_lastname
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(
                      // height: 20
                      height: constraints.maxHeight * 0.008),

                  SizedBox(height: constraints.maxHeight * 0.008
                      // height: 20
                      ),
                  Container(
                    width: constraints.minWidth * 0.05,
                    height: constraints.maxHeight * 0.15,
                    child: IntlPhoneField(
                      decoration: InputDecoration(
                        labelText: Phone,
                        border: OutlineInputBorder(),
                        errorText: showErrorPhone
                            ? Please_enter_your_phone_number
                            : null,
                      ),
                      initialCountryCode: US,
                      onChanged: (phone) {
                        phoneNumber.text = phone.completeNumber;
                        if (phone.completeNumber.isNotEmpty) {
                          setState(() {
                            showErrorPhone = false;
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    width: constraints.minWidth * 0.05,
                    height: constraints.minHeight * 0.1,
                    child: TextFormField(
                      controller: birthDateeController,
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(fontSize: constraints.maxWidth * 0.03),
                        labelText: birthDatee,
                        border: OutlineInputBorder(),
                        errorText: showErrorbirthdate
                            ? Please_enter_your_birth_date
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.01
                      // height: 20
                      ),
                  // Container(
                  //   width: constraints.minWidth * 0.05,
                  //   height: constraints.maxHeight * 0.1,
                  //   child: DropdownButtonFormField<String>(
                  //     value: selectedGender,
                  //     decoration: InputDecoration(
                  //       labelStyle:
                  //           TextStyle(fontSize: constraints.minWidth * 0.03),
                  //       labelText: Gender,
                  //       border: OutlineInputBorder(),
                  //       errorText:
                  //           showErrorGender ? Pleaseselect_your_gender : null,
                  //     ),
                  //     items: [Male, Female]
                  //         .map((gender) => DropdownMenuItem(
                  //               value: gender,
                  //               child: Text(gender),
                  //             ))
                  //         .toList(),
                  //     onChanged: (value) {
                  //       setState(() {
                  //         selectedGender = value;
                  //         if (value != null) {
                  //           showErrorGender = false;
                  //         }
                  //       });
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: constraints.maxHeight * 0.008
                      // height: 20
                      ),
                  Row(
                    children: [
                      Checkbox(
                        value: termsAccepted,
                        onChanged: (value) {
                          setState(() {
                            termsAccepted = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(StringsManager.txt_condition),
                      ),
                    ],
                  ),
                  SizedBox(height: constraints.maxHeight * 0.001
                      // height: 10
                      ),

                  PublicButton(
                      text: StringsManager.signup,
                      color: ColorsManager.bg_buttonColor_backgroundColor,
                      textStyle: TextStyle(
                        color: Colors.white,
                        // fontSize: 16,
                        fontSize: constraints.minWidth * 0.03,
                      ),
                      // width: 200,
                      width: constraints.minWidth * 0.05,

                      // height: 54,
                      height: constraints.maxHeight * 0.08,
                      // borderRadius: 8,
                      borderRadius: constraints.maxHeight * 0.01,
                      onPressed: login),

                  SizedBox(
                      // height: 20
                      height: constraints.maxHeight * 0.01),
                  Center(
                      child: Text('or',
                          style: TextStyle(
                            fontSize: 16,
                          ))),
                  // SizedBox(height: 20),

                  PublicButton(
                    icon: Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                    text: StringsManager.signup_gmail,
                    color: ColorsManager.bg_buttonColor_secondary,
                    textStyle: TextStyle(
                      color: ColorsManager.txt_buttonColor_signup,
                      // fontSize: 16.0,
                      fontSize: constraints.minWidth * 0.03,
                    ),
                    // width: 200,
                    width: constraints.minWidth * 0.20,

                    // height: 54,
                    height: constraints.maxHeight * 0.08,
                    borderRadius: constraints.maxHeight * 0.02,
                    // borderRadius: 8,
                    onPressed: () {},
                  ),
                  SizedBox(height: constraints.maxHeight * 0.01
                      // height: 10
                      ),
                  PublicButton(
                    icon: Icon(
                      Icons.facebook,
                      color: Colors.blue,
                    ),
                    text: StringsManager.signup_facebook,
                    color: ColorsManager.bg_buttonColor_secondary,
                    textStyle: TextStyle(
                      color: ColorsManager.txt_buttonColor_signup,
                      // fontSize: 16.0,
                      fontSize: constraints.minWidth * 0.03,
                    ),
                    // width: 200,
                    width: constraints.minWidth * 0.20,

                    // height: 54,
                    height: constraints.maxHeight * 0.08,
                    borderRadius: constraints.maxHeight * 0.02,
                    // borderRadius: 8,
                    onPressed: () {},
                  ),
                  SizedBox(height: constraints.maxHeight * 0.01
                      // height: 10
                      ),
                  PublicButton(
                    icon: Icon(
                      Icons.apple,
                      color: Colors.black,
                    ),
                    text: StringsManager.signup_apple,
                    color: ColorsManager.bg_buttonColor_secondary,
                    textStyle: TextStyle(
                      color: ColorsManager.txt_buttonColor_signup,
                      // fontSize: 16.0,
                      fontSize: constraints.minWidth * 0.03,
                    ),
                    // width: 200,
                    width: constraints.minWidth * 0.20,
                    height: constraints.minHeight * 0.08,
                    borderRadius: constraints.minHeight * 0.02,
                    // height: 54,
                    // borderRadius: 8,
                    onPressed: () {},
                  ),
                  SizedBox(height: constraints.minHeight * 0.01
                      // height: 20
                      ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Already_have_an_account),
                        Text(
                          sign_in,
                          style: TextStyle(
                              color: ColorsManager.txt_buttonColor_secondary),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // ),
      ),
    );
    // );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(WelcometotheHome_Page),
      ),
    );
  }
}
