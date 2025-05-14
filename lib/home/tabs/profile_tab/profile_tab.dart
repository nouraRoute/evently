import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Language'),
        DropdownButton<String>(
          value: context.watch<AppSettingsProvider>().appLocal,
          items: [
            DropdownMenuItem(
              child: Text('arbic'),
              value: 'ar',
            ),
            DropdownMenuItem(
              child: Text('English'),
              value: 'en',
            )
          ],
          onChanged: (value) {
            context.read<AppSettingsProvider>().changeLocale();
          },
        )
      ],
    );
  }
}
