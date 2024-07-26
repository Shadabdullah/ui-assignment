import 'package:flutter/material.dart';
import 'package:ui_assignment/views/widgets/fequency.dart';

class AddMedScreen extends StatefulWidget {
  const AddMedScreen({super.key});

  @override
  State<AddMedScreen> createState() => _AddMedScreenState();
}

class _AddMedScreenState extends State<AddMedScreen> {
  FrequencyOption _selectedFrequency = FrequencyOption.daily;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          margin: const EdgeInsets.all(16.0),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            centerTitle: true,
            title: const Text(
              'Add Medicine Info',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text("Next",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        margin: const EdgeInsets.only(bottom: 30.0),
        child: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.transparent,
          elevation: 0, // Remove the default shadow
          label: const Row(
            children: [
              Icon(Icons.add,
                  color:
                      Colors.black), // Change icon color to black for contrast
              SizedBox(width: 8),
              Text('Add Item',
                  style: TextStyle(
                      color: Colors
                          .black)), // Change text color to black for contrast
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Medicine Name",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20.0),
                    hintText: 'Enter text here',
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Frequency",
                ),
              ),
              FrequencySelectionWidget(
                selectedFrequency: _selectedFrequency,
                onChanged: (FrequencyOption? value) {
                  setState(() {
                    _selectedFrequency = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
