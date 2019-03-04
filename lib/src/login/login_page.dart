import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sample_arch/src/app_store.dart';
import 'package:sample_arch/src/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginBloc>(
      converter: (store) {
        return LoginBloc(store);
      },
      onDidChange: (bloc) {
        bloc.dispose();
      },
      builder: (BuildContext context, LoginBloc bloc) {
        return Scaffold(
            appBar: AppBar(
              title: Text('Login Page'),
            ),
            body: Builder(
              builder: (BuildContext context) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        StreamBuilder(
                          stream: bloc.getEmail(),
                          initialData: "",
                          builder: (context, stream) {
                            return Text(stream.data);
                          },
                        ),
                        TextField(onChanged: (input) {
                          bloc.onEmailChanged(input);
                        }),
                        TextField(
                          onChanged: (input) {
                            bloc.onPasswordChanged(input);
                          },
                          obscureText: true,
                        ),
                        RaisedButton(
                          onPressed: () {
                            bloc.login();
                          },
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ));
      },
    );
  }
}
