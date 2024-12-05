import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name = "John Doe";
  final String email = "johndoe@example.com";
  final String imageUrl = "https://www.w3schools.com/w3images/avatar2.png";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(imageUrl),
                backgroundColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 16),

            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Email
            Text(
              email,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),

            const Text(
              'Account Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            ProfileActionButton(
              icon: Icons.edit,
              text: 'Edit Profile',
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            ProfileActionButton(
              icon: Icons.lock,
              text: 'Change Password',
              onPressed: () {},
            ),
            const SizedBox(height: 16),
            ProfileActionButton(
              icon: Icons.exit_to_app,
              text: 'Log Out',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileActionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const ProfileActionButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: onPressed,
    );
  }
}
