
import 'package:flutter_chat/core/models/chat_notification.dart';
import 'package:flutter/material.dart';

class PushNotificationService extends ChangeNotifier {
  List<ChatNotification> _items = [];

  List<ChatNotification> get items => [..._items];

  void add(ChatNotification notification){
    _items.add(notification);
    notifyListeners();
  }


  void remove(int i){
    _items.removeAt(i);
    notifyListeners();
  }
  
}