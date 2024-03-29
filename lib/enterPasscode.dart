import 'package:createpasscodepage/src/resources/fontsclass.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class EnterPasscode extends StatefulWidget {
  @override
  _EnterPasscodeState createState() => _EnterPasscodeState();
}

final TextEditingController _userPasswordController =
    new TextEditingController();
final _formKey = GlobalKey<FormState>();

List passcode = [];
var counter = 1;

var concatinate1 = "";
var concatinate2 = "";
var finalPasscode = "";
var textFieldCounter = 1;
var dynamictext = "Enetr Passcode";
var password = "";

double numberFontSize = 20;
bool obscuretext = true;

class _EnterPasscodeState extends State<EnterPasscode> {
  var firstController = TextEditingController(text: "");
  var secondController = TextEditingController(text: "");
  var thirdController = TextEditingController(text: "");
  var fourthController = TextEditingController(text: "");

  void validateReEnterPasscocde() {
    textFieldCounter = 1;

    concatinate2 = passcode.reduce((value, element) => value + element);

    setState(() {
      firstController.clear();
      secondController.clear();
      thirdController.clear();
      fourthController.clear();

      passcode.clear();
    });

    if (concatinate1 == concatinate2) {
      finalPasscode = concatinate1;
      dynamictext = "Passcode Added";

      Toast.show(
        "Passcode added successfully $finalPasscode",
        context,
        duration: Toast.LENGTH_SHORT,
        gravity: Toast.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      concatinate2 = "";
      concatinate1 = "";
      passcode.clear();
    } else {
      concatinate2 = "";
      passcode.clear();

      Toast.show(
        "Passcode missmatch, Please try again",
        context,
        duration: Toast.LENGTH_SHORT,
        gravity: Toast.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  void validatePasscodeFields() {
    textFieldCounter = 1;

    firstController.clear();
    secondController.clear();
    thirdController.clear();
    fourthController.clear();

    if ((passcode.length == 4)) {
      concatinate1 = passcode.reduce((value, element) => value + element);
      dynamictext = "Re Enter Passcode";
      print(concatinate1);
      passcode.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkPasswordDialog());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0, backgroundColor: Colors.white),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text(
                dynamictext,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: fonts().fontRegular),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 55, right: 55, top: 0, bottom: 0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 60,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2, color: Colors.grey.shade200))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 35, color: Colors.grey.shade700),
                              // textDirection: ,
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                              ),
                              obscureText: obscuretext,
                              enabled: false,
                              controller: firstController,
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2, color: Colors.grey.shade200))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 35, color: Colors.grey.shade700),
                              // textDirection: ,
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                              ),
                              obscureText: obscuretext,
                              enabled: false,
                              controller: secondController,
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2, color: Colors.grey.shade200))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 35, color: Colors.grey.shade700),
                              // textDirection: ,
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                              ),
                              obscureText: obscuretext,
                              enabled: false,
                              controller: thirdController,
                            ),
                          ),
                        ),
                        Container(
                          width: 60,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2, color: Colors.grey.shade200))),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              style: TextStyle(
                                  fontSize: 35, color: Colors.grey.shade700),
                              // textDirection: ,
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent)),
                              ),
                              obscureText: obscuretext,
                              enabled: false,
                              controller: fourthController,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        elevation: 0,
                        type: MaterialType.circle,
                        child: InkWell(
                          splashColor: Colors.blue.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          onTap: () {
                            print("object");
                            setState(() {
                              if (textFieldCounter == 1) {
                                firstController.text = "1";
                                textFieldCounter++;
                                passcode.add('1');
                              } else if (textFieldCounter == 2) {
                                secondController.text = "1";
                                textFieldCounter++;
                                passcode.add('1');
                              } else if (textFieldCounter == 3) {
                                thirdController.text = "1";
                                textFieldCounter++;
                                passcode.add('1');
                              } else if (textFieldCounter == 4) {
                                fourthController.text = "1";
                                passcode.add('1');

                                if (concatinate1 == "" && concatinate2 == "") {
                                  validatePasscodeFields();
                                } else {
                                  validateReEnterPasscocde();
                                }
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Text(
                              "1",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: numberFontSize,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fonts().fontRegular),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.white,
                        elevation: 0,
                        type: MaterialType.circle,
                        child: InkWell(
                          splashColor: Colors.blue.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          onTap: () {
                            print("object");
                            setState(() {
                              if (textFieldCounter == 1) {
                                firstController.text = "2";
                                textFieldCounter++;
                                passcode.add('2');
                              } else if (textFieldCounter == 2) {
                                secondController.text = "2";
                                textFieldCounter++;
                                passcode.add('2');
                              } else if (textFieldCounter == 3) {
                                thirdController.text = "2";
                                textFieldCounter++;
                                passcode.add('2');
                              } else if (textFieldCounter == 4) {
                                fourthController.text = "2";
                                passcode.add('2');

                                if (concatinate1 == "" && concatinate2 == "") {
                                  validatePasscodeFields();
                                } else {
                                  validateReEnterPasscocde();
                                }
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Text(
                              "2",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: numberFontSize,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fonts().fontRegular),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.white,
                        elevation: 0,
                        type: MaterialType.circle,
                        child: InkWell(
                          splashColor: Colors.blue.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          onTap: () {
                            print("object");
                            setState(() {
                              if (textFieldCounter == 1) {
                                firstController.text = "3";
                                textFieldCounter++;
                                passcode.add('3');
                              } else if (textFieldCounter == 2) {
                                secondController.text = "3";
                                textFieldCounter++;
                                passcode.add('3');
                              } else if (textFieldCounter == 3) {
                                thirdController.text = "3";
                                textFieldCounter++;
                                passcode.add('3');
                              } else if (textFieldCounter == 4) {
                                fourthController.text = "3";
                                passcode.add('3');

                                if (concatinate1 == "" && concatinate2 == "") {
                                  validatePasscodeFields();
                                } else {
                                  validateReEnterPasscocde();
                                }
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Text(
                              "3",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: numberFontSize,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fonts().fontRegular),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        elevation: 0,
                        type: MaterialType.circle,
                        child: InkWell(
                          splashColor: Colors.blue.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          onTap: () {
                            print("object");
                            setState(() {
                              if (textFieldCounter == 1) {
                                firstController.text = "4";
                                textFieldCounter++;
                                passcode.add('4');
                              } else if (textFieldCounter == 2) {
                                secondController.text = "4";
                                textFieldCounter++;
                                passcode.add('4');
                              } else if (textFieldCounter == 3) {
                                thirdController.text = "4";
                                textFieldCounter++;
                                passcode.add('4');
                              } else if (textFieldCounter == 4) {
                                fourthController.text = "4";
                                passcode.add('4');

                                if (concatinate1 == "" && concatinate2 == "") {
                                  validatePasscodeFields();
                                } else {
                                  validateReEnterPasscocde();
                                }
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Text(
                              "4",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: numberFontSize,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fonts().fontRegular),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.white,
                        elevation: 0,
                        type: MaterialType.circle,
                        child: InkWell(
                          splashColor: Colors.blue.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          onTap: () {
                            print("object");
                            setState(() {
                              if (textFieldCounter == 1) {
                                firstController.text = "5";
                                textFieldCounter++;
                                passcode.add('5');
                              } else if (textFieldCounter == 2) {
                                secondController.text = "5";
                                textFieldCounter++;
                                passcode.add('5');
                              } else if (textFieldCounter == 3) {
                                thirdController.text = "5";
                                textFieldCounter++;
                                passcode.add('5');
                              } else if (textFieldCounter == 4) {
                                fourthController.text = "5";
                                passcode.add('5');

                                if (concatinate1 == "" && concatinate2 == "") {
                                  validatePasscodeFields();
                                } else {
                                  validateReEnterPasscocde();
                                }
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Text(
                              "5",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: numberFontSize,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fonts().fontRegular),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.white,
                        elevation: 0,
                        type: MaterialType.circle,
                        child: InkWell(
                          splashColor: Colors.blue.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          onTap: () {
                            print("object");
                            setState(() {
                              if (textFieldCounter == 1) {
                                firstController.text = "6";
                                textFieldCounter++;
                                passcode.add('6');
                              } else if (textFieldCounter == 2) {
                                secondController.text = "6";
                                textFieldCounter++;
                                passcode.add('6');
                              } else if (textFieldCounter == 3) {
                                thirdController.text = "6";
                                textFieldCounter++;
                                passcode.add('6');
                              } else if (textFieldCounter == 4) {
                                fourthController.text = "6";
                                passcode.add('6');

                                if (concatinate1 == "" && concatinate2 == "") {
                                  validatePasscodeFields();
                                } else {
                                  validateReEnterPasscocde();
                                }
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Text(
                              "6",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: numberFontSize,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fonts().fontRegular),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        elevation: 0,
                        type: MaterialType.circle,
                        child: InkWell(
                          splashColor: Colors.blue.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          onTap: () {
                            print("object");
                            setState(() {
                              if (textFieldCounter == 1) {
                                firstController.text = "7";
                                textFieldCounter++;
                                passcode.add('7');
                              } else if (textFieldCounter == 2) {
                                secondController.text = "7";
                                textFieldCounter++;
                                passcode.add('7');
                              } else if (textFieldCounter == 3) {
                                thirdController.text = "7";
                                textFieldCounter++;
                                passcode.add('7');
                              } else if (textFieldCounter == 4) {
                                fourthController.text = "7";
                                passcode.add('7');

                                if (concatinate1 == "" && concatinate2 == "") {
                                  validatePasscodeFields();
                                } else {
                                  validateReEnterPasscocde();
                                }
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Text(
                              "7",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: numberFontSize,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fonts().fontRegular),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.white,
                        elevation: 0,
                        type: MaterialType.circle,
                        child: InkWell(
                          splashColor: Colors.blue.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          onTap: () {
                            print("object");
                            setState(() {
                              if (textFieldCounter == 1) {
                                firstController.text = "8";
                                textFieldCounter++;
                                passcode.add('8');
                              } else if (textFieldCounter == 2) {
                                secondController.text = "8";
                                textFieldCounter++;
                                passcode.add('8');
                              } else if (textFieldCounter == 3) {
                                thirdController.text = "8";
                                textFieldCounter++;
                                passcode.add('8');
                              } else if (textFieldCounter == 4) {
                                fourthController.text = "8";
                                passcode.add('8');

                                if (concatinate1 == "" && concatinate2 == "") {
                                  validatePasscodeFields();
                                } else {
                                  validateReEnterPasscocde();
                                }
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Text(
                              "8",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: numberFontSize,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fonts().fontRegular),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.white,
                        elevation: 0,
                        type: MaterialType.circle,
                        child: InkWell(
                          splashColor: Colors.blue.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          onTap: () {
                            print("object");
                            setState(() {
                              if (textFieldCounter == 1) {
                                firstController.text = "9";

                                textFieldCounter++;
                                passcode.add('9');
                              } else if (textFieldCounter == 2) {
                                secondController.text = "9";

                                textFieldCounter++;
                                passcode.add('9');
                              } else if (textFieldCounter == 3) {
                                thirdController.text = "9";

                                textFieldCounter++;
                                passcode.add('9');
                              } else if (textFieldCounter == 4) {
                                fourthController.text = "9";
                                passcode.add('9');

                                if (concatinate1 == "" && concatinate2 == "") {
                                  validatePasscodeFields();
                                } else {
                                  validateReEnterPasscocde();
                                }
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Text(
                              "9",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: numberFontSize,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fonts().fontRegular),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        color: Colors.white,
                        elevation: 0,
                        type: MaterialType.circle,
                        child: InkWell(
                          splashColor: Colors.blue.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          onTap: () {
                            setState(() {
                              if (textFieldCounter == 4) {
                                thirdController.clear();
                                passcode.removeAt(2);

                                textFieldCounter = 3;
                              } else if (textFieldCounter == 3) {
                                secondController.clear();

                                passcode.removeAt(1);

                                textFieldCounter = 2;
                              } else if (textFieldCounter == 2) {
                                firstController.clear();

                                passcode.removeAt(0);

                                textFieldCounter = 1;
                                passcode.clear();
                              }
                            });
                            print("object");
                          },
                          child: Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Icon(
                                Icons.backspace,
                                size: 22,
                              )),
                        ),
                      ),
                      Material(
                        color: Colors.white,
                        elevation: 0,
                        type: MaterialType.circle,
                        child: InkWell(
                          splashColor: Colors.blue.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          onTap: () {
                            print("object");
                            setState(() {
                              if (textFieldCounter == 1) {
                                firstController.text = "0";
                                textFieldCounter++;
                                passcode.add('0');
                              } else if (textFieldCounter == 2) {
                                secondController.text = "0";
                                textFieldCounter++;
                                passcode.add('0');
                              } else if (textFieldCounter == 3) {
                                thirdController.text = "0";
                                textFieldCounter++;
                                passcode.add('0');
                              } else if (textFieldCounter == 4) {
                                fourthController.text = "0";
                                passcode.add('0');

                                if (concatinate1 == "" && concatinate2 == "") {
                                  validatePasscodeFields();
                                } else {
                                  validateReEnterPasscocde();
                                }
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Text(
                              "0",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: numberFontSize,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: fonts().fontRegular),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.white,
                        elevation: 0,
                        type: MaterialType.circle,
                        child: InkWell(
                          splashColor: Colors.blue.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          onTap: () {
                            print("object");

                            if (concatinate1 == "" && concatinate2 == "") {
                              validatePasscodeFields();
                            } else {
                              validateReEnterPasscocde();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Icon(
                              Icons.check,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _checkPasswordDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  size: 18,
                  color: Colors.white,
                ),
              ),
              new Text(
                "Enter Current Password",
                style: TextStyle(
                    fontFamily: fonts().fontMedium,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.close,
                color: Colors.white,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 60),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _userPasswordController,
                      obscureText: true,
                      style: TextStyle(
                          height: 1,
                          fontFamily: fonts()
                              .fontRegular), //This will obscure text dynamically
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          labelStyle: TextStyle(
                              fontFamily: fonts().fontRegular, fontSize: 12),
                          hintStyle: TextStyle(
                              fontFamily: fonts().fontRegular, fontSize: 10),
                          errorStyle:
                              TextStyle(fontFamily: fonts().fontRegular),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1))),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Worng password';
                        }
                        return null;
                      }),
                  onChanged: () {
                    password = _userPasswordController.text;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
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
                        Toast.show("Password matched - $password", context,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            duration: Toast.LENGTH_LONG,
                            gravity: Toast.TOP);
                        Navigator.pop(context);
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
      },
    );
  }
}
