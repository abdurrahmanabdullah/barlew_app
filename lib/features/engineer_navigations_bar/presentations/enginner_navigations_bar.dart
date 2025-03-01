import 'package:barlew_app/features/engineer/chat/presentation/engineer_chat_screen.dart';
import 'package:barlew_app/features/engineer/home/presentatiosn/engineer_home_screen.dart';
import 'package:barlew_app/features/engineer/personal_information/presentation/engineer_personal_info_screen.dart';
import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../../engineer/engineer_notifications/presentations/enginner_notifications_screen.dart';

class EngineerNavigationsBarScreen extends StatefulWidget {
  const EngineerNavigationsBarScreen({super.key});

  @override
  State<EngineerNavigationsBarScreen> createState() =>
      _EngineerNavigationsBarScreenState();
}

class _EngineerNavigationsBarScreenState
    extends State<EngineerNavigationsBarScreen> {
  int index = 0; // Corrected variable name
  final List _pageList = [
    const EngineerHomeScreen(),
    const EngineerChatScreen(),
    const EngineerNotificationScreen(),
    const EngineerPersonalInfoScreen(),
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
