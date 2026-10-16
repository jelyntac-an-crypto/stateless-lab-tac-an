
import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

// This model is stateless because it stores fixed student data only.
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

// These sample students are fixed data and do not change while the app runs.
const List<Student> students = [
  Student(
    name: 'Jeon Jungkook',
    course: 'BS Information Technology',
    yearLevel: 2,
    email: 'jungkook@example.com',
  ),
  Student(
    name: 'Kim Seokjin',
    course: 'BS Information Technology',
    yearLevel: 1,
    email: 'jin@example.com',
  ),
  Student(
    name: 'Park Jimin',
    course: 'BS Computer Science',
    yearLevel: 3,
    email: 'jimin@example.com',
  ),
  Student(
    name: 'Jung Hoseok',
    course: 'BS Information Technology',
    yearLevel: 2,
    email: 'jhope@example.com',
  ),
  Student(
    name: 'Kim Taehyung',
    course: 'BS Information Systems',
    yearLevel: 4,
    email: 'taehyung@example.com',
  ),
];


 // This widget is stateless because its icon and text are provided by its parent.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.blueGrey,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 13),
          ),
        ),
      ],
    );
  }
}


 // This widget is stateless because it displays student data received from its parent.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({
    super.key,
    required this.student,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Customization 1: Rounded corners give each student card a softer design.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Customization 2: A colored avatar makes each student easier to identify.
            CircleAvatar(
              radius: 26,
              backgroundColor: Colors.teal.shade100,
              child: Text(
                student.name[0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Customization 3: Bold, larger text emphasizes the student's name.
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    student.course,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  InfoRow(
                    icon: Icons.school,
                    text: 'Year Level ${student.yearLevel}',
                  ),
                  const SizedBox(height: 6),
                  InfoRow(
                    icon: Icons.email,
                    text: student.email,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


 // This widget is stateless because its title is provided by its parent and does not change by itself.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 6),
          const Divider(
            thickness: 1.5,
            color: Colors.teal,
          ),
        ],
      ),
    );
  }
}


 // This screen is stateless because it displays a fixed list of students without changing their data.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Directory'),
        centerTitle: true,
        // Customization 4: A teal app bar matches the student card design.
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const SectionHeader(title: 'Students'),
          ...students.map(
            (student) => StudentCard(student: student),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}


 // This widget is stateless because it configures the app theme and home screen without managing changing data.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Student Directory',
      debugShowCheckedModeBanner: false,
      // Customization 5: Teal is the seed color for the app's Material 3 theme.
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        useMaterial3: true,
      ),
      home: const DirectoryScreen(),
    );
  }
}

