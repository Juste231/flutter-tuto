import 'package:pass/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class infos extends StatefulWidget {
  const infos ({super.key});

  @override
  State<infos> createState() => _infosState();
}

class _infosState extends State<infos> {

  String firstname = "";
  String lastname = "";
  String profession = "";
  int age = 0 ;

  LoadInformation() async{
    final prefs = await SharedPreferences.getInstance();
    firstname = prefs.getString("firstname") ?? "";
    lastname = prefs.getString("lastname") ?? "";
    profession = prefs.getString("profession") ?? "";
    age = prefs.getInt("age") ?? 0;
    setState(() {
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => LoadInformation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page informations"),
      ),
      body: Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: "Nom: ", style: TextStyle(fontWeight: FontWeight.bold),),
                    TextSpan(text: lastname)
                  ],

              ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: "Prenom: ", style: TextStyle(fontWeight: FontWeight.bold),),
                    TextSpan(text: firstname)
                  ],

                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: "Profession: ", style: TextStyle(fontWeight: FontWeight.bold),),
                    TextSpan(text: profession),
                  ],

                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: "Age: ", style: TextStyle(fontWeight: FontWeight.bold),),
                    TextSpan(text: "$age ans"),
                  ],

                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Retour'),
          )
        ],


              ),

            ),
          );

  }
}
