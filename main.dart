import 'package:firebase_auth/firebase_auth.dart';
import 'package:flogin/dashboard.dart';
import 'package:flogin/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    checkUserAlreadyLogin().then((isLogin) {
      if (isLogin == true) {
        print('Already login');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
            (route) => false);
      } else {
        print('Not login');
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
            (route) => false);
      }
    });
    return Scaffold(
      body: Card(
        child: Center(
          child: Text(
            'Loading.....',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.indigo,
            ),
          ),
        ),
      ),
    );
  }

  checkUserAlreadyLogin() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return _auth
        .currentUser()
        .then((user) => user != null ? true : false)
        .catchError((onError) => false);
  }
}
