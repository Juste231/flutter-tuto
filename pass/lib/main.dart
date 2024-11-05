import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pass/infos.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  Formpage(),
    );
  }
}

class Formpage extends StatelessWidget {
   Formpage({super.key});

  final formKey = GlobalKey<FormState>();
  final firstnameController = new TextEditingController();
  final lastnameController = new TextEditingController();
  final profController = new TextEditingController();
  final ageController = new TextEditingController();


  @override





  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulaire"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Form(
              key: formKey,
              child: Column(
               children: [

                 TextFormField(
                   controller: lastnameController,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     icon: Icon(Icons.person),
                     hintText: "Quel est votre nom" ,
                     labelText: "Nom *",
                   ),
                   validator: (String? value){
                     return (value==null || value == "") ? "ce champ est obligatoire" : null ;
                   },
                 ),
                 TextFormField(
                   controller: firstnameController,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     icon: Icon(Icons.person),
                     hintText: "Quel est votre prénom" ,
                     labelText: "Prénom *",
                   ),
                   validator: (String? value){
                     return (value==null || value == "") ? "ce champ est obligatoire" : null ;
                   },
                 ),
                 TextFormField(
                   controller: profController,
                   keyboardType: TextInputType.text,
                   decoration: InputDecoration(
                     icon: Icon(Icons.work),
                     hintText: "Quel est votre profession" ,
                     labelText: "profession *",
                   ),
                   validator: (String? value){
                     return (value==null || value == "") ? "ce champ est obligatoire" : null ;
                   },
                 ),
                 TextFormField(
                   controller: ageController,
                   keyboardType: TextInputType.number,
                   decoration: InputDecoration(
                     icon: Icon(Icons.calendar_month),
                     hintText: "Quel est votre age" ,
                     labelText: "Age *",
                   ),
                   validator: (String? value){
                     return (value==null || value == "") ? "ce champ est obligatoire" : null ;
                   },
                 ),
               ],
                ),
          ),
          ElevatedButton(
              onPressed: ()async{
                if(formKey.currentState!.validate()){
                  final prefs =await SharedPreferences.getInstance();
                  prefs.setString("firstname", firstnameController.text);
                  prefs.setString("lastname", lastnameController.text);
                  prefs.setString("profession", profController.text);
                  prefs.setInt("age", int.parse(ageController.text));

                  Fluttertoast.showToast(
                      msg: "Les information ont été enregistrées avec succès",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM
                  );
                }
              },
              child: Text("Valider")),
          ElevatedButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => infos()),
                );
              },
              child: Text("Page suivante"))
        ],
      ),

    );
  }
}

