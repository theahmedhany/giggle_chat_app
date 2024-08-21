import 'package:giggle_chat_app/constants.dart';

class Message {
  final String message;
  final String id;

  Message(this.message, this.id);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessages], jsonData['id']);
  }
}
