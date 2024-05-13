import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradprojec/enterresult.dart';
import 'package:gradprojec/facuilites.dart';
import 'package:gradprojec/mainpage.dart';
import 'package:gradprojec/home.dart';
import 'package:gradprojec/universites.dart';
import 'splashscreen.dart';
import 'departments.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(337, 699),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
      
      
        home: splashScreen(),
         routes: {
       "home": (context) => home(),
       "main": (context) => mainpage(),
       "university":(context)=>university(),
       "faculty":(context)=>faculty(),
       "result":(context)=>result(),
       "department":(context)=>department(),
         },
          theme: ThemeData(
      
      
            visualDensity: VisualDensity.adaptivePlatformDensity,
          )
      ),
    );
  }
}

