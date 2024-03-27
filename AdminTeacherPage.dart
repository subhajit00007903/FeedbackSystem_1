import 'package:flutter/material.dart';

class AdminTeacherPage extends StatefulWidget {
  final List<String> teachers;

  AdminTeacherPage({required this.teachers});

  @override
  _AdminTeacherPageState createState() => _AdminTeacherPageState();
}

class _AdminTeacherPageState extends State<AdminTeacherPage> {
  String dropdownValue = '';

  void addTeacher(String teacherName) {
    setState(() {
      widget.teachers.add(teacherName);
      dropdownValue = widget.teachers.first;
    });
    Navigator.pop(context, widget.teachers);
  }

  void removeTeacher(String teacherName) {
    setState(() {
      widget.teachers.remove(teacherName);
      dropdownValue = widget.teachers.isNotEmpty ? widget.teachers.first : '';
    });
    Navigator.pop(context, widget.teachers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Admin Teacher Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (newValue) {
                setState(() {
                  dropdownValue = newValue as String;
                });
              },
              items: widget.teachers.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // background color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () => removeTeacher(dropdownValue),
                child: Text('Remove Teacher'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // background color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController customController = TextEditingController();
                      return AlertDialog(
                        title: Text('Add Teacher'),
                        content: TextField(
                          controller: customController,
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text('Submit'),
                            onPressed: () {
                              addTeacher(customController.text);
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    },
                  );
                },
                child: Text('Add Teacher'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
