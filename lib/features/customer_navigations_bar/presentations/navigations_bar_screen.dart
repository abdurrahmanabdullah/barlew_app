import 'package:barlew_app/features/customer/home/presentation/customer_home_service_screen.dart';
import 'package:barlew_app/features/customer/notification/presentations/notification_screen.dart';

import 'package:barlew_app/features/customer/personal_Information/presentations/customer_profile_screen.dart';
import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../../customer/chat/presentation/chat_screen.dart';

class NavigationsBarScreen extends StatefulWidget {
  const NavigationsBarScreen({super.key});

  @override
  State<NavigationsBarScreen> createState() => _NavigationsBarScreenState();
}

class _NavigationsBarScreenState extends State<NavigationsBarScreen> {
  int index = 0; // Corrected variable name
  final List _pageList = [
    const CustomerHomeScreen(),
    const ChatScreen(),
    const NotificationScreen(),
    const CustomerProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[index],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showUnselectedLabels: true, // Show labels for unselected items
        type: BottomNavigationBarType.fixed, // Fixed type for equal spacing
        selectedItemColor: Colors.blue, // Selected icon and label color
        selectedLabelStyle: const TextStyle(
            color: Colors.blue, fontSize: 14), // Selected label style
        unselectedItemColor: const Color(0xFF192A48), // Unselected icon color
        unselectedLabelStyle: const TextStyle(
            color: Color(0xFF192A48), fontSize: 14), // Unselected label style
        enableFeedback: false, // Enable feedback (true for haptic feedback)

        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(Assets.icons.home2.path,
                height: 24, color: index == 0 ? Colors.blue : Colors.grey),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.icons.chat2.path,
                height: 24, color: index == 1 ? Colors.blue : Colors.grey),
            label: 'Chat',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.icons.notification.path,
                height: 23, color: index == 2 ? Colors.blue : Colors.grey),
            label: 'Notification',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(Assets.icons.person.path,
                height: 24, color: index == 3 ? Colors.blue : Colors.grey),
            label: 'Person',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: index,
        onTap: (int selectedIndex) {
          setState(() {
            index = selectedIndex; // Update the index when a tab is selected
          });
        },
      ),
    );
  }
}
