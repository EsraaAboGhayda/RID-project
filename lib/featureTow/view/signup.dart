import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ride_project/core/resources/colors.dart';
import 'package:ride_project/core/resources/padding.dart';
import 'package:ride_project/core/resources/string.dart';
import 'package:ride_project/core/widgets/app_Button.dart';
import 'package:ride_project/featureTow/bloc/authe_bloc.dart';
import 'package:ride_project/featureTow/model/signup_model.dart';
import 'package:ride_project/featureTow/view/createpassword.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

var username;
var userphone;

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool termsAccepted = false;
  String? selectedGender;
  String phoneNumber = '';
  bool showErrorName = false;
  bool showErrorEmail = false;
  bool showErrorPhone = false;
  bool showErrorGender = false;

  void login() {
    setState(() {
      showErrorName = nameController.text.isEmpty;
      showErrorEmail = emailController.text.isEmpty;
      showErrorPhone = phoneNumber.isEmpty;
      showErrorGender = selectedGender == null;
    });

    if (!showErrorName &&
        !showErrorEmail &&
        !showErrorPhone &&
        !showErrorGender) {
      username = nameController;
      userphone = phoneNumber;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<AutheBloc>()
                ..add(
                  Register(
                    user: SingUpModel(
                      lastName: "enas",
                      firstName: "esra'a",
                      phone: userphone.text,
                      username: username.text,
                      birthDate: "2024-08-02",
                    ),
                  ),
                ),
              child: CreatePassword(),
            ),
          ));
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => CreatePassword()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AutheBloc(),
      child: LayoutBuilder(
        builder: (context, constraints) => Scaffold(
          appBar: AppBar(),
          body:
              // padd(
              //   paddnumber: constraints.maxHeight * 0.0015,
              //   paddwidget
              //   :
              Center(
            child: Container(
              height: constraints.maxHeight * 0.90,
              width: constraints.maxWidth * 0.80,
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Text(
                      titlesignup,
                      style: TextStyle(
                          // fontSize: 18
                          fontSize: constraints.maxWidth * 0.035),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.008
                        // height: 20
                        ),
                    Container(
                      width: constraints.maxWidth * 0.05,
                      height: constraints.maxHeight * 0.1,
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
                    SizedBox(
                        // height: 20
                        height: constraints.maxHeight * 0.008),
                    Container(
                      width: constraints.maxWidth * 0.05,
                      height: constraints.maxHeight * 0.1,
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelStyle:
                              TextStyle(fontSize: constraints.maxWidth * 0.03),
                          labelText: EMAIL,
                          border: OutlineInputBorder(),
                          errorText:
                              showErrorEmail ? Please_enter_your_email : null,
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.008
                        // height: 20
                        ),
                    Container(
                      width: constraints.maxWidth * 0.05,
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
                          phoneNumber = phone.completeNumber;
                          if (phone.completeNumber.isNotEmpty) {
                            setState(() {
                              showErrorPhone = false;
                            });
                          }
                        },
                      ),
                    ),
                    // SizedBox(height: constraints.maxHeight * 0.01
                    //     // height: 20
                    //     ),
                    Container(
                      width: constraints.maxWidth * 0.05,
                      height: constraints.maxHeight * 0.1,
                      child: DropdownButtonFormField<String>(
                        value: selectedGender,
                        decoration: InputDecoration(
                          labelStyle:
                              TextStyle(fontSize: constraints.maxWidth * 0.03),
                          labelText: Gender,
                          border: OutlineInputBorder(),
                          errorText:
                              showErrorGender ? Pleaseselect_your_gender : null,
                        ),
                        items: [Male, Female]
                            .map((gender) => DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                            if (value != null) {
                              showErrorGender = false;
                            }
                          });
                        },
                      ),
                    ),
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
                        fontSize: constraints.maxWidth * 0.03,
                      ),
                      // width: 200,
                      width: constraints.maxWidth * 0.05,

                      // height: 54,
                      height: constraints.maxHeight * 0.08,
                      // borderRadius: 8,
                      borderRadius: constraints.maxHeight * 0.01,
                      onPressed: 
                      // () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (_) => BlocProvider.value(
                      //           value: context.read<AutheBloc>()
                      //             ..add(
                      //               Register(
                      //                 user: SingUpModel(
                      //                   lastName: "enas",
                      //                   firstName: "esra'a",
                      //                   phone: phoneNumber,
                      //                   username: nameController.text,
                      //                   birthDate: "2024-08-02",
                      //                 ),
                      //               ),
                      //             ),
                      //           child: CreatePassword(),
                      //         ),
                      //       ));
                      // },
                      login,
                    ),

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
                        fontSize: constraints.maxWidth * 0.03,
                      ),
                      // width: 200,
                      width: constraints.maxWidth * 0.20,

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
                        fontSize: constraints.maxWidth * 0.03,
                      ),
                      // width: 200,
                      width: constraints.maxWidth * 0.20,

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
                        fontSize: constraints.maxWidth * 0.03,
                      ),
                      // width: 200,
                      width: constraints.maxWidth * 0.20,
                      height: constraints.maxHeight * 0.08,
                      borderRadius: constraints.maxHeight * 0.02,
                      // height: 54,
                      // borderRadius: 8,
                      onPressed: () {},
                    ),
                    SizedBox(height: constraints.maxHeight * 0.01
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
      ),
    );
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
