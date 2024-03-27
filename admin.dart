import 'package:fetwo/pages/AdminTeacherPage.dart';
import 'package:flutter/material.dart';
import 'package:fetwo/pages/AdminTeacherPage.dart'; // Import the AdminTeacherPage

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  String selectedYear = '1';
  String selectedDepartment = 'IT';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Admin Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: selectedYear,
              items: ['1', '2', '3', '4'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedYear = newValue!;
                });
              },
            ),
            DropdownButton<String>(
              value: selectedDepartment,
              items: ['IT', 'CSBS', 'CSE'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedDepartment = newValue!;
                });
              },
            ),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminTeacherPage(teachers: [],)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
