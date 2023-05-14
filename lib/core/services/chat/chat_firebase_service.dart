import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat/core/models/chat_user.dart';
import 'package:flutter_chat/core/models/chat_message.dart';
import 'package:flutter_chat/core/services/chat/chat_service.dart';
import 'dart:async';

class ChatFirebaseService implements ChatService {
  static final List<ChatMessage> _msgs = [
    // ChatMessage(
    //   id: '1',
    //   text: 'Not',
    //   createdAt: DateTime.now(),
    //   userId: '123',
    //   userName: 'teste',
    //   userImageURL: 'assets/images/avatar.png',
    // )
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;

  @override
  Stream<List<ChatMessage>> messagesStream() {
    final store = FirebaseFirestore.instance;
    final snapshots = store
        .collection('chat')
        .withConverter(
          fromFirestore: _fromFirestore,
          toFirestore: _toFirestore,
        )
        .orderBy(
          'createdAt',
          descending: true,
        )
        .snapshots();

    return Stream<List<ChatMessage>>.multi(
      (controller) {
        snapshots.listen((snapshot) {
          List<ChatMessage> lista =
              snapshot.docs.map((doc) => doc.data()).toList();
          controller.add(lista);
        });
      },
    );
  }

  @override
  Future<ChatMessage?> save(String text, ChatUser user) async {
    final store = FirebaseFirestore.instance;

    final msg = ChatMessage(
      id: '',
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageUrl,
    );

    final docRef = await store
        .collection('chat')
        .withConverter(fromFirestore: _fromFirestore, toFirestore: _toFirestore)
        .add(msg);

    final snapshot = await docRef.get();

    return snapshot.data();
  }

  Map<String, dynamic> _toFirestore(ChatMessage msg, SetOptions? options) {
    return {
      'text': msg.text,
      'createdAt': msg.createdAt.toIso8601String(),
      'userId': msg.userId,
      'userName': msg.userName,
      'userImageURL': msg.userImageURL,
    };
  }

  ChatMessage _fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc, SnapshotOptions? options) {
    return ChatMessage(
      id: doc.id,
      text: doc['text'],
      createdAt: DateTime.parse(doc['createdAt']),
      userId: doc['userId'],
      userName: doc['userName'],
      userImageURL: doc['userImageURL'],
    );
  }
}
