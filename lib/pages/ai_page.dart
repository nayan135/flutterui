import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AiPage extends StatefulWidget {
  const AiPage({super.key});

  @override
  State<AiPage> createState() => _AiPageState();
}

class _AiPageState extends State<AiPage> {
  String responseText = '';
  bool isLoading = false;
  final TextEditingController _controller = TextEditingController();

  void makeRequest() async {
    if (_controller.text.trim().isEmpty) return;

    setState(() { 
      isLoading = true;
    });

    final url = Uri.parse('https://ai.hackclub.com/proxy/v1/chat/completions');
    final headers = { 
      'Authorization': 'Bearer tkn',
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      'model': 'nvidia/nemotron-3-nano-omni-30b-a3b-reasoning:free',
      'messages': [ 
        {'role': 'user', 'content': _controller.text}               
      ],
    }); 

    try {
      final response = await http.post( 
        url,
        headers: headers,
        body: body,
      );
      final data = jsonDecode(response.body);
      print(data);

      setState(() {
        responseText = data['choices'][0]['message']['content'];
      });
    } catch (e) {
      setState(() {
        responseText = 'Error: $e';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _controller,
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
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: isLoading ? null : makeRequest,
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : const Text('Submit'),
            ),
            const SizedBox(height: 20),
            Text(
              responseText,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

}
