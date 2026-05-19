import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterUI',
      theme: ThemeData(
       
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 64, 37, 111)),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

 
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
     
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
  appBar: AppBar(
    
        backgroundColor: Colors.white,
  
        title: Row(
          children: const [
            Icon(
              Icons.shopping_bag,
              color: Colors.blue,
            ),
            SizedBox(width: 5),
            Text(
              "ShopHub",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
             
            
          ],
      ),
       actions: const [
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Icon(
        Icons.notifications_none,
        color: Colors.black,
      ),
    ),

    Padding(
      padding: EdgeInsets.only(right: 12),
      child: Icon(
        Icons.shopping_cart_outlined,
        color: Colors.black,
      ),
    ),
  ],

),
   body:Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16), 
   child: Column(
    children: [
    
        ClipRRect(
          
  borderRadius: BorderRadius.circular(16),
  child: Container(
    color: Colors.blueGrey,
    alignment: Alignment.centerLeft, 
    padding: EdgeInsets.symmetric(horizontal:7, vertical: 4),
    child: const Icon(
      Icons.search,
      color: Colors.white,
      size: 20.0,
    ),
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
    SizedBox(
      height: 30,
      

     child:  Row(children: [



      ],)
    )






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
    ],
    
   ),

  
   ),
    );
    
  }
}



Widget categoryItem(IconData icon, String text) {
  return Column(
    children: [
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
    ],
  );
}