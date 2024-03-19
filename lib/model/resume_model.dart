class ResumeData {
  final String name;
  final String email;
  final String contact;
  final List<Map<String, String>> experiences;
  final List<Map<String, String>> projects;

  ResumeData({
    required this.name,
    required this.email,
    required this.contact,
    required this.experiences,
    required this.projects,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'contact': contact,
      'experiences': experiences,
      'projects': projects,
    };
  }
}
