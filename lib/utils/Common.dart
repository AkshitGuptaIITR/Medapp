import 'package:flutter/material.dart';

class RowItem {
  final VoidCallback onClick;
  final String name;
  final IconData icon;

  RowItem({
    required this.onClick,
    required this.name,
    required this.icon,
  });
}

final List<RowItem> rowItems = [
  RowItem(onClick: () {}, name: "Register", icon: Icons.person),
  RowItem(onClick: () {}, name: "Find Clinic", icon: Icons.local_hospital),
  RowItem(onClick: () {}, name: "Tips", icon: Icons.tips_and_updates),
  RowItem(onClick: () {}, name: "Faqs", icon: Icons.question_answer),
];

final drawerItems = [
  {"name": "Profile", "icon": Icons.person_outline},
  {"name": "Support", "icon": Icons.support},
  {"name": "Terms of Service", "icon": Icons.note_outlined},
  {"name": "Privacy Policy", "icon": Icons.note_alt_outlined},
  {"name": "FAQs for app", "icon": Icons.chat_outlined},
  {"name": "Share App", "icon": Icons.share_outlined},
  {"name": "Log Out", "icon": Icons.logout_outlined},
];

final List<RowItem> drawerRowItems = drawerItems.map((item) {
  return RowItem(
    onClick: () {}, // Replace with your actual click function
    name: item["name"] as String,
    icon: item["icon"] as IconData,
  );
}).toList();
