import 'package:flutter/material.dart';

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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: Firstpage(),
    );
  }
}

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {


  String text = "";
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final proController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Premier formulaire"),
      ),
      body: Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Form(
            key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Entrez votre nom",
                      label: Text("Nom *"),
                      icon: Icon(Icons.person)
                    ),
                    validator: (value) {
                      if(value == null || value == "") {
                        return "ce champ est obligatoire";
                      }
                      return null ;
                    },
                  ),
                  TextFormField(
                    controller: proController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Entrez votre nom",
                        label: Text("Profession *"),
                        icon: Icon(Icons.business_center)
                    ),
                    validator: (value) {
                      if(value == null || value == "") {
                        return "ce champ est obligatoire";
                      }
                      return null ;
                    },
                  ),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Entrez votre nom",
                        label: Text("Age *"),
                        icon: Icon(Icons.abc)
                    ),
                    validator: (value) {
                      if(value == null || value == "") {
                        return "ce champ est obligatoire";
                      }
                      return null ;
                    },
                  )
                  
                ],
              )
          ),
          ElevatedButton(
              onPressed: (){
                if(formkey.currentState!.validate()) {
                  setState(() {
                    text =
                        " je m'appele " + nameController.text + "" + " j'ai " +
                            ageController.text + " dans la vie je suis " +
                            proController.text;
                  });
                }
          }, 
              child: Text("valider")
          ),
          Text(text)
        ],
        
      ),
    );
  }
}
