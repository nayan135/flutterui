import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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


Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _ProfileOption('My Orders', Icons.receipt_long),
                _ProfileOption('Saved Addresses', Icons.location_on),
                _ProfileOption('Payment Methods', Icons.payment),
                _ProfileOption('Notifications', Icons.notifications),
                _ProfileOption('Settings', Icons.settings),
                _ProfileOption('Help & Support', Icons.help),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  onPressed: () {
  SystemNavigator.pop();
},
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),


        
         
        ],
      ),
    );
  }

}


 Widget _ProfileOption(String title, IconData icon) {

return Padding(
  padding: const EdgeInsets.symmetric(vertical: 12),
   child: Row(
        children: [
          Icon(icon, color: Colors.deepPurple),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        ],
   ),
  );


 }