import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/communitysupport_screen.dart';
import 'package:healthcare/dailyhealthtips_screen.dart';
import 'package:healthcare/patientprofile_screen.dart';
import 'package:healthcare/userform_screen.dart'; // Ensure this import path is correct

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required String userId});

  @override
  Widget build(BuildContext context) {
    // Retrieve the current user
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user?.uid ?? ''; // Get the user ID

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            // Health Care App Title
            Center(
              child: Text(
                'Health Care App',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Patient Profile Card
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
                ),
                title: const Text(
                  'Patient Profile',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('View and edit your profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  PatientprofileScreen(),
                    ),
                  );
                },
              ),
            ),
            // Daily Health Tips Card
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: const Icon(Icons.lightbulb_outline, size: 30, color: Colors.green),
                title: const Text(
                  'Daily Health Tips',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Remember to drink a glass of water today!'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DailyHealthTipsScreen(),
                    ),
                  );
                },
              ),
            ),
            // Community and Support Card
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: const Icon(Icons.group, size: 30, color: Colors.purple),
                title: const Text(
                  'Community and Support',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Join a support group or access educational resources'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommunitySupportScreen(),
                    ),
                  );
                },
              ),
            ),
            // Treatment Plans Card
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                leading: const Icon(Icons.assignment, size: 30, color: Colors.orange),
                title: const Text(
                  'Treatment Plans',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('View ongoing treatment plans and personalized exercise programs'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserFormScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
