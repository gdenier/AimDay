import 'package:flutter/material.dart';

class Email extends StatefulWidget {
  final Function() next;

  Email({
    Key key,
    this.next,
  }) : super(key: key);

  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

  String _email = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'organiser vos vacances\n'.toUpperCase(),
                    style: TextStyle(color: Colors.black, fontSize: 24),
                    children: [
                      TextSpan(
                        text: 'entre amis\n'.toUpperCase(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'très simplement'.toUpperCase(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Ca commence ici',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 100,
                ),
                Form(
                  key: _keyForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Entrez votre email'),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _email = value),
                        validator: (value) =>
                            value.isEmpty || !emailRegex.hasMatch(value)
                                ? 'Entrez une adresse email valide'
                                : null,
                        decoration: InputDecoration(
                          hintText: 'john.do@domain.ltd',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          elevation: 0,
                          primary: Theme.of(context).primaryColor,
                        ),
                        onPressed: emailRegex.hasMatch(_email)
                            ? () {
                                if (_keyForm.currentState.validate()) {
                                  widget.next();
                                }
                              }
                            : null,
                        child: Text(
                          'continuer'.toUpperCase(),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
