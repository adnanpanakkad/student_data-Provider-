import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_list_provider/models/student_model.dart';
import 'package:student_list_provider/provider/img_function.dart';
import 'package:student_list_provider/provider/message.dart';
import 'package:student_list_provider/provider/student_function.dart';
import 'package:student_list_provider/screens/add/widgets/student_photo.dart';

class ScreenAdd extends StatelessWidget {
  ScreenAdd({super.key});
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final ageController = TextEditingController();
  final contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'New Student',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const StudentPhoto(),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: nameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => nameController.text.isEmpty
                      ? 'Name field is empty'
                      : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: mailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'Email Address',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => mailController.text.isEmpty
                      ? 'Email field is empty'
                      : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: ageController,
                  maxLength: 2,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.calendar_month),
                    hintText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      nameController.text.isEmpty ? 'Age field is empty' : null,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: contactController,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.contact_page),
                    hintText: 'Contact',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => nameController.text.isEmpty
                      ? 'Contact field is empty'
                      : null,
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<StudentImage>(
                  builder: (context, value, child) => Consumer<StudentData>(
                    builder: (context, data, child) => Consumer<AlertProvider>(
                      builder: (context, alert, child) => Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (value.imgPath == null) {
                                    alert.notSuccess(context);
                                  } else {
                                    isSccess(value, data, context);
                                  }
                                }
                              },
                              child: const Text('Submit'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void isSccess(
      StudentImage value, StudentData data, BuildContext context) async {
    final selectedImage = value.imgPath;
    if (selectedImage == null) {
      return;
    }

    final studentObject = StudentModel(
      id: DateTime.now(),
      profilepicture: selectedImage,
      name: nameController.text.trim(),
      email: mailController.text.trim(),
      age: int.parse(ageController.text),
      contact: int.parse(contactController.text.trim()),
    );

    data.addStudent(studentObject);
    value.imgPath = null;
    Navigator.of(context).pop();
  }
}
