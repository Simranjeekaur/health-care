import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PatientprofileScreen extends StatefulWidget {
  @override
  _PatientprofileScreenState createState() => _PatientprofileScreenState();
}

class _PatientprofileScreenState extends State<PatientprofileScreen> {
  final User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Profile',
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 22),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(user?.uid).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('No user data found'));
          }

          final data = snapshot.data!.data() as Map<String, dynamic>;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Hero(
                      tag: 'profile-pic',
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.teal.shade100,
                        child: Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.teal.shade600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildEditableProfileCard(
                    context,
                    icon: Icons.person_outline,
                    title: 'Name',
                    value: data['name'],
                    field: 'name',
                  ),
                  _buildEditableProfileCard(
                    context,
                    icon: Icons.cake_outlined,
                    title: 'Age',
                    value: '${data['age']}',
                    field: 'age',
                  ),
                  _buildEditableProfileCard(
                    context,
                    icon: Icons.wc_outlined,
                    title: 'Gender',
                    value: data['gender'],
                    field: 'gender',
                  ),
                  _buildEditableProfileCard(
                    context,
                    icon: Icons.fitness_center_outlined,
                    title: 'Weight',
                    value: '${data['weight']} kg',
                    field: 'weight',
                  ),
                  _buildEditableProfileCard(
                    context,
                    icon: Icons.height_outlined,
                    title: 'Height',
                    value: '${data['height']} cm',
                    field: 'height',
                  ),
                  _buildEditableProfileCard(
                    context,
                    icon: Icons.local_hospital_outlined,
                    title: 'Disease',
                    value: data['disease'],
                    field: 'disease',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEditableProfileCard(BuildContext context,
      {required IconData icon, required String title, required String value, required String field}) {
    TextEditingController controller = TextEditingController(text: value);
    bool isEditing = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          margin: EdgeInsets.symmetric(vertical: 8.0),
          elevation: 4,
          child: ListTile(
            leading: Icon(
              icon,
              color: Colors.teal.shade700,
              size: 30,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.teal.shade800,
              ),
            ),
            subtitle: isEditing
                ? TextField(
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.check, color: Colors.teal),
                  onPressed: () {
                    _updateUserData(user?.uid, field, controller.text);
                    setState(() {
                      isEditing = false;
                    });
                  },
                ),
              ),
            )
                : Text(
              value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.teal.shade600,
              ),
            ),
            trailing: IconButton(
              icon: Icon(isEditing ? Icons.cancel : Icons.edit, color: Colors.teal),
              onPressed: () {
                setState(() {
                  isEditing = !isEditing;
                });
              },
            ),
          ),
        );
      },
    );
  }

  void _updateUserData(String? uid, String field, String newValue) {
    if (uid != null) {
      FirebaseFirestore.instance.collection('users').doc(uid).update({field: newValue});
    }
  }
}
