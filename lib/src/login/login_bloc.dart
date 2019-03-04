import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sample_arch/src/app_store.dart';

class LoginBloc {
  final Store<AppState> _store;
  final _emailSubject = BehaviorSubject<String>();
  final _passwordSubject = BehaviorSubject<String>();

  LoginBloc(this._store) {
    print("$this New Login Bloc");
  }

  void login() {
    this._store.dispatch(NavigateToAction.replace("/dashboard"));
  }

  onEmailChanged(String email) {
    _emailSubject.add(email);
  }

  onPasswordChanged(String password) {
    _passwordSubject.add(password);
  }

  //This shows sample of data processing within bloc without interaction with Redux.
  getEmail() {
    return _emailSubject.distinct().debounce(Duration(milliseconds: 200));
  }

  void dispose() {
    _emailSubject.close();
    _passwordSubject.close();
    print("$this Login Bloc Disposed");
  }
}
