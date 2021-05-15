import 'package:firebase_auth/firebase_auth.dart';
import 'package:flogin/login.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return MaterialApp(
      title: 'Dashboard',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () => {
                      _auth.signOut().then((value) =>
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (route) => false))
                    })
          ],
        ),
        body: Center(
          child: Text('Hello user...'),
        ),
      ),
    );
  }
}
