import 'package:flutter/material.dart';
import 'package:code/home.dart';
import 'login_page.dart';
import 'package:code/about.dart';
import 'package:code/Project.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/home': (context) => HomeScreen(),
        '/about': (context) => AboutScreen(),
        '/project': (context) => ProjectScreen(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeContent(),
    AboutScreen(),
    ProjectScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4B4B5E),
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Color(0xFF4B4B5E),
        elevation: 0,
      ),
      body: SafeArea(
        child: _screens[_currentIndex], // Show the selected screen
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current tab index
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Project',
          ),
        ],
        backgroundColor: Color.fromARGB(255, 35, 35, 49),
        selectedItemColor: Color(0xFF8BC34A),
        unselectedItemColor: Colors.white,
      ),
    );
  }
}

// Home screen content
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Center(
            child: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('josep.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  "Hello I’m Joseph",
                  style: TextStyle(
                    color: Color(0xFF8BC34A),
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Your beginner designer",
                  style: TextStyle(
                    color: Color(0xFF8BC34A),
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
