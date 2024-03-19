import 'package:demo_project/screens/resume_preview_screen.dart';
import 'package:flutter/material.dart';

import '../model/resume_model.dart';

class IndividualResumeContentReorder extends StatefulWidget {
  final ResumeData resumeData;
  const IndividualResumeContentReorder({super.key,required this.resumeData});

  @override
  State<IndividualResumeContentReorder> createState() => _IndividualResumeContentReorderState();
}

class _IndividualResumeContentReorderState extends State<IndividualResumeContentReorder> {

  List<String> listItems = ['name','email','contact','experiences','projects'];

  // Future<void> addItemsToList()async {
  //   listItems.add({'name':widget.resumeData.name});
  //   listItems.add({'email':widget.resumeData.email});
  //   listItems.add({'experiences':widget.resumeData.experiences});
  //   listItems.add({'projects':widget.resumeData.projects});
  //   setState(() {
  //
  //   });
  // }

  @override
  void initState() {
    super.initState();
    //addItemsToList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Re-Order Resume Content")),
      body: Column(
        children: [
          Flexible(
            child: ReorderableListView(
              onReorder: (int oldIndex, int newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final item = listItems.removeAt(oldIndex);
                  listItems.insert(newIndex, item);
                });
              },
            children: listItems.map((item) => ListTile(
              key: ValueKey(item),
              title: Text(item),
              leading: Icon(Icons.drag_handle),
            )).toList(),),
          ),

          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResumePreview(resumeData: widget.resumeData, resumeOrder:listItems,)));
          }, child: Text('Resume Preview')),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}
