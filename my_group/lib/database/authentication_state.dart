import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum ApplicationLoginState {
  loggedOut,
  emailAddress,
  register,
  password,
  loggedIn,
}

class AuthenticationState extends ChangeNotifier {
  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;
  String? _email;
  AuthenticationState() {
    // initialize firebase
    init();
  }
  Future<void> init() async {
    // simple  async call to initialize firebase
    await Firebase.initializeApp();

    // setup listener on the Firebase Auth Instance,
    // firebase auth library essentially calls this callback
    // when a user's login state has changed.
    // for example, when a user has logged in or logged out.
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loginState = ApplicationLoginState.loggedIn;
      } else {
        _loginState = ApplicationLoginState.loggedOut;
      }

      // notify all listeners for updated states
      notifyListeners();
    });
  }

  // Following functions are going to be passed as argument to authentication screen

  void startLoginFlow() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  // verifyEmail function takes in an email and checks to see if there are any
  // auth accounts already associated
  Future<void> verifyEmail(
    String email,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        _loginState = ApplicationLoginState.password;
      } else {
        _loginState = ApplicationLoginState.register;
      }
      _email = email;
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  // signInWithEmailAndPassword function takes in email, password, and errorCallback
  // uses the credential to signIn. If success, update the email and password variable
  // the update will be listened by FirebaseAuth.instance.userChanges().listen((user) {...}
  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(FirebaseAuthException e) errorCallback,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  // cancelRegistration function sets loginState to emailAddress i.e. initial
  // auth flow state. It is called when user cancel or deny registration page
  void cancelRegistration() {
    _loginState = ApplicationLoginState.emailAddress;
    notifyListeners();
  }

  // registerAccount function takes in user information and creates a new account,
  // then it updates the userDisplayName using the UserCredential data type.
  // the update will be listened by FirebaseAuth.instance.userChanges().listen((user) {...}
  Future<void> registerAccount(
      String email,
      String displayName,
      String password,
      void Function(FirebaseAuthException e) errorCallback) async {
    try {
      var credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      credential.user!.updateDisplayName(displayName);
    } on FirebaseAuthException catch (e) {
      errorCallback(e);
    }
  }

  // signOut function tells firebase auth to sign out
  // no network calls are required
  // the update will be listened by FirebaseAuth.instance.userChanges().listen((user) {...}
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  // getter methods
  ApplicationLoginState get loginState => _loginState;
  String? get email => _email;

  // setter methods
}
