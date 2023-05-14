import 'package:flutter/material.dart';
import 'package:flutter_chat/core/services/notification/chat_notification_service.dart';
import 'package:flutter_chat/pages/auth_or_app_page.dart';
import 'package:flutter_chat/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatNotificationService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: appTheme,
        home: const AuthOrAppPage(),
      ),
    );
  }
}
