import 'package:flutter/material.dart';
import 'package:flutter_crud/services/api_service.dart';
import 'models/cases.dart';

enum Gender { male, female }
enum Status { positive, dead, recovered }

class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.cases);

  final Cases cases;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();
  String id = '';
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _salararyController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    id = widget.cases.id;
    _nameController.text = widget.cases.name;
    _ageController.text = widget.cases.age.toString();
    _lastnameController.text = widget.cases.lastname;
    _birthdateController.text = widget.cases.birthdate;
    _salararyController.text = widget.cases.salarary;
    _descriptionController.text = widget.cases.description;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Cases'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Full Name'),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Full Name',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter full name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Age'),
                              TextFormField(
                                controller: _ageController,
                                decoration: const InputDecoration(
                                  hintText: 'Age',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter age';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('lastname'),
                              TextFormField(
                                controller: _lastnameController,
                                decoration: const InputDecoration(
                                  hintText: 'lastname',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter lastname';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('birthdate'),
                              TextFormField(
                                controller: _birthdateController,
                                decoration: const InputDecoration(
                                  hintText: 'birthdate',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter birthdate';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('salarary'),
                              TextFormField(
                                controller: _salararyController,
                                decoration: const InputDecoration(
                                  hintText: 'salarary',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter salarary';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  if (_addFormKey.currentState.validate()) {
                                    _addFormKey.currentState.save();
                                    api.updateCases(id, Cases(name: _nameController.text, age: int.parse(_ageController.text), lastname: _lastnameController.text, birthdate: _birthdateController.text, salarary: _salararyController.text, description: _descriptionController.text));

                                    Navigator.pop(context) ;
                                  }
                                },
                                child: Text('Save', style: TextStyle(color: Colors.white)),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                )
            ),
          ),
        ),
      ),
    );
  }

}