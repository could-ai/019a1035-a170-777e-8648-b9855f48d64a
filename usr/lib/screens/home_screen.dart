import "package:flutter/material.dart";
import "package:couldai_user_app/widgets/nav_menu.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 1);
  int _currentIndex = 1;

  final List<Widget> _screens = [
    const Center(child: Text("Chat Screen", style: TextStyle(fontSize: 24, color: Colors.white))),
    const Center(child: Text("Feed Screen", style: TextStyle(fontSize: 24, color: Colors.white))),
    const Center(child: Text("Videos Screen", style: TextStyle(fontSize: 24, color: Colors.white))),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onNavItemTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),
      bottomNavigationBar: NavMenu(
        currentIndex: _currentIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
