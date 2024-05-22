import 'package:flutter/material.dart';

class department extends StatefulWidget {
  static const String routeName = "department";

  const department({super.key});

  @override
  State<department> createState() => _departmentState();
}

class _departmentState extends State<department> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "قائمة الاقسام",
          style: TextStyle(
            fontSize: 28,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(
                "assets/images/university.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Container(
                  height: 300,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'الأسم: ${args['name']}',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Grade: ${args['grade']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Description: ${args['description']}',
                          style: const TextStyle(fontSize: 16),
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
    );
  }
}












// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class department extends StatefulWidget {
//   static const String routeName = "department";
//
//
//   const department({super.key,});
//
//   @override
//   State<department> createState() => _universityState();
// }
//
// class _universityState extends State<department> {
//   List<QueryDocumentSnapshot> facdata = [];
//
//
//   void initState() {
//     super.initState();
//     // getData();
//   }
//   // getData() async {
//   //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("[Faculities]").get();
//   //   facdata.addAll(querySnapshot.docs);
//   // }
//
//   @override
//
//   Widget build(BuildContext context) {
//     final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//
//     // TODO: implement build
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     Image.asset(
//                       "assets/images/university.png",
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                     Positioned(
//                       bottom: 150,
//                       right: 20,
//                       child: Text(
//                         "قائمة الاقسام",
//                         style: TextStyle(fontSize: 28, color: Colors.white),
//                       ),
//                     ),
//                     Positioned(
//                         left: 10,
//                         top: 30,
//                         child: InkWell(
//                             onTap: () {
//                               Navigator.pop(context);
//                             },
//                             child: Icon(
//                               Icons.arrow_back,
//                               size: 30,
//                               color: Colors.white,
//                             ))),
//
//
// Text(
//               'name: ${args['name']}',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'grade: ${args['grade']}',
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'description: ${args['description']}',
//               style: TextStyle(fontSize: 16),
//             ),
//
//                   ],
//                 ),
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
//
// }
// // Positioned(
// // bottom: 0,
// // left: 0,
// // right: 0,
// // child: Container(
// // decoration: BoxDecoration(
// // borderRadius: BorderRadius.circular(50),
// // color: Colors.white,
// // ),
// // height: 650,
// // child: Container(
// // child: Expanded(
// // child: FutureBuilder(
// // builder: (context, snapshot) {
// // if (snapshot.connectionState == ConnectionState.waiting) {
// // return const Center(
// // child: CircularProgressIndicator(),
// // );
// // }
// //
// // if (snapshot.hasError) {
// // return const Center(
// // child: Text("Something went errorrrrrrrrr"),
// // );
// // }
// // if (facdata.isEmpty) {
// // return Center(child: Text("List is empty",style: TextStyle(fontSize: 50),));
// // }
// // return getList();
// // },
// // future: getData(),
// // )),
// // ),
// // ),
// // )
//
// // Widget getList() {
// //   ListView myList = new ListView.separated(
// //       separatorBuilder: (context, index) => SizedBox(
// //         height: 1,
// //       ),
// //       itemCount: facdata.length,
// //       itemBuilder: (context, index) {
// //         return Padding(
// //           padding: const EdgeInsets.all(20.0),
// //           child: InkWell(
// //             onTap: (){
// //               // Navigator.pushNamed(context, faculty.routeName);
// //
// //             },
// //             child: Container(
// //               width: 265.w,
// //               height: 95.h,
// //               decoration: BoxDecoration(
// //                 color: Color(0xff36265D),
// //                 borderRadius: BorderRadius.circular(23),
// //               ),
// //               child: Center(
// //                 child: Text(
// //                   "${facdata[index]['name']}",
// //                   style: TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.w700),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       });
// //   return myList;
// // }