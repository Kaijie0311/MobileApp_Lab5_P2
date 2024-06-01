import 'package:flutter/material.dart';

class Notification2 extends StatefulWidget {
  @override
  _Notification2State createState() => _Notification2State();
}

class _Notification2State extends State<Notification2> {
  String selectedFactory = 'Factory 2';
  int selectedIndex = 2;

  void _onFactoryButtonPressed(String factory) {
    if (factory != selectedFactory) {
      setState(() {
        selectedFactory = factory;
      });
      _navigateToScreen();
    }
  }

  void _onBottomNavItemTapped(int index) {
    if (index != selectedIndex) {
      setState(() {
        selectedIndex = index;
      });
      _navigateToScreen();
    }
  }

  void _navigateToScreen() {
    String? routeName;
    if (selectedFactory == 'Factory 1') {
      if (selectedIndex == 0) {
        routeName = '/EngList1';
      } else if (selectedIndex == 1) {
        routeName = '/Factory1Dashboard';
      } else if (selectedIndex == 2) {
        routeName = '/Notification1';
      }
    } else if (selectedFactory == 'Factory 2') {
      if (selectedIndex == 0) {
        routeName = '/EngList2';
      } else if (selectedIndex == 1) {
        routeName = '/Factory2Dashboard';
      } else if (selectedIndex == 2) {
        routeName = '/Notification2';
      }
    }
    if (routeName != null &&
        routeName != ModalRoute.of(context)?.settings.name) {
      Navigator.pushNamed(context, routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          selectedFactory,
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Minimum Threshold',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.info_outline),
                            SizedBox(width: 8),
                            Icon(Icons.edit),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildValueBox(context, 'Steam\nPressure', '29', 'bar',
                            Colors.grey),
                        SizedBox(width: 24),
                        _buildValueBox(
                            context, 'Steam\nFlow', '22', 'T/H', Colors.grey),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildValueBox(
                            context, 'Water\nLevel', '53', '%', Colors.grey),
                        SizedBox(width: 24),
                        _buildValueBox(context, 'Power\nFrequency', '48', 'Hz',
                            Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 160,
              width: MediaQuery.of(context).size.width * 0.84,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildFactoryButton(context, 'Factory 1',
                      selected: selectedFactory == 'Factory 1'),
                  _buildFactoryButton(context, 'Factory 2',
                      selected: selectedFactory == 'Factory 2'),
                  _buildFactoryButton(context, 'Factory 3',
                      selected: selectedFactory == 'Factory 3'),
                  _buildFactoryButton(context, 'Factory 4',
                      selected: selectedFactory == 'Factory 4'),
                  _buildFactoryButton(context, 'Factory 5',
                      selected: selectedFactory == 'Factory 5'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onBottomNavItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }

  Widget _buildValueBox(BuildContext context, String title, String value,
      String unit, Color color) {
    return SizedBox(
      width: 140,
      child: Column(
        children: [
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 2,
                  height: 40,
                  color: Colors.grey[500],
                  margin: EdgeInsets.symmetric(horizontal: 8),
                ),
                Text(
                  unit,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFactoryButton(BuildContext context, String label,
      {bool selected = false}) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 32,
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ElevatedButton(
        onPressed: () {
          _onFactoryButtonPressed(label);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: selected ? Colors.blue : Colors.grey,
          padding: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: selected ? Colors.blue : Colors.grey),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.factory,
                size: 40, color: selected ? Colors.blue : Colors.grey),
            SizedBox(height: 8),
            Text(label,
                style: TextStyle(color: selected ? Colors.blue : Colors.grey)),
          ],
        ),
      ),
    );
  }
}
