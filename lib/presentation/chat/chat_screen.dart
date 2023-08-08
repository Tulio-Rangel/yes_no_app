import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://www.themoviedb.org/t/p/original/4olEgHb8M7qQj0sQv6FDVN10rLj.jpg'),
          ),
        ),
        title: const Text('Rieri 💘'),
      ),
    );
  }
}
