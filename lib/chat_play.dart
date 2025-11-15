import 'package:flutter/material.dart';

class ChatPlayPage extends StatefulWidget {
  const ChatPlayPage({super.key});

  @override
  State<ChatPlayPage> createState() => _ChatPlayPageState();
}

class _ChatPlayPageState extends State<ChatPlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat&Play'),
      ),
      body: StreamBuilder(
          stream: null, builder: (context, snapshot){
        return Container();
      }),
    );
  }
}
