import 'package:flutter/material.dart';

class AiPage extends StatelessWidget {
  const AiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.all(16),


       child: SingleChildScrollView(
         child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'ASKK.....',
                prefixIcon: const Icon(Icons.question_mark),
                filled: true,
                fillColor: const Color.fromARGB(255, 231, 224, 224),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
          ]
         )
       )

    );  

   
    }
}
