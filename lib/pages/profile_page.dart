import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.deepPurple[200],
        backgroundImage: NetworkImage(
              'https://cdn.hackclub.com/019e4412-1ddd-72fe-b0ac-25149cf09fd2/nayan-acharya.jpg',)
          ),
          const SizedBox(height: 16),
          const Text(
            'NAAAAAAA',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            'ndfjfkjls',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 30),
         
        ],
      ),
    );
  }

}