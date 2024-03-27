import 'package:fetwo/pages/admin.dart';
import 'package:fetwo/pages/student.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String password = '';
  bool showPasswordField = false;
  String userType = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/HIT.png', height: 270), // Adjust the image height as needed
            SizedBox(height:21),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(21.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showPasswordField = true;
                          userType = 'admin';
                        });
                      },
                      child: Text('Admin Login', style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(21.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          showPasswordField = true;
                          userType = 'student';
                        });
                      },
                      child: Text('Student Login', style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height:3,),
            Visibility(
              visible: showPasswordField,
              child: _buildPasswordField(),
            ),
            SizedBox(height: 8,), // Adjust the space as needed
            Visibility(
              visible: showPasswordField,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (userType == 'admin') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AdminPage()),
                      );
                    } else if (userType == 'student') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DepartmentYearPage(teachers: [],)),
                      );
                    }
                  }
                },
                child: Text('Submit', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      width: 250, // Adjust the width as needed
      child: Form(
        key: _formKey,
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18.0), // Adjust the border radius as needed
            ),
          ),
          onChanged: (value) {
            password = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter password';
            } else if (value != userType) {
              return 'Invalid password';
            }
            return null;
          },
        ),
      ),
    );
  }
}

class StudentPage {
}
