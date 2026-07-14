import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    required this.username,
    required this.email,
    required this.bio,
    required this.hobbies,
    this.profileImage,
  });

  final String username;
  final String email;
  final String bio;
  final List<String> hobbies;
  final ImageProvider? profileImage;

  bool get _hasValidEmail {
    final emailPattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailPattern.hasMatch(email.trim());
  }

  @override
  Widget build(BuildContext context) {
    const cardBackground = Color(0xFFFFFCF4);
    const borderColor = Color(0xFF9CCAF0);
    const primaryTextColor = Color(0xFF174A7C);
    const secondaryTextColor = Color(0xFF2E669A);

    return Card(
      color: cardBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 42,
              backgroundColor: borderColor.withValues(alpha: 0.35),
              backgroundImage: profileImage,
              child: profileImage == null
                  ? const Icon(
                      Icons.person,
                      size: 48,
                      color: primaryTextColor,
                    )
                  : null,
            ),
            const SizedBox(height: 16),
            Text(
              username,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: primaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              _hasValidEmail ? email.trim() : 'Invalid email',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: secondaryTextColor,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              bio,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: secondaryTextColor,
                  ),
            ),
            const SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: hobbies
                  .where((hobby) => hobby.trim().isNotEmpty)
                  .map(
                    (hobby) => Chip(
                      label: Text(hobby.trim()),
                      backgroundColor: const Color(0xFFEAF5FF),
                      side: const BorderSide(color: borderColor),
                      labelStyle: const TextStyle(
                        color: primaryTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
