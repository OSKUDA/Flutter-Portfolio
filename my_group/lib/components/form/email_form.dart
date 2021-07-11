import 'package:flutter/material.dart';
import 'package:my_group/components/form/custom_visibility.dart';
import 'package:my_group/components/form/custom_text_field.dart';
import 'package:my_group/components/form/custom_text_button.dart';

class EmailForm extends StatefulWidget {
  final void Function(String email) callback;
  EmailForm({required this.callback});
  @override
  _EmailFormState createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  String? email;
  bool isEmailValid = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          labelText: 'Email',
          hintText: 'Enter email address',
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
        CustomTextButton(
          buttonTitle: 'Next',
          callback: () {
            if (email == null || email == '') {
              setState(() {
                isEmailValid = false;
              });
            } else {
              widget.callback(email!);
            }
          },
        ),
      ],
    );
  }
}
