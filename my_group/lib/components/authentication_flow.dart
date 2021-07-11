import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_group/database/authentication_state.dart';
import 'package:my_group/components/form/email_form.dart';
import 'package:my_group/components/form/password_form.dart';
import 'package:my_group/components/form/register_form.dart';
import 'package:my_group/screens/dashboard_screen.dart';
import 'package:my_group/components/app_rules_text.dart';
import 'package:my_group/utils/constants.dart';

class AuthenticationFlow extends StatelessWidget {
  final ApplicationLoginState loginState;

  final String? email;

  final void Function() startLoginFlow;

  final void Function(
    String email,
    void Function(Exception e) error,
  ) verifyEmail;

  final void Function(
    String email,
    String password,
    void Function(Exception e) error,
  ) signInWithEmailAndPassword;

  final void Function() cancelRegistration;

  final void Function(
    String email,
    String displayName,
    String password,
    void Function(Exception e) error,
  ) registerAccount;

  final void Function() signOut;

  // constructor
  AuthenticationFlow({
    required this.loginState,
    required this.email,
    required this.startLoginFlow,
    required this.verifyEmail,
    required this.signInWithEmailAndPassword,
    required this.cancelRegistration,
    required this.registerAccount,
    required this.signOut,
  });
  @override
  Widget build(BuildContext context) {
    switch (loginState) {
      case ApplicationLoginState.loggedOut:
        return AppRulesText(callback: () => startLoginFlow());
      case ApplicationLoginState.emailAddress:
        return EmailForm(
          callback: (email) => verifyEmail(
            email,
            (e) => _showErrorDialog(context, 'Invalid email', e),
          ),
        );
      case ApplicationLoginState.register:
        return RegisterForm(
          email: email!,
          callback: (email, displayName, password) => registerAccount(
            email,
            displayName,
            password,
            (e) => _showErrorDialog(context, 'Failed to register', e),
          ),
        );
      case ApplicationLoginState.password:
        return PasswordForm(
          email: email!,
          callback: (email, password) => signInWithEmailAndPassword(
            email,
            password,
            (e) => _showErrorDialog(context, 'Failed to signIn', e),
          ),
        );
      case ApplicationLoginState.loggedIn:
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushNamed(context, DashboardScreen.id);
        });
        return Center(
          child: CircularProgressIndicator(),
        );
      default:
        return Column(
          children: [
            Text('Error!'),
          ],
        );
    }
  }

  void _showErrorDialog(BuildContext context, String title, Exception e) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kCardBackgroundColor,
          title: Text(
            title,
            style: TextStyle(fontSize: 24),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  '${(e as dynamic).message}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
