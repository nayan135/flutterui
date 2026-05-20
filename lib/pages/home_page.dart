import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      print(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color.fromARGB(255, 231, 224, 224),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              ),
            ),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                "https://hatrabbits.com/wp-content/uploads/2017/01/random.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                categoryItem(Icons.checkroom, "Fashion"),
                categoryItem(Icons.devices, "Electronics"),
                categoryItem(Icons.chair, "Home"),
                categoryItem(Icons.brush, "Beauty"),
              ], 
            ), 
            SizedBox(height: 20),

            /*
  SizedBox(
    width: double.infinity,
    height: 380,
    child: Card(
      margin: const EdgeInsets.all(13),
      color: Colors.deepPurple,
      elevation: 5,
      shadowColor: Colors.amberAccent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              "https://cdn.pixabay.com/photo/2013/07/25/13/01/stones-167089_1280.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'NNNN nNnnn',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Checkinggg if thisss is displayeedd or noott',
                  style: TextStyle(color: Colors.grey[400]),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                     print('Button is preddddd'); 
                     _incrementCounter();
                  },
                  child: const Text(
                    'Add to cart',
                    style: TextStyle(color: Colors.amberAccent),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
*/
           
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.55,
              ),
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(13),
                  color: Colors.deepPurple,
                  elevation: 5,
                  shadowColor: Colors.amberAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // expanded for overflow issue
                      Expanded(
                        child: Image.network(
                          "https://cdn.pixabay.com/photo/2013/07/25/13/01/stones-167089_1280.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NNNN nNnnn',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Checkinggg if thisss is displayeedd or noott',
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                print('Button is preddddd');
                                _incrementCounter();
                              },
                              child: const Text(
                                'Add to cart',
                                style: TextStyle(color: Colors.amberAccent),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}



     /*       child: Center(
              child: Column(
            children: [
            
    /*  CircleAvatar(
                 radius: 28,
               backgroundColor: Colors.grey.shade200,
               child: Icon(
          Icons.abc_outlined,
          color: Colors.black,
        ),
      ),

      const SizedBox(height: 5),

      Text(
        "Hellooo",
        style: const TextStyle(fontSize: 12),
      ),
      CircleAvatar(
                 radius: 28,
               backgroundColor: Colors.grey.shade200,
               child: Icon(
          icon,
          color: Colors.black,
        ),
      ),

      const SizedBox(height: 5),

      Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
      */        
    ],
  )
              
              ),
),
        ]
          ),
            */

            
Widget categoryItem(IconData icon, String text) {
  return Column(
    children: [
      CircleAvatar(
        radius: 28,
        backgroundColor: const Color.fromARGB(255, 145, 134, 134),
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
    ],
  );
}
