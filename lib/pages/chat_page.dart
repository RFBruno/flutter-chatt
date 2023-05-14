import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat/components/messages.dart';
import 'package:flutter_chat/components/new_message.dart';
import 'package:flutter_chat/core/models/chat_notification.dart';
import 'package:flutter_chat/core/services/auth/auth_services.dart';
import 'package:flutter_chat/core/services/notification/chat_notification_service.dart';
import 'package:flutter_chat/pages/notification_page.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Br Chat'),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              iconEnabledColor: Theme.of(context).colorScheme.onSurface,
              icon: const Icon(
                Icons.more_vert,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Sair')
                    ],
                  ),
                )
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  AuthServices().logout();
                }
              },
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const NotificationPage();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.notifications),
              ),
              Positioned(
                top: 5,
                right: 7,
                child: CircleAvatar(
                  maxRadius: 10,
                  backgroundColor:const Color.fromARGB(255, 233, 88, 78),
                  child: Text(
                    Provider.of<ChatNotificationService>(context)
                        .itemsCount
                        .toString(),
                    style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.inverseSurface),
                  ),
                ),
              ),
            ],
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Provider.of<ChatNotificationService>(context, listen: false).add(
      //         ChatNotification(
      //             title: 'Mais uma notificação!!',
      //             body: Random().nextDouble().toString()));
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
