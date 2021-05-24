import 'package:e_shop/DialogBox/errorDialog.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 130.0,
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            color:  Color(0xFFFDBE3B),
          ),
        ),

        title: Text(
          "DROP IT",
          style: TextStyle(fontSize: 55.0, color:Color(0xFF5C4057), fontFamily: "Signatra" ),

        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.amber,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [

                Text(
                  "Reset Password",
                  style: TextStyle(
                    fontSize: 35,
                    color: Color.fromRGBO(100, 61, 93, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30,),

                Container(
                  width: MediaQuery.of(context).size.width - 70,
                  height: 55,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 17,
                        color: Color.fromRGBO(100, 61, 93, 0.6),          ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Color.fromRGBO(100, 61, 93, 1),            ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color.fromRGBO(100, 61, 93, 0.6),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                ),

                SizedBox(height: 50,),

                MaterialButton(
                  onPressed: () {
                    auth.sendPasswordResetEmail(email: _email);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 200,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(100, 61, 93, 1),
                    ),
                    child: Center(
                      child:  Text(
                        "Sent Request",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}