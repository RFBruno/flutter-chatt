import 'package:flutter/material.dart';
import 'package:flutter_chat/core/models/chat_user.dart';
import 'package:flutter_chat/core/services/auth/auth_mock_service.dart';
import 'package:flutter_chat/pages/auth_page.dart';
import 'package:flutter_chat/pages/chat_page.dart';
import 'package:flutter_chat/pages/loading_page.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        stream: AuthMockServices().userChanges,
        builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        } else {
          return snapshot.hasData ? const ChatPage() : const AuthPage();
        }
      },),
    );
  }
}