import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_group/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_group/database/authentication_state.dart';
import 'package:my_group/screens/authentication_screen.dart';
import 'package:my_group/screens/dashboard_screen.dart';
import 'package:my_group/database/group_chat_list.dart';
import 'package:my_group/database/group_chat_message.dart';
import 'package:my_group/screens/message_screen.dart';
import 'utils/constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: kPrimaryColor, // set navigation bar color
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthenticationState(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => GroupChatList(),
          lazy: true,
        ),
        ChangeNotifierProvider(
          create: (context) => GroupChatMessage(),
          lazy: true,
        ),
      ],
      builder: (context, _) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        AuthenticationScreen.id: (context) => AuthenticationScreen(),
        DashboardScreen.id: (context) => DashboardScreen(),
        MessageScreen.id: (context) => MessageScreen(),
      },
    );
  }
}
