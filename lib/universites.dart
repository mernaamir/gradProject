import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'facuilites.dart';

class university extends StatefulWidget {
  static const String routeName = "university";

  university({super.key});

  @override
  State<university> createState() => _universityState();
}

class _universityState extends State<university> {
List<QueryDocumentSnapshot> data=[];
  getData() async {
    QuerySnapshot querySnapshot= await FirebaseFirestore.instance.collection("Unversities").get();
data.addAll(querySnapshot.docs);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/university.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 150,
                      right: 20,
                      child: Text(
                        "قائمة الجامعات",
                        style: TextStyle(fontSize: 28, color: Colors.white),
                      ),
                    ),
                    Positioned(
                   left: 10,
                      top: 30,
                      child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back,size: 30,color: Colors.white,))
                    ),
                    // Icon(Icons.arrow_back)

                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              height: 650,
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, faculty.routeName);
                          },
                          child: Text(
                            "جامعة القاهرة",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(

                          minimumSize: Size(300, 60),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),

              ),
            ),
          )
        ],
      ),
    );
  }
}
