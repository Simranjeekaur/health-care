import 'package:flutter/material.dart';

class DailyHealthTipsScreen extends StatelessWidget {
  const DailyHealthTipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Health Tips',style: TextStyle(fontSize: 22),),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HealthTipItem(
              title: 'Stay Hydrated',
              description: 'Drink plenty of water throughout the day to stay hydrated and maintain bodily functions.',
              icon: Icons.local_drink,
            ),
            SizedBox(height: 20),
            HealthTipItem(
              title: 'Eat Balanced Meals',
              description: 'Ensure your meals include a variety of nutrients for overall health and energy.',
              icon: Icons.restaurant,
            ),
            SizedBox(height: 20),
            HealthTipItem(
              title: 'Get Enough Sleep',
              description: 'Aim for 7-9 hours of sleep each night to support mental and physical well-being.',
              icon: Icons.night_shelter,
            ),
            SizedBox(height: 20),
            HealthTipItem(
              title: 'Stay Active',
              description: 'Engage in regular physical activity to strengthen muscles and improve cardiovascular health.',
              icon: Icons.directions_run,
            ),
          ],
        ),
      ),
    );
  }
}

class HealthTipItem extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const HealthTipItem({
    required this.title,
    required this.description,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement onTap functionality if needed
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.teal, size: 36),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
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
