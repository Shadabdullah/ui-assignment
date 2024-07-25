import 'package:flutter/material.dart';

class DateRange extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  const DateRange(
      {super.key, required this.controller, required this.labelText});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: .1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 0),
                isDense: true,
              ),
              readOnly: true,
              style: const TextStyle(fontSize: 16.0),
            ),
            const Positioned(
              left: 16.0,
              child: Text(
                'DD / MM / YY',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ),
            const Positioned(
              right: 16.0,
              child: Text(
                'HH:MM',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
