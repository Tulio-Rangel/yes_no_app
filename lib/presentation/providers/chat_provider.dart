// The folrder is called provider because we use the 'Gestor de estados' provider,
// if the 'Gestor de estados' would be BLoC the folder would be called BloC or someting like that

import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Oliwis', fromWho: FromWho.me),
    Message(text: 'Ya hiciste popis?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners(); // Se notifica que hubo un
    moveScrollToBotton(); // Se llama a la funcion del scroll
  }

// Funcion para obtener la respuesta de ella con el metododo http
  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBotton();
  }

// Funcion para hacer que el chat se vaya desplazando mientras se va llenando la pantalla
  Future<void> moveScrollToBotton() async {
    await Future.delayed(const Duration(
        milliseconds:
            100)); // Restraso intencional para que se pueda hacer bien el scroll

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
