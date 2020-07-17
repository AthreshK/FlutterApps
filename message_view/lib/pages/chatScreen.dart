import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:message_view/core/messageMethods.dart';
import 'package:message_view/widgets/animatedOverlay.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  List<MessageModel> messages = [];
  bool spinner = false;
  @override
  void initState() {
    super.initState();
    getMessages();
  }

  Future getMessages() async {
    spinner = true;
    List<MessageModel> res = await getMessageData();

    setState(() {
      messages = res;
    });
    spinner = false;
  }

  @override
  Widget build(BuildContext context) {
    return new RefreshIndicator(
      onRefresh: getMessages,
      child: ModalProgressHUD(
        inAsyncCall: spinner,
        child: messages.length > 0
            ? new ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, i) => new Column(
                  children: <Widget>[
                    new Divider(height: 10.0),
                    new ListTile(
                      leading: new CircleAvatar(
                        backgroundColor: Colors.amber,
                        child: new Text(
                          messages[i].name[0],
                          style: new TextStyle(color: Colors.black),
                        ),
                      ),
                      title: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            messages[i].name,
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                          new Text(
                            messages[i].time,
                            style: new TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                      subtitle: new Container(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: new Text(
                          messages[i].message,
                          overflow: TextOverflow.ellipsis,
                          style: new TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).overlay.insert(
                              new AnimatedOverlay(
                                title: new Text(
                                  messages[i].name,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                content: new SingleChildScrollView(
                                  child: new Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Text(
                                        messages[i].message,
                                        textAlign: TextAlign.left,
                                        style: new TextStyle(fontSize: 15.0),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  new FlatButton(
                                    child: new Text("Copy"),
                                    onPressed: () async {
                                      await ClipboardManager.copyToClipBoard(
                                        messages[i].message,
                                      );
                                    },
                                  ),
                                ],
                              )(),
                            );
                      },
                    ),
                  ],
                ),
              )
            : new ListView.builder(
                itemCount: 1,
                itemBuilder: (context, i) => new Column(
                  children: <Widget>[
                    new Divider(height: 10.0),
                    new ListTile(
                      title: new Align(
                        alignment: Alignment.topCenter,
                        child: new Container(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: new Text(
                            "No messages",
                            style: new TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
