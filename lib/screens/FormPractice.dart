import 'package:flutter/material.dart';

class FormPractice extends StatefulWidget {
  const FormPractice({Key? key}) : super(key: key);

  @override
  _FormPracticeState createState() => _FormPracticeState();
}

class _FormPracticeState extends State<FormPractice> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return ListView(
      children: [
      Form(
      key: _formKey,
      child:  Column(
        children: <Widget>[
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: InputDecoration(
              fillColor: Colors.green.shade100
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Processing Data')),
                );
              }
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    )
      ],
    );
  }
}
