import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Main Page'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(_customPageRoute());
            },
            child: Text('Show Full-Screen Page'),
          ),
        ),
      ),
    );
  }

  PageRouteBuilder _customPageRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: MyHomePage(),
        );
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const offsetBegin = Offset(1.0, 0.0);
        const offsetEnd = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: offsetBegin, end: offsetEnd);
        var offsetAnimation =
            animation.drive(tween.chain(CurveTween(curve: curve)));
        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        print('Current Index: $_currentIndex');
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new))
                  ],
                ),
              ),
            ),
            Text("Select Strength"),
            SizedBox(
              width: 100,
              height: 300,
              child: Stack(
                children: [
                  ListWheelScrollView.useDelegate(
                    controller: _scrollController,
                    useMagnifier: true,
                    magnification: 1,
                    itemExtent: 60,
                    overAndUnderCenterOpacity: 0.3,
                    childDelegate: ListWheelChildBuilderDelegate(
                      builder: (context, index) {
                        final items = ['Slow', 'Medium', 'Fast'];

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.all(8),
                          alignment: Alignment.center,
                          child: Text(
                            items[index],
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                      childCount: 3,
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 2,
                      color: Colors.grey[300],
                    ),
                  ),
                  Positioned(
                    bottom: 130,
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
          ],
        ),
      ),
    );
  }
}
