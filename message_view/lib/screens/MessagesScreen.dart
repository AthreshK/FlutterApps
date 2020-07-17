import 'package:flutter/material.dart';
import 'package:message_view/core/queryPermissions.dart';
import 'package:message_view/pages/chatScreen.dart';
import 'package:message_view/screens/Auth.dart' as Auth;

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool permissionsGranted = false;

  @override
  void initState() {
    super.initState();

    queryPermissions().then((bool val) {
      setState(() {
        permissionsGranted = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF478DE0),
          automaticallyImplyLeading: false,
          title: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                  Auth.user.photoUrl,
                ),
                radius: 20,
                backgroundColor: Colors.transparent,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Hey there ${Auth.user.displayName} !',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Auth.signOutGoogle();
                  Navigator.of(context).pop();
                },
                color: Color(0xFF73AEF5),
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
          ),
        ),
        body: permissionsGranted
            ? new ChatScreen()
            : new Center(
                child: new CircularProgressIndicator(),
              ));
  }
}
