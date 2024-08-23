// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';

import 'package:ride_project/core/resources/colors.dart';
import 'package:ride_project/core/resources/string.dart';
import 'package:ride_project/core/widgets/app_Button.dart';
import '../bloc/authe_bloc.dart';
import '../model/signup_model.dart';

class CreatePassword extends StatelessWidget {
  String fitrstName;
  String lastName;
  String username;
  String phone;
  DateTime birthDate;

  CreatePassword({
    Key? key,
    required this.fitrstName,
    required this.lastName,
    required this.username,
    required this.phone,
    required this.birthDate,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
  }

  void toggleConfirmPasswordVisibility() {
    obscureConfirmPassword = !obscureConfirmPassword;
  }

  void register() {
    if (formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AutheBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      StringsManager.Setpassword,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      StringsManager.Set_Your_password,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        labelText: StringsManager.Password,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: togglePasswordVisibility,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return StringsManager.Please_confirm_your_password;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: obscureConfirmPassword,
                      decoration: InputDecoration(
                        labelText: StringsManager.ConfirmPassword,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: toggleConfirmPasswordVisibility,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return StringsManager.Please_confirm_your_password;
                        }
                        if (value != passwordController.text) {
                          return StringsManager.Passwords_do_not_match;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        StringsManager.Atleast_number_or_a_special_character,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 20),
                    BlocConsumer<AutheBloc, AutheState>(
                      listener: (context, state) {
                        if (state is SuccessToRegister) {
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            Navigator.pushNamed(context, '/MapScreen');
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.success,
                              text: 'Your Register Completed Successfully!',
                              confirmBtnColor: Colors.green,
                            );
                          });

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => MapScreen(),
                          //   ),
                          // );
                        }
                      },
                      builder: (context, state) {
                        if (state is AutheInitial) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PublicButton(
                                text: StringsManager.register,
                                color: ColorsManager
                                    .bg_buttonColor_backgroundColor,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                                width: 340.0,
                                height: 54.0,
                                borderRadius: 8.0,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AutheBloc>().add(
                                          Register(
                                            user: SingUpModel(
                                              lastName: lastName,
                                              firstName: fitrstName,
                                              password: passwordController.text,
                                              confirmPassword:
                                                  confirmPasswordController
                                                      .text,
                                              phone: phone,
                                              username: username,
                                              birthDate: birthDate,
                                            ),
                                          ),
                                        );
                                  }
                                },
                              ),
                            ],
                          );
                        } else if (state is SuccessToRegister) {
                          return Container(
                            width: 290,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.green,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "success",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          );
                        } else if (state is Failed) {
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            QuickAlert.show(
                              context: context,
                              type: QuickAlertType.error,
                              text: state.message,
                              confirmBtnColor: Colors.red,
                            );
                          });
                          return const Text(
                            "signUp",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          );
                          // return
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     PublicButton(
                          //       text: StringsManager.register,
                          //       color: ColorsManager
                          //           .bg_buttonColor_backgroundColor,
                          //       textStyle: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 16.0,
                          //       ),
                          //       width: 340.0,
                          //       height: 54.0,
                          //       borderRadius: 8.0,
                          //       onPressed: () {
                          //         if (formKey.currentState!.validate()) {
                          //           context.read<AutheBloc>().add(
                          //                 Register(
                          //                   user: SingUpModel(
                          //                     lastName: lastName,
                          //                     firstName: fitrstName,
                          //                     password: passwordController.text,
                          //                     confirmPassword:
                          //                         confirmPasswordController
                          //                             .text,
                          //                     phone: phone,
                          //                     username: username,
                          //                     birthDate: birthDate,
                          //                   ),
                          //                 ),
                          //               );
                          //         }
                          //       },
                          //     ),
                          // SizedBox(height: 10),

                          // Text(
                          //   state
                          //       .message, // الرسالة التي تأتي من الحالة الفاشلة
                          //   style: TextStyle(
                          //     fontSize: 16,
                          //     color: Colors.red,
                          //   ),
                          // ),

                          //   ],
                          // );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
