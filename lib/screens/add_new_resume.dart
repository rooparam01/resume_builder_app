import 'package:flutter/material.dart';

import '../database_helper/db_helper.dart';
import '../model/resume_model.dart';

class AddNewResumeScreen extends StatefulWidget {
  const AddNewResumeScreen({super.key});

  @override
  State<AddNewResumeScreen> createState() => _AddNewResumeScreenState();
}

class _AddNewResumeScreenState extends State<AddNewResumeScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController linkedInController = TextEditingController();
  TextEditingController companynameController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  List<Map<String,String>> experiences = [];
  List<Map<String,String>> projects = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text('Add New Resume')),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text('Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                  ),

                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Please Enter Name',
                  ),

                ),
                SizedBox(height: 10,),
                const Text('Email',
                    style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12
                ),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Please Enter Email',
                  ),
                  validator: (value) {
                    if(!value!.contains('@')){
                      return 'Invalid Email';
                    }
                  },
                ),
                const SizedBox(height: 10,),
                const Text('Contact No',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12
                  ),
                ),
                TextFormField(
                  controller: contactController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Please Enter Your Contact Number',
                  ),
                ),
                const SizedBox(height: 10,),
                const Text('LinkedIn Profile',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12
                  ),
                ),
                TextFormField(
                  controller: linkedInController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Paste Your linkedIn profile Link',
                  ),
                ),

                //Experience
                const SizedBox(height: 10,),
                Divider(),
                const Text('Experience',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12
                  ),
                ),

                if(experiences.isNotEmpty)
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 100,decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),

                    child: ListView.builder(
                      itemCount: experiences.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(experiences[index]['company']! ),
                          trailing: IconButton(onPressed: (){
                            setState(() {
                              experiences.removeAt(index);
                            });
                          }, icon: Icon(Icons.delete_outline,color: Colors.red,)),
                        );
                      },
                    ),
                  ),
                if(experiences.isEmpty)
                  const Text('No Experience'),
                IconButton(onPressed: (){
                     showDialog(context: context, builder: (context){
                       return StatefulBuilder(builder: (builderContext,setState){
                              return AlertDialog(
                                title: Text('Experience'),
                                content: Column(
                                  children: [
                                    TextFormField(
                                      controller: companynameController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Please Enter Company Name',
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    TextFormField(
                                      controller: experienceController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Please Enter Experience in Year',
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                    ElevatedButton(onPressed: (){
                                      if(companynameController.text.isEmpty||companynameController.text.isEmpty){

                                      }else{
                                        experiences.add(
                                            {
                                              'company':companynameController.text,
                                              'experience':experienceController.text
                                            }
                                        );
                                        Navigator.pop(builderContext);
                                      }
                                    }, child: Text('Submit'))
                                  ],
                                ),
                              );
                       });
                     }).then((value) => {
                     setState((){

                     })
                     });
                }, icon: Icon(Icons.add),),
                Divider(),

                //Projects

                Divider(),
                const Text('Projects',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12
                  ),
                ),

                if(projects.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: 100,decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),

                    child: ListView.builder(
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(projects[index]['title']! ),
                          trailing: IconButton(onPressed: (){
                            setState(() {
                              projects.removeAt(index);
                            });
                          }, icon: Icon(Icons.delete_outline,color: Colors.red,)),
                        );
                      },
                    ),
                  ),
                if(projects.isEmpty)
                  const Text('No Projects'),
                IconButton(onPressed: (){
                  showDialog(context: context, builder: (context){
                    return StatefulBuilder(builder: (builderContext,setState){
                      return AlertDialog(
                        title: Text('Experience'),
                        content: Column(
                          children: [
                            TextFormField(
                              controller: companynameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Please Enter Company Name',
                              ),
                            ),
                            const SizedBox(height: 10,),
                            TextFormField(
                              controller: experienceController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Please Enter Experience in Year',
                              ),
                            ),
                            const SizedBox(height: 10,),
                            ElevatedButton(onPressed: (){
                              if(companynameController.text.isEmpty||experienceController.text.isEmpty){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Please fill all required fields."),
                                    duration: Duration(seconds: 3),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }else{
                                projects.add(
                                    {
                                      'title':companynameController.text,
                                      'description':experienceController.text
                                    }
                                );
                                Navigator.pop(builderContext);
                              }
                            }, child: Text('Submit'))
                          ],
                        ),
                      );
                    });
                  }).then((value) => {
                    setState((){

                    })
                  });
                }, icon: Icon(Icons.add),),
                Divider(),

                ElevatedButton(onPressed: () async {
                  if (_formKey.currentState!.validate()&&(nameController.text.isNotEmpty&&emailController.text.isNotEmpty&&contactController.text.isNotEmpty)) {
                    final resumeData = ResumeData(
                        name:nameController.text,
                        email:emailController.text,
                        contact:contactController.text,
                        experiences:experiences,
                        projects:projects

                    );
                    final dbHelper = DatabaseHelper();
                    await dbHelper.initDatabase();
                    await dbHelper.insertResumeData(resumeData);
                    Navigator.pop(context);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please fill all required fields."),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }, child: Text("Submit"))

              ],
            ),
          ),
        ),
      ),
    );
  }
}
