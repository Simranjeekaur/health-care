import 'package:flutter/material.dart';
import 'package:healthcare/exercisetips_screen.dart';
import 'package:healthcare/healthyeating_screen.dart';
import 'package:healthcare/medicationmanagement_screen.dart';
import 'package:healthcare/mentalwellness_screen.dart';

class EducationalResourcesScreen extends StatelessWidget {
  const EducationalResourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Resources', style: TextStyle(fontSize: 22),),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Educational Resources',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),
            ResourceItem(
              title: 'Healthy Eating',
              description: 'Learn about balanced diets and nutritious recipes for better health.',
              imageUrl: 'assets/images/healthy_eating.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HealthyEatingScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ResourceItem(
              title: 'Exercise Tips',
              description: 'Discover exercise routines and tips for staying active and fit.',
              imageUrl: 'assets/images/exercise_tips.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExerciseTipsScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ResourceItem(
              title: 'Mental Wellness',
              description: 'Explore techniques for maintaining mental health and well-being.',
              imageUrl: 'assets/images/mental_wellness.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MentalWellnessScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            ResourceItem(
              title: 'Medication Management',
              description: 'Get advice on managing medications and adhering to treatment plans.',
              imageUrl: 'assets/images/medication_management.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicationManagementScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ResourceItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final VoidCallback? onTap;

  const ResourceItem({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
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
