import 'package:flutter/material.dart';

import '../main.dart';
import '../model/resume_model.dart';

class ResumePreview extends StatefulWidget {
  final List<String> resumeOrder;
  final ResumeData resumeData;
  const ResumePreview({super.key,required this.resumeData,required this.resumeOrder});

  @override
  State<ResumePreview> createState() => _ResumePreviewState();
}

class _ResumePreviewState extends State<ResumePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resume Preview'),),
      body: SingleChildScrollView(
        child: Container(
          width: mediaQuerySize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if(widget.resumeOrder[0]=='name')
                nameCreate(widget.resumeData.name),
              if(widget.resumeOrder[0]=='email')
                emailCreate(widget.resumeData.name),
              if(widget.resumeOrder[0]=='contact')
                contactCreate(widget.resumeData.name),
              if(widget.resumeOrder[0]=='projects')
                projectCreate(widget.resumeData.projects),
              if(widget.resumeOrder[0]=='experiences')
                experienceCreate(widget.resumeData.experiences),
              //1
              if(widget.resumeOrder[1]=='name')
                nameCreate(widget.resumeData.name),
              if(widget.resumeOrder[1]=='email')
                emailCreate(widget.resumeData.name),
              if(widget.resumeOrder[1]=='contact')
                contactCreate(widget.resumeData.name),
              if(widget.resumeOrder[1]=='projects')
                projectCreate(widget.resumeData.projects),
              if(widget.resumeOrder[1]=='experiences')
                experienceCreate(widget.resumeData.experiences),
              //2
              if(widget.resumeOrder[2]=='name')
                nameCreate(widget.resumeData.name),
              if(widget.resumeOrder[2]=='email')
                emailCreate(widget.resumeData.name),
              if(widget.resumeOrder[2]=='contact')
                contactCreate(widget.resumeData.name),
              if(widget.resumeOrder[2]=='projects')
                projectCreate(widget.resumeData.projects),
              if(widget.resumeOrder[2]=='experiences')
                experienceCreate(widget.resumeData.experiences),
              //3
              if(widget.resumeOrder[3]=='name')
                nameCreate(widget.resumeData.name),
              if(widget.resumeOrder[3]=='email')
                emailCreate(widget.resumeData.name),
              if(widget.resumeOrder[3]=='contact')
                contactCreate(widget.resumeData.name),
              if(widget.resumeOrder[3]=='projects')
                projectCreate(widget.resumeData.projects),
              if(widget.resumeOrder[3]=='experiences')
                experienceCreate(widget.resumeData.experiences),
              //4
              if(widget.resumeOrder[4]=='name')
                nameCreate(widget.resumeData.name),
              if(widget.resumeOrder[4]=='email')
                emailCreate(widget.resumeData.name),
              if(widget.resumeOrder[4]=='contact')
                contactCreate(widget.resumeData.name),
              if(widget.resumeOrder[4]=='projects')
                projectCreate(widget.resumeData.projects),
              if(widget.resumeOrder[4]=='experiences')
                experienceCreate(widget.resumeData.experiences),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameCreate(String name){
    return Column(
      children: [
        const Text('Name',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700
        ),
        ),
        Text(name,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
  Widget emailCreate(String email){
    return Column(
      children: [
        const Text('Email',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700
          ),
        ),
        Text(email,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500
          ),),
      ],
    );
  }
  Widget contactCreate(String contact){
    return Column(
      children: [
        const Text('Contact',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700
          ),
        ),
        Text(contact,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500
          ),),
      ],
    );
  }

  Widget projectCreate(List<Map<String, String>> projects){
    return Column(
      children: [
        const Text('Projects',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700
          ),
        ),
        if(projects.isNotEmpty)
          Container(
            margin: EdgeInsets.all(10),
            height: mediaQuerySize.height*projects.length*0.06,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),

            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(projects[index]['title']??'' ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget experienceCreate(List<Map<String, String>> experiences){
    return Column(
      children: [
        const Text('Experience',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700
          ),
        ),
        if(experiences.isNotEmpty)
          Container(
            margin: EdgeInsets.all(10),
            height: mediaQuerySize.height*experiences.length*0.06,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),

            child: ListView.builder(
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(experiences[index]['company']??'' ),
                );
              },
            ),
          ),
      ],
    );
  }
}
