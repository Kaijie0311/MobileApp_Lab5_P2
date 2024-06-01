import 'package:flutter/material.dart';
import 'Invitation1.dart';

class EngList1 extends StatefulWidget {
  @override
  _EngList1State createState() => _EngList1State();
}

class _EngList1State extends State<EngList1> {
  String selectedFactory = 'Factory 1';
  int selectedIndex = 0;

  List<Map<String, String>> contacts = [
    {'name': 'Ben', 'phone': '+60109219938'},
    {'name': 'Testing 1', 'phone': '+601234567891'},
    {'name': 'Hello', 'phone': '+60123456789'},
  ];

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

  void _addContact(String name, String phone) {
    setState(() {
      contacts.add({'name': name, 'phone': phone});
    });
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
              child: Stack(
                children: [
                  Container(
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
                    child: ListView.builder(
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            buildContactCard(contacts[index]['name']!,
                                contacts[index]['phone']!),
                            SizedBox(height: 16),
                          ],
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: FloatingActionButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Invitation1(),
                          ),
                        );
                        if (result != null) {
                          _addContact(result['name'], result['phone']);
                        }
                      },
                      child: Icon(Icons.add),
                      backgroundColor: Colors.purple.shade100,
                    ),
                  ),
                ],
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

  Widget buildContactCard(String name, String phone) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(name),
        subtitle: Text(phone),
        leading: Icon(Icons.circle, size: 10),
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
