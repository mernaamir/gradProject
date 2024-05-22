import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gradprojec/departments.dart';

class Faculty extends StatefulWidget {
  static const String routeName = "faculty";

  const Faculty({super.key});

  @override
  State<Faculty> createState() => _FacultyState();
}

class _FacultyState extends State<Faculty> {
  List<QueryDocumentSnapshot> facdata = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("Faculities").get();
      facdata = querySnapshot.docs;
      setState(() => isLoading = false);
    } catch (e) {
      setState(() => hasError = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/images/university.png",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    bottom: 150,
                    right: 20,
                    child: Text(
                      "قائمة الكليات",
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    top: 30,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Icon(Icons.arrow_back)
                ],
              ),
            ],
          ),
          Positioned.fill(
            child: Container(
              height: 650,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
              ),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : hasError
                      ? const Center(child: Text("Something went wrong"))
                      : facdata.isEmpty
                          ? const Text("List is empty")
                          : getList(),
            ),
          )
        ],
      ),
    );
  }

  Widget getList() {
    ListView myList = ListView.builder(
      itemCount: facdata.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                department.routeName,
                arguments: {
                  'name': facdata[index]['name'],
                  'grade': facdata[index]['grade'],
                  'description': facdata[index]['description'],
                },
              );
              // Navigator.pushNamed(context, department.routeName);
            },
            child: Container(
              width: 265,
              height: 95,
              decoration: BoxDecoration(
                color: const Color(0xff36265D),
                borderRadius: BorderRadius.circular(23),
              ),
              child: Center(
                child: Text(
                  "${facdata[index]['name']}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
    return myList;
  }
}
