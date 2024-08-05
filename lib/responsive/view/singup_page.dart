import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ride_project/core/resources/colors.dart';
import 'package:ride_project/core/resources/string.dart';
import 'package:ride_project/core/resources/style.dart';
import 'package:ride_project/core/widgets/app_Drawer.dart';
import 'package:ride_project/core/widgets/app_TextFiled.dart';
import 'package:ride_project/feature/bloc/authe_bloc.dart';
import 'package:ride_project/model/signup_model.dart';
import 'package:ride_project/responsive/view/login_page.dart';

class singup_page extends StatelessWidget {
  singup_page({super.key});
  final TextEditingController lastName = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController birthDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AutheBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          drawer: myDrawer,
          // backgroundColor: Colors.white10,
          body: Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //  padding8,
                  AppTextFieldState(
                      controller: firstName, hintext: 'firstName'),
                  AppTextFieldState(controller: lastName, hintext: 'lastName'),
                  //  padd(),
                  AppTextFieldState(controller: password, hintext: 'password'),
                  AppTextFieldState(
                      controller: confirmPassword, hintext: 'confirmPassword'),
                  AppTextFieldState(controller: username, hintext: 'username'),
                  AppTextFieldState(controller: phone, hintext: 'phone'),
                  AppTextFieldState(
                      controller: birthDate, hintext: 'birthDate'),
                  BlocConsumer<AutheBloc, AutheState>(
                    listener: (context, state) {
                      if (state is SuccessToRegister) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => login_page(),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AutheInitial) {
                        return InkWell(
                          onTap: () {
                            context.read<AutheBloc>().add(
                                  Register(
                                    user: SingUpModel(
                                      lastName: lastName.text,
                                      firstName: firstName.text,
                                      password: password.text,
                                      phone: phone.text,
                                      username: username.text,
                                      confirmPassword: confirmPassword.text,
                                      birthDate: birthDate.text,
                                    ),
                                  ),
                                );
                          },
                          child: Container(
                            width: 290,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ColorsManager.bg_buttonColor_backgroundColor),
                            child: Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              child: Text(SIGNUP,
                                  textAlign: TextAlign.center,
                                  style: containerlog_sing_create),
                            ),
                          ),
                        );
                      } else if (State is Failed) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {
                                context.read<AutheBloc>().add(
                                      Register(
                                        user: SingUpModel(
                                          lastName: lastName.text,
                                          firstName: firstName.text,
                                          password: password.text,
                                          phone: phone.text,
                                          username: username.text,
                                          birthDate: birthDate.text,
                                        ),
                                      ),
                                    );
                              },
                              child: Container(
                                width: 290,
                                height: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: ColorsManager.bg_buttonColor_backgroundColor),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(SIGNUP,
                                      textAlign: TextAlign.center,
                                      style: containerlog_sing_create),
                                ),
                              ),
                            ),
                            Text(
                              "error",
                              style: TextStyle(fontSize: 20, color: Colors.red),
                            )
                          ],
                        );
                      } else if (state is SuccessToRegister) {
                        return Container(
                          width: 290,
                          height: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text("success",
                                textAlign: TextAlign.center,
                                style: containerlog_sing_create),
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ALREADYHAVEANACCOUNT",
                          style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: context.read<AutheBloc>(),
                                  child: login_page(),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            LOGIN,
                            style:
                                TextStyle(color: ColorsManager.bg_buttonColor_backgroundColor),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            // )
          ),
        );
      }),
    );
  }
}
