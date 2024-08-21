import 'package:flutter/material.dart';
import 'package:giggle_chat_app/constants.dart';
import 'package:giggle_chat_app/models/message.dart';
import 'package:giggle_chat_app/widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  static String id = 'ChatPage';

  final _controller = ScrollController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);

  TextEditingController controller = TextEditingController();

  void sendMessage(String email) {
    if (controller.text.trim().isNotEmpty) {
      messages.add({
        'message': controller.text.trim(),
        'createdAt': DateTime.now(),
        'id': email,
      });
      controller.clear();
      _controller.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)?.settings.arguments;
    final email = args is String ? args : '';

    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Message> messagesList = [];

            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
            }

            return Scaffold(
              backgroundColor: const Color(0xffC5DBF0),
              appBar: AppBar(
                surfaceTintColor: Colors.transparent,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kLogo,
                      height: 45,
                    ),
                    const SizedBox(width: 15),
                    const Text(
                      "Chat",
                      style: TextStyle(fontSize: 30, color: Color(0xff230462)),
                    )
                  ],
                ),
                centerTitle: true,
                backgroundColor: const Color(0xff96B8DB),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          reverse: true,
                          controller: _controller,
                          itemCount: messagesList.length,
                          itemBuilder: (context, index) {
                            return messagesList[index].id == email
                                ? ChatBubble(
                                    message: messagesList[index],
                                  )
                                : ChatBubbleForFriend(
                                    message: messagesList[index]);
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              maxLines: 4,
                              minLines: 1,
                              cursorColor: const Color(0xff203590),
                              style: const TextStyle(
                                color: Color(0xff230462),
                                fontSize: 20,
                              ),
                              controller: controller,
                              onSubmitted: (data) {
                                sendMessage(email);
                              },
                              decoration: InputDecoration(
                                hintText: "Message",
                                hintStyle: const TextStyle(
                                    color: Color(0xff230462), fontSize: 18),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                      width: 3,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    width: 3,
                                    color: Color(0xff6083C5),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                    width: 3,
                                    color: Color(0xff6083C5),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ClipOval(
                            child: Container(
                              color: const Color(0xff96B8DB),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.send,
                                  color: Color(0xff203590),
                                ),
                                onPressed: () {
                                  sendMessage(email);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              backgroundColor: Color(0xffE6E5E0),
              body: Center(
                child: CircularProgressIndicator(
                  color: Color(0xff203590),
                  backgroundColor: Color(0xffC5DBF0),
                ),
              ),
            );
          }
        });
  }
}
