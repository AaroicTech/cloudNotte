import 'package:flutter/material.dart';
import 'package:passing_datas/firebase_vitual/db.dart';
import 'package:passing_datas/style/font.dart';

class CloudNotteHomePage extends StatefulWidget {
  const CloudNotteHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<CloudNotteHomePage> createState() => _CloudNotteHomePageState();
}

String dropdownValue = 'Select Subject';
TextEditingController _description = TextEditingController();
TextEditingController _link = TextEditingController();
TextEditingController _topic = TextEditingController();
TextEditingController _title = TextEditingController();
final _key = GlobalKey<FormState>();

class _CloudNotteHomePageState extends State<CloudNotteHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('CloudNotte page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Form(
              key: _key,
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(),
                      ),
                      child: Container(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue,
                          icon: const Icon(Icons.more_vert),
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Select Subject',
                            'Physics',
                            'Chemistry',
                            'Maths',
                            'Biology',
                            'Earthscience',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(10),
                      // height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(),
                      ),
                      child: TextFormField(
                        controller: _topic,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'field is emty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Topic',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 13),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all()),
                      child: TextFormField(
                        controller: _title,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'field is emty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Title',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 13),
                    Container(
                      padding: const EdgeInsets.all(10),
                      //height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(),
                      ),
                      child: TextFormField(
                        controller: _description,
                        maxLines: 5,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'field is emty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Description',
                          border: InputBorder.none,
                        ),
                        //maxLength: 4,
                      ),
                    ),
                    const SizedBox(height: 13),
                    Container(
                      padding: const EdgeInsets.all(10),
                      // height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(),
                      ),
                      child: TextFormField(
                        controller: _link,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'field is emty';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Links',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (_key.currentState!.validate()) {
                  if (dropdownValue == "Select Subject") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('please select a subject'),
                      ),
                    );
                  } else {
                    DB().add(
                        dropdownValue,
                        _title.text.trim(),
                        _link.text.trim(),
                        _topic.text.trim(),
                        _description.text.trim());
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('sucessfully added'),
                      ),
                    );
                  }
                }
              },
              child: Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text('save', style: save),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
