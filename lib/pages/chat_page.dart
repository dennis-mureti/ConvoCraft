import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convocraft/components/chat_bubble.dart';
import 'package:convocraft/components/textfield.dart';
import 'package:convocraft/services/chat/chat_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUuserID;
  const ChatPage({
    super.key,
    required this.receiverUserEmail,
    required this.receiverUuserID,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageConroller = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    // only sending the message if ther is something tto send
    if (_messageConroller.text.isNotEmpty) {
      await _chatService.sendMessage(
          widget.receiverUuserID, _messageConroller.text);
      // clear the controller after sending the message
      _messageConroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverUserEmail),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // messages
          Expanded(
            child: _buildMessageList(),
          ),
          _buildMessageInput(),
          const SizedBox(height: 25)
        ],
      ),
    );
  }

  // build message list
  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(
            widget.receiverUuserID, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          }
          return ListView(
            children: snapshot.data!.docs
                .map((document) => _buildMessageItem(document))
                .toList(),
          );
        });
  }

  // build message item
  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    // alighn messages to the right side of the screen if the sender is the current user,
    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          mainAxisAlignment:
              (data['senderId'] == _firebaseAuth.currentUser!.uid)
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
          children: [
            Text(data['senderEmail']),
            const SizedBox(height: 5),
            ChatBubble(message: data['message']),
          ],
        ),
      ),
    );
  }

  // build message input
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          // textfeild
          Expanded(
            child: MyTextField(
              controller: _messageConroller,
              hintText: 'Enter Message',
              obscureText: false,
            ),
          ),

          // send button
          IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.arrow_upward,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
