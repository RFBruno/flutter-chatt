import 'package:flutter/material.dart';
import 'package:flutter_chat/components/messages.dart';
import 'package:flutter_chat/components/new_message.dart';
import 'package:flutter_chat/core/services/auth/auth_services.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Br Chat'),
          actions: [
            DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).primaryIconTheme.color,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                    child: Row(
                      children: const [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Sair')
                      ],
                    ))
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  AuthServices().logout();
                }
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: const [
              Expanded(
                child: Messages(),
              ),
              NewMessage(),
            ],
          ),
        ));
  }
}
