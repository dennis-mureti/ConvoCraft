import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convocraft/model/message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatService extends ChangeNotifier {
  // get instance of auth and firestore
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// SEND MESSAGE
  Future<void> sendMessage(String receiverId, String message) async {
// get current user info
    final String currentUserId = _firebaseAuth.currentUser!.uid;
    final String currentUserEmail = _firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

// create a a new message
    Message newMessage = Message(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

// construct chat room id from curent user id ad receiver id(sorted to ensure uniqueness
    List<String> ids = [currentUserId, receiverId];
    ids.sort(); //  sorts the ids (to ensure the chat room id is always the same for a pair of people   )
    String chatRoomId = ids
        .join("_"); // combine the ds into a single string to use as achatroomID
// add message to the database
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }
  // GET MESSAGES

  Stream<QuerySnapshot> getMessages(String userId, String otherUuserId) {
    // construct  chat room id from user ids (sorted to ensure t matches the ids used when sending the messages)
    List<String> ids = [userId, otherUuserId];
    ids.sort();
    String chatRoomId = ids.join("_");

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
