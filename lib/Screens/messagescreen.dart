import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smartagro/Components/messageBubble.dart';
import '../constants.dart';
final _firestore = Firestore.instance;
bool test = false;
class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  String message;
  void updatemessage() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for (var messagedata in snapshot.documents) {
        print(messagedata.data);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    final MessageTextController= TextEditingController();
    return Scaffold(
      body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              messageStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: MessageTextController,
                        onChanged: (value) {
                          message = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
                      child: GestureDetector(onTap: (){test = true;
                      MessageTextController.clear();
                      message!=null?_firestore.collection('messages').add({
                        'text': message,
                        'date': DateTime.now().toIso8601String().toString(),
                        'isme': true

                      }):null;
                      message=null;},child: Icon(Icons.send,color: Colors.blue,)),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );

  }
}
  class messageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Expanded(
  child: StreamBuilder<QuerySnapshot>(
  stream: _firestore.collection('messages').orderBy('date').snapshots(),
  builder: (context, snapshot) {
  if (!snapshot.hasData) {
  return Container(alignment:Alignment.center,child: CircularProgressIndicator(strokeWidth: 4,));
  }
  final messages = snapshot.data.documents.reversed;
  List<MessageBubble> messageWidget = [];
  for (var message in messages) {
  final messagetext = message.data['text'];
  final testo = message.data['isme'];
  final messagewid = MessageBubble(text: messagetext, isMe: testo,);
  messageWidget.add(messagewid);
  }
  return Container(child: ListView(reverse: true,
  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
  children: messageWidget));
  },
  ),
  );
  }
}
