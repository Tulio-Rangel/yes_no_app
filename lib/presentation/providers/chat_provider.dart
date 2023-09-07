// The folrder is called provider because we use the 'Gestor de estados' provider,
// if the 'Gestor de estados' would be BLoC the folder would be called BloC or someting like that

import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: 'Oliwis', fromWho: FromWho.me),
    Message(text: 'Ya hiciste popis?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    notifyListeners(); // Se notifica que hubo un cambio
  }
}
