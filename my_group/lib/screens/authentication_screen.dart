import 'package:flutter/material.dart';
import 'package:my_group/database/authentication_state.dart';
import 'package:provider/provider.dart';
import 'package:my_group/components/authentication_flow.dart';
import 'package:my_group/utils/constants.dart';

class AuthenticationScreen extends StatelessWidget {
  static const id = 'authentication_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Hero(
              tag: 'appIcon',
              child: Icon(
                Icons.group_add_rounded,
                size: 170.0,
                color: kIconColor,
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Consumer<AuthenticationState>(
              builder: (context, authState, _) => AuthenticationFlow(
                loginState: authState.loginState,
                email: authState.email,
                startLoginFlow: authState.startLoginFlow,
                verifyEmail: authState.verifyEmail,
                signInWithEmailAndPassword:
                    authState.signInWithEmailAndPassword,
                cancelRegistration: authState.cancelRegistration,
                registerAccount: authState.registerAccount,
                signOut: authState.signOut,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
