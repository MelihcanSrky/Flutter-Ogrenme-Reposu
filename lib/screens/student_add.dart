import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State<StudentAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni öğrenci ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Öğrenci Adı", hintText: "Melihcan"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
