import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpapp/screens/about_classes.dart';
import 'package:gpapp/screens/about_you.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class AboutUniversityScreen extends StatefulWidget {
  @override
  _AboutUniversityScreenState createState() => _AboutUniversityScreenState();
}

class _AboutUniversityScreenState extends State<AboutUniversityScreen> {
  String valueChoice;
  List<String> dropDownListItem = [
    "Computer Science",
    "Accounting",
    "Architecture",
  ];

  TextEditingController _universitycontroller = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _semesterController = TextEditingController();

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
                'Education',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: _devHeight * 0.05),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return "required";
                        } else {
                          return null;
                        }
                      },
                      hint: Text(
                        'Your Department',
                        style: TextStyle(color: Colors.grey, fontSize: 18.0),
                      ),
                      value: valueChoice,
                      iconSize: 36.0,
                      isExpanded: true,
                      // underline: SizedBox(),
                      style: TextStyle(color: Colors.black, fontSize: 22.0),
                      onChanged: (newValue) {
                        setState(() {
                          valueChoice = newValue;
                        });
                      },
                      items: dropDownListItem.map((e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: _devHeight * 0.02),
                    buildTextField(
                      controller: _universitycontroller,
                      hintText: "Your University",
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: _devHeight * 0.02),
                    buildTextField(
                      controller: _yearController,
                      hintText: "What Year",
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: _devHeight * 0.02),
                    buildTextField(
                      controller: _semesterController,
                      hintText: "Your Semester",
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
              SizedBox(height: _devHeight * 0.05),
              MaterialButton(
                height: 50.0,
                minWidth: double.infinity,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text('Continue'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.of(context).push(
                      CupertinoPageRoute(
                        builder: (context) => AboutClassesScreen(),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
