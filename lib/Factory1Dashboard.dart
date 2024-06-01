import 'package:flutter/material.dart';

class Factory1Dashboard extends StatefulWidget {
  @override
  _Factory1DashboardState createState() => _Factory1DashboardState();
}

class _Factory1DashboardState extends State<Factory1Dashboard> {
  String selectedFactory = 'Factory 1';
  int selectedIndex = 1;

  void _onFactoryButtonPressed(String factory) {
    setState(() {
      selectedFactory = factory;
    });
    _navigateToScreen();
  }

  void _onBottomNavItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    _navigateToScreen();
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
              child: SingleChildScrollView(
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
                    children: [
                      Icon(Icons.warning),
                      SizedBox(height: 8),
                      Text(
                        'ABD1234 IS UNREACHABLE !',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildGauge(
                              'Steam Pressure', '0.0', 'bar', Colors.grey),
                          _buildGauge('Steam Flow', '0.0', 'T/H', Colors.grey),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildGauge('Water Level', '0.0', '%', Colors.grey),
                          _buildGauge(
                              'Power Frequency', '0.0', 'Hz', Colors.grey),
                        ],
                      ),
                      SizedBox(height: 25),
                      Text('2024-04-26 13:45:25'),
                    ],
                  ),
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

  Widget _buildGauge(String title, String value, String unit, Color color) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(8),
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
        children: [
          Text(title),
          SizedBox(height: 8),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 8),
                ),
              ),
              Text(
                '$value\n$unit',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
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
