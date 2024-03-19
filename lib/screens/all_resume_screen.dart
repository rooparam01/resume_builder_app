import 'package:flutter/material.dart';

import '../database_helper/db_helper.dart';
import '../main.dart';
import '../model/resume_model.dart';
import 'add_new_resume.dart';
import 'individual_resume_reorder.dart';

class AllResumeScreen extends StatefulWidget {
  const AllResumeScreen({super.key});

  @override
  State<AllResumeScreen> createState() => _AllResumeScreenState();
}

class _AllResumeScreenState extends State<AllResumeScreen> {
   List<ResumeData> allResumes = [];
  
  Future<void> getAllResumes()async {
    final dbHelper = DatabaseHelper();
    allResumes = await dbHelper.getAllResumes();
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    getAllResumes();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Resume')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(allResumes.isEmpty)
              const Center(child: Text('Please Add Resumes First',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700
              ),
              )),
            if(allResumes.isNotEmpty)
            Container(
              margin: const EdgeInsets.all(10),
              height: mediaQuerySize.height,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),

              child: ListView.builder(
                itemCount: allResumes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(allResumes[index].name ),
                    trailing: IconButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualResumeContentReorder(resumeData: allResumes[index],)));
                    }, icon: Icon(Icons.remove_red_eye,color: Colors.grey,)),
                  );
                },
              ),
            ),
          ],

        ),
      ),
      floatingActionButton: FloatingActionButton.small(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewResumeScreen())).then((value) => {
           getAllResumes()
        });
      },
      child: Icon(Icons.add),
      ),
    );
  }
}
