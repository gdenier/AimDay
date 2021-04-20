import 'package:aimday/screens/guest/auth/Email.dart';
import 'package:aimday/screens/guest/auth/Password.dart';
import 'package:aimday/screens/guest/auth/Term.dart';
import 'package:flutter/material.dart';

class Guest extends StatefulWidget {
  @override
  _GuestState createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  List<Widget> _authScreens = [];
  int _screenSelected = 0;

  @override
  void initState() {
    super.initState();

    _authScreens.addAll([
      Email(
        next: () => setState(() => _screenSelected++),
      ),
      Term(
        next: () => setState(() => _screenSelected++),
        previous: () => setState(() => _screenSelected--),
      ),
      Password(
        previous: () => setState(() => _screenSelected = 0),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _authScreens.elementAt(_screenSelected),
    );
  }
}
