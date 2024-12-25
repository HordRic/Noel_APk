import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:joyeux_noel/quote_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  final _formkey = GlobalKey<FormState>();
  String _name = "";

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/cover-image.png",
                    width: double.infinity,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "CHRISMAS GIFTS",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Generate random quotes for your Christmas Spirit",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Color(0x8a2e2b2b),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Your Name: ",
                      floatingLabelStyle: TextStyle(
                        color: Color(0xffc63026),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffc63026),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please Enter Your Name";
                      }
                      return null;
                    },
                    onSaved: (newValue) => _name = newValue!,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuoteScreen(name: _name),
                              ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffc63026),
                          shape: StadiumBorder(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 30)),
                      child: Text(
                        "Let's Celebrate Christmas"!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
