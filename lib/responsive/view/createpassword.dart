import 'package:flutter/material.dart';
import 'package:ride_project/core/resources/colors.dart';
import 'package:ride_project/core/resources/string.dart';
import 'package:ride_project/core/widgets/app_Button.dart';

class CreatePassword extends StatefulWidget {
  @override
  CreatePasswordState createState() => CreatePasswordState();
}

class CreatePasswordState extends State<CreatePassword> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  void togglePasswordVisibility() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void toggleConfirmPasswordVisibility() {
    setState(() {
      obscureConfirmPassword = !obscureConfirmPassword;
    });
  }

  void register() {
    if (formKey.currentState!.validate()) {
      // Perform registration action
    }
  }

  @override
  Widget build(BuildContext context) {
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
                Setpassword,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 20),
              Text(
                Set_Your_password,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: Password,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: togglePasswordVisibility,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: obscureConfirmPassword,
                decoration: InputDecoration(
                  labelText: ConfirmPassword,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: register,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return Please_confirm_your_password;
                  }
                  if (value != passwordController.text) {
                    return Passwords_do_not_match;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  Atleast_number_or_a_special_character,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PublicButton(
                    text: StringsManager.register,
                    color: ColorsManager.bg_buttonColor_backgroundColor,
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      //fontWeight: FontWeight.bold,
                    ),
                    width: 340.0,
                    height: 54.0,
                    borderRadius: 8.0,
                    onPressed: register,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
