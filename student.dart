import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DepartmentYearPage extends StatefulWidget {
  final List<String> teachers;

  DepartmentYearPage({required this.teachers});

  @override
  _DepartmentYearPageState createState() => _DepartmentYearPageState();
}

class _DepartmentYearPageState extends State<DepartmentYearPage> {
  List<Teacher> teachers = [];
  String selectedYear = '1';
  String selectedDepartment = 'IT';

  @override
  void initState() {
    super.initState();
    for (var teacherName in widget.teachers) {
      teachers.add(Teacher(name: teacherName, rating: 0));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('$selectedDepartment - Year $selectedYear')),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
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
          Expanded(
            child: ListView.builder(
              itemCount: teachers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(teachers[index].name),
                  trailing: RatingBar.builder(
                    initialRating: teachers[index].rating,
                    minRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      setState(() {
                        teachers[index].rating = rating;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.check),
        onPressed: () async {
          // Your existing onPressed code...
        },
      ),
    );
  }
}

class Teacher {
  String name;
  double rating;

  Teacher({required this.name, this.rating = 0});
}
