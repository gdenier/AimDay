import 'package:flutter/material.dart';
import 'package:zxcvbn/zxcvbn.dart';

class Password extends StatefulWidget {
  final Function() previous;

  Password({
    Key key,
    this.previous,
  }) : super(key: key);

  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  bool _isSecret = true;

  String _password = '';

  bool validatePassword(String password) {
    final result = Zxcvbn().evaluate(password);
    print(result.score);
    return result.score > 2.0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          centerTitle: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => widget.previous(),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Text(
                  'password'.toUpperCase(),
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: _keyForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Entrez votre mot de passe'),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        onChanged: (value) => setState(() => _password = value),
                        validator: (value) => value.isEmpty ||
                                !validatePassword(value)
                            ? 'password trop faible, utilisez une majuscule, des nombre et un caracteres spéciale'
                            : null,
                        obscureText: _isSecret,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () => setState(() => _isSecret = !_isSecret),
                            child: Icon(_isSecret
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          hintText: 'password',
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
                        onPressed: () {
                          if (_keyForm.currentState.validate()) {
                            print(_password);
                          }
                        },
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
