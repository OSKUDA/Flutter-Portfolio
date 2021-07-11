import 'package:flutter/material.dart';
import 'package:my_group/components/form/custom_visibility.dart';
import 'package:my_group/components/form/custom_text_field.dart';
import 'package:my_group/components/form/custom_text_button.dart';

class RegisterForm extends StatefulWidget {
  final void Function(String email, String displayName, String password)
      callback;
  final String email;
  RegisterForm({required this.email, required this.callback});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController? _controller;
  String? email;
  String? password;
  String? username;
  bool isEmailValid = true;
  bool isPassValid = true;
  bool isUsernameValid = true;

  @override
  void initState() {
    super.initState();
    email = widget.email;
    _controller = TextEditingController(text: email);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          labelText: 'Email',
          hintText: 'Enter email address',
          textController: _controller,
          callback: (newValue) {
            email = newValue;
            setState(() {
              isEmailValid = true;
            });
          },
        ),
        CustomVisibility(
          warningText: '* enter valid email',
          validator: isEmailValid,
        ),
        SizedBox(height: 10.0),
        CustomTextField(
          labelText: 'Username',
          hintText: 'Choose a unique username',
          callback: (newValue) {
            username = newValue;
            setState(() {
              isUsernameValid = true;
            });
          },
        ),
        CustomVisibility(
          warningText: '* enter valid username',
          validator: isUsernameValid,
        ),
        SizedBox(height: 10.0),
        CustomTextField(
          labelText: 'Password',
          hintText: 'Enter strong password',
          callback: (newValue) {
            password = newValue;
            setState(() {
              isPassValid = true;
            });
          },
        ),
        CustomVisibility(
          warningText: '* enter valid password',
          validator: isPassValid,
        ),
        SizedBox(height: 10.0),
        CustomTextButton(
          buttonTitle: 'Register',
          callback: () {
            if (email == null || email == '') {
              setState(() {
                isEmailValid = false;
              });
            }
            if (username == null || username == '') {
              setState(() {
                isUsernameValid = false;
              });
            }
            if (password == null || password == '') {
              setState(() {
                isPassValid = false;
              });
            }
            if (isEmailValid && isUsernameValid && isPassValid) {
              widget.callback(email!, username!, password!);
            }
          },
        ),
      ],
    );
  }
}
