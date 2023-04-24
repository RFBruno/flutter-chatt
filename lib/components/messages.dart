import 'package:flutter/material.dart';
import 'package:flutter_chat/components/message_bubble.dart';
import 'package:flutter_chat/core/models/chat_message.dart';
import 'package:flutter_chat/core/services/auth/auth_services.dart';
import 'package:flutter_chat/core/services/chat/chat_service.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthServices().currentUser;
    return Center(
      child: StreamBuilder<List<ChatMessage>>(
        stream: ChatService().messagesStream(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('Sem dados. vamos conversar?');
          } else {
            final msgs = snapshot.data!;
            return ListView.builder(
              reverse: true,
              itemCount: msgs.length,
              itemBuilder: (ctx, i) {
                return MessageBubble(
                  key: ValueKey(msgs[i].id),
                  message: msgs[i],
                  belongsToCurrentUser: currentUser?.id == msgs[i].userId,
                );
              },
            );
          }
        },
      ),
    );
  }
}
