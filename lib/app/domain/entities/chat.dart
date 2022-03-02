import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:zap_2/app/domain/entities/message.dart';
import 'package:zap_2/app/domain/entities/user.dart';

class Chat extends Model {
  List<User> users = [
    User('ManelTeste', '111'),
    User('ManelTeste2', '222'),
    User('ManelTeste3', '333'),
  ];

  User? currentUser;
  List<User> friendList = [];
  List<Message> messages = [];
  SocketIO? socketIO;

  void init() {}
}
