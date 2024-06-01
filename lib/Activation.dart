import 'package:flutter/material.dart';
import 'OTP.dart';
import 'EngList1.dart';
import 'Notification1.dart';
import 'Notification2.dart';
import 'EngList2.dart';
import 'Factory1Dashboard.dart';
import 'Factory2Dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/Factory1Dashboard': (context) => Factory1Dashboard(),
        '/Factory2Dashboard': (context) => Factory2Dashboard(),
        '/EngList1': (context) => EngList1(),
        '/EngList2': (context) => EngList2(),
        '/Notification1': (context) => Notification1(),
        '/Notification2': (context) => Notification2(),
        '/Activation': (context) => Activation(),
        '/OTP': (context) => OTP(),
      },
      initialRoute: '/Activation',
      debugShowCheckedModeBanner: false,
      home: Activation(),
    );
  }
}

class Activation extends StatefulWidget {
  @override
  _ActivationState createState() => _ActivationState();
}

class _ActivationState extends State<Activation> {
  bool _isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 25,
                child: Center(
                  child: Image.asset(
                    'images/upm_logo.jpg',
                    height: 150,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome !',
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.pink.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Enter your mobile number to activate your account.',
                                              style: TextStyle(fontSize: 18),
                                              maxLines: null,
                                            ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.info),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 40),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Image.asset('images/malaysia.jpg',
                                              height: 20),
                                          SizedBox(width: 5),
                                          Text('+60'),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Mobile Number',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: _isTermsAccepted,
                                      onChanged: (value) {
                                        setState(() {
                                          _isTermsAccepted = value!;
                                        });
                                      },
                                    ),
                                    Text('I agree to the terms & conditions'),
                                  ],
                                ),
                                SizedBox(height: 15),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/OTP');
                                  },
                                  child: Text('Get Activation Code'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Disclaimer | Privacy Statement',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Copyright UPM & Kejuruteraan Minyak Sawit\n CGS Sdn. Bhd.',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
