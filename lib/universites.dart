import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'facuilites.dart';

class university extends StatefulWidget {
  static const String routeName = "university";

  const university({super.key});

  @override
  State<university> createState() => _universityState();
}

class _universityState extends State<university> {
  List<QueryDocumentSnapshot> data = [];


  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection("Unversities").get();
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
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 30,
                              color: Colors.white,
                            ))),
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
                child: Expanded(
                    child: FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Something went errorrrrrrrrr"),
                      );
                    }
                    if (data.isEmpty) {
                      return Text("List is empty");
                    }
                    return getList();
                  },
                  future: getData(),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getList() {
    ListView myList = new ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
              height: 1,
            ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, faculty.routeName);

              },
              child: Container(
                width: 265.w,
                height: 95.h,
                decoration: BoxDecoration(
                  color: Color(0xff36265D),
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Center(
                  child: Text(
                    "${data[index]['name']}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
          );
        });
    return myList;
  }
}
