import 'package:flutter/material.dart';

import '../main.dart';
import 'all_resume_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width:mediaQuerySize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: mediaQuerySize.height*0.3,),
            Image.asset('assets/curriculum.png',
              height: mediaQuerySize.height*0.1,
            ),
            SizedBox(height: mediaQuerySize.height*0.05,),
            const Text('Welcome To Resume Builder',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700
              ),
            ),
            SizedBox(height: mediaQuerySize.height*0.3,),
            ElevatedButton.icon(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const AllResumeScreen()));
             }, icon: const Icon(Icons.not_started_sharp), label: const Text('Get Started'))

          ],
        ),
      ),
    );
  }
}
