import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpapp/screens/about_university.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class AboutYouScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    final _devHeight = MediaQuery.of(context).size.height;
    // final _devWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tell Us \nAbout You',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: _devHeight * 0.05),
              BuildForm(),
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
                        builder: (context) => AboutUniversityScreen(),
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

class BuildForm extends StatefulWidget {
  @override
  _BuildFormState createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _devHeight = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTextField(
            controller: _nameController,
            hintText: "Your Name",
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: _devHeight * 0.02),
          buildTextField(
            controller: _ageController,
            hintText: "Your Age",
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: _devHeight * 0.02),
          buildTextField(
            controller: _emailController,
            hintText: "Your Email",
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }
}

//
TextFormField buildTextField(
    {@required TextEditingController controller,
    @required String hintText,
    @required TextInputType keyboardType}) {
  return TextFormField(
    validator: (value) {
      if (value.isEmpty) {
        return "required";
      } else {
        return null;
      }
    },
    controller: controller,
    style: TextStyle(fontSize: 22.0),
    keyboardType: keyboardType,
    cursorColor: Colors.black,
    decoration: InputDecoration(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
  );
}
