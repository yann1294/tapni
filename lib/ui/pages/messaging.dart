import 'package:chilli/models/user.dart';
import 'package:flutter/material.dart';

class Messaging extends StatefulWidget {
  final User currentUser, selectedUser;

  const Messaging({this.currentUser, this.selectedUser});

  @override
  _MessagingState createState() => _MessagingState();
}

class _MessagingState extends State<Messaging> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
