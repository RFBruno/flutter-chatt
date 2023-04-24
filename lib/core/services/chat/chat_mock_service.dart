import 'dart:math';

import 'package:flutter_chat/core/models/chat_user.dart';
import 'package:flutter_chat/core/models/chat_message.dart';
import 'package:flutter_chat/core/services/chat/chat_service.dart';
import 'dart:async';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Bom dia',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'teste',
      userImageURL: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '2',
      text: 'Bom dia',
      createdAt: DateTime.now(),
      userId: '456',
      userName: 'teste 2',
      userImageURL: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '1',
      text: 'Not',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'teste',
      userImageURL: 'assets/images/avatar.png',
    )
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageUrl,
    );

    _msgs.add(newMessage);
    _controller?.add(_msgs.reversed.toList());

    return newMessage;
  }
}
