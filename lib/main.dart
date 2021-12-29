import 'package:flutter/material.dart';
import 'package:flutterdeneme/models/student.dart';
import 'package:flutterdeneme/screens/student_add.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp()
  ));
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğreni Takip Sistemi";
  Student selectedStudent = Student.withId(0,"","",0);
  List<Student> students = [Student.withId(1,"Melihcan", "Sarıkaya", 55),Student.withId(2,"Funda", "Sarıkaya", 25),Student.withId(3,"Nuri", "Aydın", 45)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context)


    );
  }

  void mesajGoster(BuildContext context, String mesaj){
    var alert = AlertDialog(
      title: Text("İşlem sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/62643822?v=4"),
                    ),
                    title: Text(students[index].firstName + " " + students[index].lastName),
                    subtitle: Text("Sınavdan aldığı not : " + students[index].grade.toString() + " [" + students[index].getStatus + "]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: (){
                      setState(() {
                        selectedStudent = students[index];
                      });
                    },
                  );
                })
        ),
        Text("Seçili öğrenci : " + selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 5.0),
                      Text("Yeni öğrenci"),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder : (context) => StudentAdd()));
                  },
                ),
              ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                child: Row(
                  children: [
                    Icon(Icons.update),
                    SizedBox(width: 5.0),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  var mesaj = "Güncellendi!";
                  mesajGoster(context, mesaj);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 2.0),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var mesaj = "Silindi : " + selectedStudent.firstName;
                  mesajGoster(context, mesaj);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if(grade>=50){
      return Icon(Icons.done);
    }else if(grade>=40){
      return Icon(Icons.album);
    }else {
      return Icon(Icons.clear);
    }
  }
}