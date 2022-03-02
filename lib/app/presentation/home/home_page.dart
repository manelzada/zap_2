import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:zap_2/app/application/home/home_page_store.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:zap_2/app/domain/entities/chat_model.dart';
import 'package:zap_2/app/presentation/components/chat_bubble.dart';
import 'package:zap_2/app/presentation/components/custom_text_formfield_component.dart';

import '../../domain/constants/k_api_url.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({Key? key, required this.name}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomePageStore> {
  final _messageEditingController = TextEditingController();
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();
  final List<ChatModel> _messages = [];
  IO.Socket? socket;

  void setStateIfMounted(f) {
    if (mounted) setState(f);
  }

  @override
  void initState() {
    connect();
    super.initState();
  }

  @override
  void dispose() {
    _messageEditingController.dispose();
    socket?.disconnect();
    super.dispose();
  }

  void connect() {
    try {
      socket = IO.io(kApiUrl, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
      });
      socket?.connect();

      socket?.on('message', (data) {
        var message = ChatModel.fromJson(data);
        setStateIfMounted(() {
          _messages.add(message);
        });
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void _sendMessage() {
    String messageText = _messageEditingController.text.trim();
    _messageEditingController.text = '';
    if (messageText != '') {
      socket?.emit(
        'message',
        ChatModel(
          id: socket?.id,
          name: widget.name,
          message: messageText,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFFEAEFF2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    controller: _scrollController,
                    shrinkWrap: false,
                    reverse: _messages.isEmpty ? false : true,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 10, right: 10, bottom: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: _messages.map((message) {
                            // ignore: avoid_print
                            print(message);
                            bool isEqual() {
                              if (message.id == socket?.id) {
                                return true;
                              } else {
                                return false;
                              }
                            }

                            return ChatBubble(
                              isMe: isEqual(),
                              message: message.message,
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                    top: 5, left: 20, right: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextFormFieldComponent(
                        label: 'Digite a mensagem',
                        textInputType: TextInputType.text,
                        focusNode: _focusNode,
                        textEditingController: _messageEditingController,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _sendMessage();
                        _focusNode.unfocus();
                        _messageEditingController.clear();
                      },
                      icon: const Icon(
                        Icons.send,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
