import 'package:flutter/material.dart';
import 'package:ui_assignment/controller/setting_controller.dart';

class SelectionWheel extends StatefulWidget {
  final List<String> items;
  final String headingLabel;
  final SettingController controller;

  const SelectionWheel({
    super.key,
    required this.items,
    required this.headingLabel,
    required this.controller,
  });

  @override
  State<SelectionWheel> createState() => _SelectionWheelState();
}

class _SelectionWheelState extends State<SelectionWheel> {
  late FixedExtentScrollController _scrollController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController();
    _currentIndex = 0;

    _scrollController.addListener(() {
      final int index = _scrollController.selectedItem;
      if (index != _currentIndex) {
        setState(() {
          _currentIndex = index;
        });
        // Update the controller value when the item is centered
        _updateControllerValue();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateControllerValue() {
    String selectedItem = widget.items[_currentIndex];
    if (widget.headingLabel == 'tune') {
      widget.controller.updateRingtone(selectedItem);
    } else if (widget.headingLabel == 'strength') {
      widget.controller.updateVibrationStrength(selectedItem);
    } else if (widget.headingLabel == 'snooz') {
      widget.controller.updateSnoozeDuration(selectedItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
        child: Column(
          children: [
            SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                ],
              ),
            ),
            Text(
              'Select ${widget.headingLabel}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
              child: SizedBox(
                width: 100,
                height: 160,
                child: Stack(
                  children: [
                    ListWheelScrollView.useDelegate(
                      clipBehavior: Clip.antiAlias,
                      controller: _scrollController,
                      useMagnifier: true,
                      magnification: 1.1,
                      itemExtent: 60,
                      overAndUnderCenterOpacity: 0.3,
                      physics: const FixedExtentScrollPhysics(),
                      childDelegate: ListWheelChildBuilderDelegate(
                        builder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Text(
                              widget.items[index],
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          );
                        },
                        childCount: widget.items.length,
                      ),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                        _updateControllerValue();
                      },
                    ),
                    Positioned(
                      top: 55,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 2,
                        color: Colors.grey[300],
                      ),
                    ),
                    Positioned(
                      bottom: 55,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 2,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
