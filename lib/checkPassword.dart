import 'package:createpasscodepage/enterPasscode.dart';
import 'package:flutter/material.dart';
import 'package:createpasscodepage/src/resources/fontsclass.dart';
import 'package:toast/toast.dart';

class CheckPassword extends StatefulWidget {
  @override
  _CheckPasswordState createState() => _CheckPasswordState();
}

final TextEditingController _userPasswordController =
    new TextEditingController();
final _formKey = GlobalKey<FormState>();

bool passwordVisible = true;
var originalPassword = "admin";

@override
void initState() {
  passwordVisible = true;
}

class _CheckPasswordState extends State<CheckPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Enter Current Password",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: fonts().fontRegular),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _userPasswordController,
                      obscureText: passwordVisible,
                      style: TextStyle(
                          fontFamily: fonts()
                              .fontRegular), //This will obscure text dynamically
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          labelStyle: TextStyle(
                              fontFamily: fonts().fontRegular, fontSize: 15),
                          hintStyle: TextStyle(
                              fontFamily: fonts().fontRegular, fontSize: 13),
                          errorStyle:
                              TextStyle(fontFamily: fonts().fontRegular),
                          // Here is key idea
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                      validator: (value) {
                        if (value != originalPassword || value.isEmpty) {
                          return 'Worng password';
                        }
                        return null;
                      }),
                  // onChanged: () {
                  //   _formKey.currentState.validate();
                  // },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                color: Colors.blue,
                onPressed: () {
                  _formKey.currentState.validate();
                  if (_formKey.currentState.validate()) {
                    Toast.show("Password matched", context,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        duration: Toast.LENGTH_LONG,
                        gravity: Toast.TOP);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EnterPasscode()));
                  } else {
                    Toast.show("Wrong Password", context,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        duration: Toast.LENGTH_LONG,
                        gravity: Toast.TOP);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("PROCEED",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: fonts().fontRegular),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
