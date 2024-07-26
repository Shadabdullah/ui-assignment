import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ui_assignment/views/screens/addmed.dart';

import 'settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Med Reminder',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(_fadePageRoute(
                builder: (context) => const SettingScreen(),
              ));
            },
            icon: const Icon(Iconsax.setting),
          ),
        ],
      ),
      body: Center(
        child: TextButton.icon(
          onPressed: () {
            Navigator.of(context).push(_fadePageRoute(
              builder: (context) => const AddMedScreen(),
            ));
          },
          icon: const Icon(Icons.add),
          label: const Text(
            "Add New Reminder",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  PageRouteBuilder _fadePageRoute({required WidgetBuilder builder}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: offsetAnimation, child: child),
        );
      },
    );
  }
}
