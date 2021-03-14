import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/firebase_user_provider.dart';
import 'package:everyvoice_ff/landing/landing_widget.dart';
import 'package:everyvoice_ff/landing/landing_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EveryvoiceFfHomePage(),
    );
  }
}

class EveryvoiceFfHomePage extends StatelessWidget {
  const EveryvoiceFfHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<EveryvoiceFfFirebaseUser>(
      stream: everyvoiceFfFirebaseUser,
      initialData: everyvoiceFfFirebaseUser.value,
      builder: (context, snapshot) {
        return snapshot.data.when(
          user: (_) => LandingWidget(),
          loggedOut: () => LandingWidget(),
          initial: () => Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4b39ef)),
              ),
            ),
          ),
        );
      },
    );
  }
}
