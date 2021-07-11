import 'package:flutter/material.dart';
import 'package:my_group/components/form/custom_visibility.dart';
import 'package:my_group/components/form/custom_text_field.dart';
import 'package:my_group/components/form/custom_text_button.dart';

class PasswordForm extends StatefulWidget {
  final void Function(String email, String password) callback;
  final String email;
  PasswordForm({required this.email, required this.callback});
  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  TextEditingController? _controller;
  String? email;
  String? password;
  bool isEmailValid = true;
  bool isPassValid = true;
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
          buttonTitle: 'Sign In',
          callback: () {
            if (email == null || email == '') {
              setState(() {
                isEmailValid = false;
              });
            }
            if (password == null || password == '') {
              setState(() {
                isPassValid = false;
              });
            }
            if (isEmailValid && isPassValid) {
              widget.callback(email!, password!);
            }
          },
        ),
      ],
    );
  }
}
