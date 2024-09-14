import 'package:flutter/material.dart';

class ExerciseTipsScreen extends StatelessWidget {
  const ExerciseTipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise Tips', style: TextStyle(fontSize: 22),),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Exercise Tips',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Regular physical activity is one of the most important things you can do for your health. Here are some tips to help you stay active and fit:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            buildExerciseTip(
              title: 'Start Slow',
              description: 'Begin with low-impact exercises and gradually increase the intensity.',
              icon: Icons.directions_run,
            ),
            SizedBox(height: 20),
            buildExerciseTip(
              title: 'Stay Consistent',
              description: 'Aim to exercise at least 30 minutes a day, most days of the week.',
              icon: Icons.timer,
            ),
            SizedBox(height: 20),
            buildExerciseTip(
              title: 'Mix It Up',
              description: 'Incorporate different types of exercises, including cardio, strength training, and flexibility exercises.',
              icon: Icons.fitness_center,
            ),
            SizedBox(height: 20),
            buildExerciseTip(
              title: 'Stay Hydrated',
              description: 'Drink plenty of water before, during, and after your workouts.',
              icon: Icons.local_drink,
            ),
            SizedBox(height: 20),
            buildExerciseTip(
              title: 'Listen to Your Body',
              description: 'Pay attention to how your body feels and rest when necessary to avoid injury.',
              icon: Icons.healing,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildExerciseTip({required String title, required String description, required IconData icon}) {
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
