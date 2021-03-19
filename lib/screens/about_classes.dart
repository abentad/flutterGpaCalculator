import 'package:flutter/material.dart';
import 'package:gpapp/screens/about_you.dart';

class AboutClassesScreen extends StatefulWidget {
  @override
  _AboutClassesScreenState createState() => _AboutClassesScreenState();
}

class _AboutClassesScreenState extends State<AboutClassesScreen> {
  TextEditingController _classNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _devHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Classes',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: _devHeight * 0.05),
              buildTextField(
                controller: _classNumberController,
                hintText: "How many Classes",
                keyboardType: TextInputType.number,
              )
            ],
          ),
        ),
      ),
    );
  }
}
