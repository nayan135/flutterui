import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/favorites_page.dart';
import 'pages/orders_page.dart';
import 'pages/profile_page.dart';
import 'pages/ai_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';

Future<void> getFCMToken() async {
  try {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    print("Notification permission status: ${settings.authorizationStatus}");

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
  
      String? token = await FirebaseMessaging.instance.getToken();
      print("FCM Token: $token");
      
      FirebaseMessaging.instance.onTokenRefresh.listen((String newToken) {
        print("FCM Token Refreshed: $newToken");
      });
    } else {
      print("User declined or has not accepted permission: ${settings.authorizationStatus}");
    }
  } catch (e) {
    print("Error getting FCM token: $e");
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) {
  print("Handling a background message: ${message.messageId}");
  return Future.value();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // Initialize Firebase In-App Messaging
  await FirebaseInAppMessaging.instance.triggerEvent('app_start');
  
  await getFCMToken();
  
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Message received in foreground: ${message.notification?.title}");
  
  });
  
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterUI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 64, 37, 111)),
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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          children: [
            Icon(
              Icons.shopping_bag,
              color: Colors.blue,
            ),
            SizedBox(width: 5),
            Text(
              "ShopUI",
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
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomePage(),
          FavoritesPage(),
          OrdersPage(),
          ProfilePage(),
          AiPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.air),
            label: 'AI',
          ),
        ],
      ),
    );
  }
}
