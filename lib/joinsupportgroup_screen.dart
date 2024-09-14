import 'package:flutter/material.dart';

class JoinSupportGroupScreen extends StatelessWidget {
  const JoinSupportGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Join a Support Group', style: TextStyle(fontSize: 22),),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GroupItem(
              groupName: 'Diabetes Support Group',
              description:
              'Connect with others managing diabetes. Share tips, experiences, and support each other in your journey.',
              membersCount: 15,
            ),
            SizedBox(height: 20),
            GroupItem(
              groupName: 'Cancer Survivors Group',
              description:
              'Join fellow cancer survivors for emotional support, information sharing, and survivorship strategies.',
              membersCount: 20,
            ),
            SizedBox(height: 20),
            GroupItem(
              groupName: 'Heart Disease Support',
              description:
              'Connect with heart disease patients and caregivers. Discuss treatments, lifestyle changes, and more.',
              membersCount: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class GroupItem extends StatelessWidget {
  final String groupName;
  final String description;
  final int membersCount;

  const GroupItem({
    required this.groupName,
    required this.description,
    required this.membersCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement onTap functionality to join the group
        _joinSupportGroup(context, groupName);
      },
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              groupName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.group, color: Colors.teal, size: 20),
                SizedBox(width: 5),
                Text(
                  '$membersCount members',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _joinSupportGroup(BuildContext context, String groupName) {
    // Implement join support group functionality
    // Example: Navigate to a new screen or perform an action
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Join $groupName'),
          content: Text('You have joined the $groupName support group successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
