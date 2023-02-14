// ignore_for_file: sort_child_properties_last

import 'dart:io';

import 'package:erangaapp/models/Document.dart';
import 'package:erangaapp/providers/Cars.dart';
import 'package:erangaapp/providers/Documents.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './theme_helper.dart';
import 'package:uuid/uuid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utils/image_util.dart';

import 'Cars.dart';
import 'header_widget.dart';

class CarForm extends StatefulWidget {
  static String id = '/carform';
  const CarForm({super.key});

  @override
  State<CarForm> createState() => _CarFormState();
}

class _CarFormState extends State<CarForm> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _documentIdController = TextEditingController();
  final _ownerName = TextEditingController();
  final _ownerPhone = TextEditingController();
  final _finderName = TextEditingController();
  final _documentType = TextEditingController();
  final _description = TextEditingController();
  final _userId = TextEditingController();
  bool checkedValue = false;
  bool isLoading = false;

  bool checkboxValue = false;
  String serviceType = 'For rent';
  File? imageData;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final documentProvider = Provider.of<DocumentsProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  FontAwesomeIcons.fileInvoice,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * .78,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Car model', 'Enter car model'),
                                  controller: _modelController,
                                  validator: (val) {
                                    if ((val!.isEmpty)) {
                                      return "Enter car model";
                                    }
                                  },
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                              Container(
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Service price', 'Enter service color'),
                                  controller: _colorController,
                                  validator: (val) {
                                    if ((val!.isEmpty)) {
                                      return "Enter car color";
                                    }
                                  },
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),


                              const SizedBox(
                                height: 10,
                              ),


                              Container(
                                child: DropdownButtonFormField<String>(
                                  decoration:
                                      ThemeHelper().textInputDecoration(),
                                  value: serviceType,
                                  items: <String>['For rent', 'For sale']
                                      .map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      serviceType = value.toString();
                                    });
                                  },
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),


                              const SizedBox(
                                height: 10,
                              ),


                              Container(
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Service price', 'Enter service price'),
                                  controller: _priceController,
                                  validator: (val) {
                                    if ((val!.isEmpty)) {
                                      return "Enter service price";
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),



                              const SizedBox(
                                height: 10,
                              ),



                              Container(
                                child: TextFormField(
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Car description',
                                      'Enter car description'),
                                  controller: _descriptionController,
                                  validator: (val) {
                                    if ((val!.isEmpty)) {
                                      return "Enter car description";
                                    }
                                  },
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),


                              SizedBox(
                                height: 10,
                              ),



                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    imageData != null
                                        ? Image.file(
                                            imageData!,
                                            width: 80,
                                            height: 80,
                                          )
                                        : Image.asset(
                                            'assets/car.png',
                                            width: 40,
                                            height: 40,
                                          ),
                                    ElevatedButton.icon(
                                      icon: const Icon(Icons.add),
                                      label: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 10, 40, 10),
                                        child: Text(
                                          "Choose image".toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        final image = await FileUtil.picImage();
                                        if (image == null) return;
                                        setState(
                                            () => imageData = File(image.path));
                                      },
                                    ),
                                  ],
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),



                              const SizedBox(height: 15.0),
                              FormField<bool>(
                                builder: (state) {
                                  return Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Checkbox(
                                              value: checkboxValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  checkboxValue = value!;
                                                  state.didChange(value);
                                                });
                                              }),
                                          const Text(
                                            "I accept all terms and conditions.",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          state.errorText ?? '',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Theme.of(context).errorColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      )
                                    ],
                                  );
                                },
                                validator: (value) {
                                  if (!checkboxValue) {
                                    return 'You need to accept terms and conditions';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              const SizedBox(height: 20.0),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: isLoading
                                    ? CircularProgressIndicator()
                                    : ElevatedButton(
                                        style: ThemeHelper().buttonStyle(),
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              40, 10, 40, 10),
                                          child: Text(
                                            "Add car".toUpperCase(),
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            isLoading = true;
                                          });
                                          if (_formKey.currentState!
                                              .validate()) {
                                            var uuid = Uuid();
                                            final downLoadUrl =
                                                await carProvider
                                                    .uploadCarImage(imageData!);
                                            if (downLoadUrl == 'Error') {
                                            } else {
                                              Document document = Document(
                                                  id: uuid.v4(),
                                                  documentId: _modelController.text,
                                                  documentType: serviceType,
                                                  image: downLoadUrl,

                                                  createdAt:  DateTime.now());


                                              final res = await 
                                                  .createCar(car);
                                              setState(() {
                                                isLoading = false;
                                              });
                                              if (res == 'Success') {

                                                Navigator.pushReplacementNamed(context, Cars.id);

                                              } else {
                                                print('Error occured');
                                              }
                                            }
                                          }
                                        },
                                      ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
