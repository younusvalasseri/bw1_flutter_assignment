import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Future<void> _launchPrivacyPolicy() async {
    final Uri url = Uri.parse(
      'https://www.termsfeed.com/live/7d0ea6df-75e9-402b-af09-0035d341d274',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch Privacy Policy URL');
    }
  }

  Future<void> _launchHelpSupport() async {
    final Uri url = Uri.parse(
      'https://younusvalasseri.github.io/Personal-Website/index.html#contact-section',
    );
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch Help & Support URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          ListTile(
            leading: const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green,
              child: Icon(Icons.person, color: Colors.white, size: 30),
            ),
            title: const Text(
              'Younus Valasseri',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: const Text('younusv@gmail.com'),
            trailing: IconButton(
              icon: const Icon(Icons.edit, color: Colors.grey),
              onPressed: () {},
            ),
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text('Privacy Policy'),
            onTap: _launchPrivacyPolicy,
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('Help & Support'),
            onTap: _launchHelpSupport,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout
            },
          ),
        ],
      ),
    );
  }
}
