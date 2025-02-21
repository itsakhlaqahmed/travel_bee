import 'package:flutter/material.dart';
import 'package:travel_bee/pages/order_list.dart';
import 'package:travel_bee/services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        ),
        child: Column(
          children: [
            const SizedBox(height: 60), // Spacing for status bar
            // Profile Picture & Info
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/women/10.jpg"), // Replace with actual user image
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Jaweria",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Joined October 2024",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Profile Options Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildOption(Icons.person, "Profile", () {}),
                  const Divider(),
                  _buildOption(Icons.card_travel, "My Packages", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => OrderPage()));
                  }),
                ],
              ),
            ),

            const SizedBox(height: 20),
            // Logout Button
            ElevatedButton(
              onPressed: () {
                AuthService().signOut();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                elevation: 5,
              ),
              child: const Text(
                "Log out",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Profile Options
  Widget _buildOption(IconData icon, String label, Function() onClick) {
    return ListTile(
        leading: Icon(icon, color: Colors.black54),
        title: Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onClick);
  }
}
