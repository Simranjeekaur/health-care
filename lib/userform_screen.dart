import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:healthcare/treatment_screen.dart';

class UserFormScreen extends StatefulWidget {
  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  int age = 0;
  String gender = '';
  double weight = 0.0;
  double height = 0.0;
  String disease = '';

  final List<String> diseases = ['Diabetes', 'Hypertension', 'Asthma', 'Weight Loss', 'Cancer', 'Heart Disease', 'Hepatitis'];
  bool isLoading = false;

  Future<void> saveUserData() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    User? user = auth.currentUser;

    if (user != null) {
      await firestore.collection('users').doc(user.uid).set({
        'name': name,
        'age': age,
        'gender': gender,
        'weight': weight,
        'height': height,
        'disease': disease,
      });
    } else {
      // Handle the case where the user is not logged in
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('User data saved successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information', style: TextStyle(fontSize: 22),),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => name = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an age';
                  }
                  return null;
                },
                onSaved: (value) => age = int.parse(value!),
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Gender'),
                onTap: () async {
                  String? selectedGender = await showDialog<String>(
                    context: context,
                    builder: (context) => SimpleDialog(
                      title: Text('Select Gender'),
                      children: ['Male', 'Female'].map((gender) {
                        return SimpleDialogOption(
                          onPressed: () => Navigator.pop(context, gender),
                          child: Text(gender),
                        );
                      }).toList(),
                    ),
                  );
                  if (selectedGender != null) {
                    setState(() {
                      gender = selectedGender;
                    });
                  }
                },
                controller: TextEditingController(text: gender),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a gender';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a weight';
                  }
                  return null;
                },
                onSaved: (value) => weight = double.parse(value!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Height (cm)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a height';
                  }
                  return null;
                },
                onSaved: (value) => height = double.parse(value!),
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(labelText: 'Disease'),
                onTap: () async {
                  String? selectedDisease = await showDialog<String>(
                    context: context,
                    builder: (context) => SimpleDialog(
                      title: Text('Select Disease'),
                      children: diseases.map((disease) {
                        return SimpleDialogOption(
                          onPressed: () => Navigator.pop(context, disease),
                          child: Text(disease),
                        );
                      }).toList(),
                    ),
                  );
                  if (selectedDisease != null) {
                    setState(() {
                      disease = selectedDisease;
                    });
                  }
                },
                controller: TextEditingController(text: disease),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a disease';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      await saveUserData();
                      setState(() {
                        isLoading = false;
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TreatmentPlanScreen(disease: disease),
                        ),
                      );
                    } catch (e) {
                      print('Error processing form data: $e');
                      setState(() {
                        isLoading = false;
                      });
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error'),
                          content: Text('Failed to process form data. Please try again.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                child: Text('Submit', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              ),
              if (isLoading)
                Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}
