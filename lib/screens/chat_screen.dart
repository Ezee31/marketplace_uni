import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text('Chat', style: TextStyle(color: Colors.black),),
          centerTitle: true,)
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('messages').orderBy('timestamp').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('users').snapshots(), 
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshotUser) {
                    if (snapshot.hasError) {
                      return const Text('Error al cargar los mensajes');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    List<QueryDocumentSnapshot> messages = snapshot.data!.docs;
                    List<QueryDocumentSnapshot> users = snapshotUser.data!.docs;

                    return ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        var message = messages[index];
                        var found = users.where((user) => user.id == message['senderId']).toList();

                        final userName = found.isNotEmpty ? found[0]["name"] : "Usuario desconocido";

                        return ListTile(
                          title: Text(message['messages']),
                          subtitle: Text(userName),
                        );
                      },
                    );
                });
              },
            ),
          ),
                    Container(
                      decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(hintText: 'Escribe tu mensaje'),
                    
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String message = _messageController.text.trim();
                    String senderId = getCurrentUserId(); // Reemplaza esto con el ID del remitente actual
                    sendMessage(message, senderId);
                    _messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stream<QuerySnapshot> getMessages() {
    CollectionReference messagesRef = FirebaseFirestore.instance.collection('messages');
    return messagesRef.orderBy('timestamp').snapshots();
  }

  void sendMessage(String message, String senderId) {
    CollectionReference messagesRef = FirebaseFirestore.instance.collection('messages');

    messagesRef.add({
      'messages': message,
      'senderId': senderId,
      'timestamp': DateTime.now(),
    });
  }

  String getCurrentUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      return userId;
    } else {
      // Si el usuario no está autenticado, devuelve un valor predeterminado o maneja el caso en consecuencia
      return ''; // Por ejemplo, puedes devolver una cadena vacía
    }
  }

  Future<String> getCurrentUserName(String userId) async {
    final userCollection = FirebaseFirestore.instance.collection('users');
    final userDocument = await userCollection.doc(userId).get();
    
    if (userDocument.exists) {
      final Map<String, dynamic>? user = userDocument.data();
      return user?["name"];
    } else {
      return "Unknown";
    }
  }
}

//import 'package:flutter/material.dart';
//import 'package:flutter_chat_ui/flutter_chat_ui.dart';
//import 'package:flutter_chat_types/flutter_chat_types.dart' as types;



/*class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text('Chat', style: TextStyle(color: Colors.black),),
          centerTitle: true,
        )
        ,
      ),
     body: Chat(messages: _messages, onSendPressed: _handleSendPressed, user: _user),
    );
  }
  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: "id",
      text: message.text,
    );

_addMessage(textMessage);
}
void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }
}*/