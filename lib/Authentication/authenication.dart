import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'package:e_shop/Config/config.dart';


class AuthenticScreen extends StatefulWidget {
  @override
  _AuthenticScreenState createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
       appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            color: Color(0xFFFDBE3B)
          ),
        ),
        title: Text(
          "DROP IT",
          style: TextStyle(fontSize: 40.0, color:Color(0xFF5C4057), fontFamily: "Poppins",fontWeight: FontWeight.bold ),

        ),
        centerTitle: true,
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.lock, color: Color(0xFF5C4057),),
              text: "Login",
            ),
            Tab(
              icon: Icon(Icons.person, color: Color(0xFF5C4057),),
              text: "SIGN UP",
            ),
          ],
          indicatorColor: Colors.white38,
          indicatorWeight: 5.0,
        ),
       ),
        body: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFDBE3B)
          ),
          child: TabBarView(
            children: [
              Login(),
              Register(), 
            ]),
        ),
      ),  
    );
  }
}
