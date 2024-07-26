import 'package:flutter/material.dart';
import 'package:ui_assignment/views/widgets/selection_wheel.dart';

class AlarmDropdown extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final String label;

  const AlarmDropdown(
      {super.key,
      required this.items,
      required this.selectedItem,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(_fadePageRoute(
          builder: (context) =>
              SelectionWheel(items: items, headingLabel: label),
        ));
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(width: 0.1),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(selectedItem), const Icon(Icons.expand_more)],
            ),
          )),
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
