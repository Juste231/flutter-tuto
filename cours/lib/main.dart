import 'dart:ffi';

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
      home: Formulaire(),
    );
  }
}

class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {

  String? gender;
  int selectedIndex = 0;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  bool? football = false ;
  bool? music = false ;
  bool? mangas = false ;
  bool isLoading = false;
  bool displayInfo = false;
  String name = "Juste";
  displayDialog( BuildContext Context) async{
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Alert Dialog"),
            content: Text("Etes-vous sûr de vouloir soumettre le formulaire "),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, "cancel"),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, "Ok");
                  setState(() {
                    isLoading = true ;
                  });
                  Future.delayed(Duration(seconds: 5) , () {
                    setState(() {
                      isLoading = false;
                      name = nameController.text;
                      displayInfo = true ;
                    });
                  });
                },
                child: Text('OK'),
              ),
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulaire", style: TextStyle(color: Colors.white, fontSize: 20),),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(

              icon: const Icon(Icons.add_alert ),
              onPressed: (){},
          ),
          IconButton(

            icon: const Icon(Icons.search ),
            onPressed: (){},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("Messages"),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
          onTap: (int index){
          setState(() {
            selectedIndex = index;
          });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.person) ,
              label: 'Inscription'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.info) ,
                label: 'Information'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings) ,
                label: 'Paramètres'
            ),
          ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor: Colors.blue,
        child: Icon(Icons.add , color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("information de l'utilisateur" , style: TextStyle(color: Colors.blue),),
            SizedBox(height: 20,),
            Center(
              child: Image.asset("assets/images/Batmanicon.jpg", scale: 5, ),
            ),
            SizedBox(height: 30,),
            Form(
              key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: Text("Nom et prenom *"),
                        icon: Icon(Icons.person),

                      ),
                      validator: (String? value){
                        return value == null || value == "" ? "ce champs est obligatoire " : null ;
                      },
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text("Mots de passe *"),
                        icon: Icon(Icons.lock),

                      ),
                      validator: (String? value){
                        return value == null || value == "" ? "ce champs est obligatoire " : null;
                      },
                    ),
                    DropdownButtonFormField(
                      style: TextStyle(
                        color: Colors.white
                      ),
                      decoration: InputDecoration(
                        icon: Icon(Icons.transgender),
                        hintText: 'Quel est votre sexe'  ,
                        labelText: "Sexe *",
                      ),
                        value: gender,
                      items: ['Masculain','Féminin','Autre'].map((String? value){
                          return DropdownMenuItem(
                            value: value,
                              child: Text(value!, style: TextStyle(color: Colors.black),),
                          );
                        }).toList(),

                        onChanged: (String? value){
                        setState(() {
                          gender = value ;
                        });
                      },

                        validator: (str) => str== null ? "ce champ est obligatoire" : null,

                    )
                  ],
                )
            ),
            SizedBox(height: 40,),
            Align(
              alignment: Alignment.centerLeft,
            ),
            Row(
              children: [
                Checkbox(
                    value: football,
                    onChanged: (bool? value){
                      setState(() {
                        football = value;
                      });
                    }
                ),
                Text('football')
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: music,
                    onChanged: (bool? value){
                      setState(() {
                        music = value;
                      });
                    }
                ),
                Text('music'),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                    value: mangas,
                    onChanged: (bool? value){
                      setState(() {
                        mangas = value;
                      });
                    }
                ),
                Text('mangas')

              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed:()  {
                    if(formKey.currentState!.validate()) {
                      displayDialog(context);
                    }
                },

                child: Text("Valider"),
            ),
            SizedBox(height: 20,),
            isLoading ?  CircularProgressIndicator(
              color: Colors.blue,
            ):SizedBox(),
            displayInfo ? Card(
              child: Column(

                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: "Je m'appelle", style: TextStyle(color: Colors.black)),
                            TextSpan(text: name, style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.black)),

                          ]
                        ),
                    ),
                    subtitle: Text("Voici mes passions"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: (){/*.....*/},
                          child: Text("AJOUTER")
                      ),
                      SizedBox(width: 8,),
                      TextButton(
                          onPressed: (){/*.....*/},
                          child: Text("SUPPRIMER")
                      ),
                      SizedBox(width: 8,),
                    ],
                  ),
                ],
              ),
            ):SizedBox(),
          ],

        ),

      ),
    );
  }
}
