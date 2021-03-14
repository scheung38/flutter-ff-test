import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'firebase_user_provider.freezed.dart';

@freezed
abstract class EveryvoiceFfFirebaseUser implements _$EveryvoiceFfFirebaseUser {
  factory EveryvoiceFfFirebaseUser.user(User user) = _User;
  factory EveryvoiceFfFirebaseUser.loggedOut() = _LoggedOut;
  factory EveryvoiceFfFirebaseUser.initial() = _Initial;
}

bool loggedIn = false;

final everyvoiceFfFirebaseUser = FirebaseAuth.instance
    .userChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<EveryvoiceFfFirebaseUser>((user) {
  loggedIn = user != null;
  return user != null
      ? EveryvoiceFfFirebaseUser.user(user)
      : EveryvoiceFfFirebaseUser.loggedOut();
}).shareValueSeeded(EveryvoiceFfFirebaseUser.initial());

EveryvoiceFfFirebaseUser get currentUser => everyvoiceFfFirebaseUser.value;
