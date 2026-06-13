import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  int _cartCount = 0;

  
  static const Color brandBlue = Color(0xFF1A6FE8);
  static const Color brandOrange = Color(0xFFF59220);

 
  String _selectedCategory = "All";

  final List<Map<String, dynamic>> _categories = [
    {"icon": Icons.apps, "label": "All"},
    {"icon": Icons.checkroom, "label": "Fashion"},
    {"icon": Icons.devices, "label": "Electronics"},
    {"icon": Icons.chair, "label": "Home"},
    {"icon": Icons.brush, "label": "Beauty"},
  ];

  final List<Map<String, dynamic>> _products = [
    {
      "title": "Cotton T-Shirt",
      "description": "Soft and breathable everyday wear",
      "category": "Fashion",
    },
    {
      "title": "Denim Jacket",
      "description": "Classic fit, durable fabric",
      "category": "Fashion",
    },
    {
      "title": "Wireless Earbuds",
      "description": "Noise cancelling, long battery life",
      "category": "Electronics",
    },
    {
      "title": "Smart Watch",
      "description": "Track fitness and notifications",
      "category": "Electronics",
    },
    {
      "title": "Table Lamp",
      "description": "Warm light for cozy evenings",
      "category": "Home",
    },
    {
      "title": "Face Cream",
      "description": "Hydrating daily moisturizer",
      "category": "Beauty",
    },
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
      print(_counter);
    });
  }

  void _selectCategory(String label) {
    setState(() {
      _selectedCategory = label;
    });
  }

  void _addToCart(String productTitle) {
    setState(() {
      _cartCount++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$productTitle added to cart"),
        duration: const Duration(seconds: 1),
        backgroundColor: brandBlue,
      ),
    );

    _incrementCounter();
  }

  @override
  Widget build(BuildContext context) {

    final filteredProducts = _selectedCategory == "All"
        ? _products
        : _products
            .where((product) => product["category"] == _selectedCategory)
            .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 231, 224, 224),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: brandBlue.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.shopping_cart, color: brandBlue),
                    ),
                    if (_cartCount > 0)
                      Positioned(
                        right: -4,
                        top: -4,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: brandOrange,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          child: Text(
                            '$_cartCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/random.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _categories.map((category) {
                return categoryItem(
                  category["icon"],
                  category["label"],
                  isSelected: _selectedCategory == category["label"],
                );
              }).toList(),
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

            if (filteredProducts.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  "No products in this category yet",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              )
            else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return Card(
                    margin: EdgeInsets.all(13),
                    color: brandBlue,
                    elevation: 5,
                    shadowColor: brandOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // expanded for overflowwwww controolll
                        Expanded(
                          child: Image.asset(
                            "assets/fornt.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product["title"],
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product["description"],
                                style: TextStyle(color: Colors.grey[300]),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
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
                                  _addToCart(product["title"]);
                                },
                                child: Text(
                                  'Add to cart',
                                  style: TextStyle(color: brandOrange),
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

Widget categoryItem(IconData icon, String text, {bool isSelected = false}) {
  return GestureDetector(
    onTap: () => _selectCategory(text),
    child: Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: isSelected
              ? _HomePageState.brandBlue
              : const Color.fromARGB(255, 145, 134, 134),
          child: Icon(
            icon,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? _HomePageState.brandBlue : Colors.black,
          ),
        ),
      ],
    ),
  );
}