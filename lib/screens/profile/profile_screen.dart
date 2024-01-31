import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_list_provider/provider/student_function.dart';
import 'package:student_list_provider/screens/edit/edit_screen.dart';

int? student;
class ScreenProfile extends StatelessWidget {
  const ScreenProfile({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    student=index;
    return Consumer<StudentData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
            title: const Text('Student Profile', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
            backgroundColor: Colors.grey),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage:
                              FileImage(File(value.students[index].profilepicture)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'NAME : ${value.students[index].name}',
                        style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'EMAIL : ${value.students[index].email}',
                        style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text( 
                        'AGE : ${value.students[index].age}',
                        style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'CONTACT : ${value.students[index].contact}',
                        style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ), 
            ),
            ElevatedButton.icon(
                onPressed: () =>navigateToedit(context,student),
                icon: const Icon(Icons.edit),
                label: const Text('Edit')),
          ],
        ),
      ),
    );
  }
}
void navigateToedit(BuildContext context,int? index) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>  ScreenEdit(index: index!), 
    ),
  );
}