import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:sample_arch/src/app_store.dart';

class DashboardBloc {
  final Store<AppState> _store;

  DashboardBloc(this._store) {
    print("$this New Dashboard Bloc");
  }

  void logout() {
    this._store.dispatch(NavigateToAction.replace("/login"));
  }
}