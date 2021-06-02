import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HastaneFirebaseUser {
  HastaneFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

HastaneFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HastaneFirebaseUser> hastaneFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<HastaneFirebaseUser>(
        (user) => currentUser = HastaneFirebaseUser(user));
