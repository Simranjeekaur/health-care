import 'package:flutter/material.dart';

class MentalWellnessScreen extends StatelessWidget {
  const MentalWellnessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mental Wellness', style: TextStyle(fontSize: 22),),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mental Wellness',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Maintaining mental wellness is crucial for overall health. Here are some tips and techniques to help you stay mentally healthy:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            buildMentalWellnessTip(
              title: 'Practice Mindfulness',
              description: 'Engage in mindfulness activities like meditation to reduce stress and improve focus.',
              icon: Icons.self_improvement,
            ),
            SizedBox(height: 20),
            buildMentalWellnessTip(
              title: 'Stay Connected',
              description: 'Keep in touch with family and friends to build a support network.',
              icon: Icons.people,
            ),
            SizedBox(height: 20),
            buildMentalWellnessTip(
              title: 'Exercise Regularly',
              description: 'Physical activity can help reduce symptoms of anxiety and depression.',
              icon: Icons.fitness_center,
            ),
            SizedBox(height: 20),
            buildMentalWellnessTip(
              title: 'Get Enough Sleep',
              description: 'Aim for 7-9 hours of sleep per night to support mental health.',
              icon: Icons.bedtime,
            ),
            SizedBox(height: 20),
            buildMentalWellnessTip(
              title: 'Seek Professional Help',
              description: 'Don’t hesitate to reach out to a mental health professional if you need support.',
              icon: Icons.health_and_safety,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMentalWellnessTip({required String title, required String description, required IconData icon}) {
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
