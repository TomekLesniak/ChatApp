import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    if (_formKey.currentState.validate()) {
      FocusScope.of(context).unfocus();
      _formKey.currentState.save();

      print(_userEmail);
      print(_userName);
      print(_userPassword);

      //Send requqest
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('email'),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                    ),
                    validator: (input) {
                      if (input.isEmpty) return 'Email can not be empty';

                      var isValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(input);
                      if (!isValid) return 'Invalid email';

                      return null;
                    },
                    onSaved: (value) {
                      _userEmail = value;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (input) {
                        if (input.length <= 6)
                          return 'Username must containts at least 6 characters.';

                        return null;
                      },
                      onSaved: (value) => _userName = value,
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (input) {
                      if (input.length < 7)
                        return 'Password must contains at least 6 character';

                      return null;
                    },
                    onSaved: (value) => _userPassword = value,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  RaisedButton(
                    child: Text(_isLogin ? 'Login' : 'Signup'),
                    onPressed: _trySubmit,
                  ),
                  FlatButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(
                          _isLogin ? 'Create new account' : 'Login instead'),
                      textColor: Theme.of(context).primaryColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
