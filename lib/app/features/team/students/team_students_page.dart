import 'package:flutter/material.dart';

import '../../student/list/student_list.dart';

class TeamStudentsPage extends StatelessWidget {
  const TeamStudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: Column(
        children: [
          Wrap(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Add')),
              ElevatedButton(onPressed: () {}, child: const Text('Create')),
              ElevatedButton(onPressed: () {}, child: const Text('View Calcs')),
            ],
          ),
          const StudentList()
        ],
      ),
    );
  }
}
