import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Iconsax.moon),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                // TODO: Implement theme toggle
              },
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Iconsax.document_download),
            title: const Text('Backup & Restore'),
            trailing: const Icon(Iconsax.arrow_right_3),
            onTap: () {
              // TODO: Navigate to backup page
            },
          ),
          ListTile(
            leading: const Icon(Iconsax.refresh),
            title: const Text('Check for Updates'),
            trailing: const Icon(Iconsax.arrow_right_3),
            onTap: () {
              // TODO: Check for updates
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Iconsax.info_circle),
            title: const Text('About'),
            trailing: const Icon(Iconsax.arrow_right_3),
            onTap: () {
              // TODO: Show about dialog
            },
          ),
        ],
      ),
    );
  }
}
