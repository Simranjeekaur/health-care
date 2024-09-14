import 'package:flutter/material.dart';

class MedicationManagementScreen extends StatelessWidget {
  const MedicationManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication Management', style: TextStyle(fontSize: 22),),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Medication Management',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Proper medication management is essential for maintaining health. Here are some tips to help you manage your medications effectively:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            buildMedicationTip(
              title: 'Follow Prescriptions',
              description: 'Take medications exactly as prescribed by your healthcare provider.',
              icon: Icons.assignment_turned_in,
            ),
            SizedBox(height: 20),
            buildMedicationTip(
              title: 'Use a Pill Organizer',
              description: 'Keep track of your medications with a pill organizer to avoid missed doses.',
              icon: Icons.view_list,
            ),
            SizedBox(height: 20),
            buildMedicationTip(
              title: 'Set Reminders',
              description: 'Use alarms or apps to remind you when it’s time to take your medications.',
              icon: Icons.alarm,
            ),
            SizedBox(height: 20),
            buildMedicationTip(
              title: 'Monitor Side Effects',
              description: 'Be aware of possible side effects and report any concerns to your healthcare provider.',
              icon: Icons.report_problem,
            ),
            SizedBox(height: 20),
            buildMedicationTip(
              title: 'Keep a Medication List',
              description: 'Maintain an up-to-date list of all your medications, including dosages and schedules.',
              icon: Icons.list,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMedicationTip({required String title, required String description, required IconData icon}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.teal, size: 30),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
