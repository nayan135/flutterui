import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Your Orders',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

   ListView.builder(
     shrinkWrap: true,
     scrollDirection: Axis.vertical, 
    itemCount: 3,
    itemBuilder: (context,index){
      return Card(
        margin: const EdgeInsets.only(bottom: 12),
         child: ListTile(
           leading: Container(
                  width: 50,
                 height: 50,
                 child: const Icon(Icons.shopping_bag, color: Colors.blueAccent),

                    ),
                    title: const Text('nnnn'),
                    subtitle: const Text('data'),
                    trailing: const Text('naaa'),
                  )
                     
      );
    }
   ),

          ],
        ),
      ),
    );
  }
}
