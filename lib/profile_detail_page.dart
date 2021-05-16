import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileDetailPage extends StatefulWidget {
  static const routeName = '/profile-detail';
  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  // final GlobalKey<FormState> _form=GlobalKey<FormState>();
  // final TextEditingController _pass=TextEditingController();
  // final TextEditingController _confirmPass=TextEditingController();
  var _enableNameField = false;
  var _enableAddressField = false;
  var _enableNumberField = false;
  var _enableEmailField = false;

  String _name = 'Kristina Neupane';
  DateTime _dob = DateTime(2000, 08, 20);
  String _address = 'Butwal, Nayagaun';
  int _phoneNumber = 9840287957;
  String _email = 'kristina@gmail.com';
  String _genderValue = 'Female';

  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime(2000, 08, 20),
      firstDate: DateTime(1910),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _dob = pickedDate;
      });
    });
  }

  void _startShowDialogue() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: AlertDialog(
              title: Column(
                children: [
                  Icon(
                    Icons.lock_open,
                    color: Colors.red,
                    size: 35.0,
                  ),
                  Text('Change'),
                  Text('Password'),
                ],
              ),
              content: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                // child: SingleChildScrollView(

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Make sure you remember password',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Current Password',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'New Password',
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    )
                  ],
                ),

                //  ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.red,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Text(
              'My account'.toUpperCase(),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..shader = ui.Gradient.linear(
                    const Offset(100, 20),
                    const Offset(400, 20),
                    <Color>[
                      Colors.red,
                      Colors.yellow,
                    ],
                  ),
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _enableNameField
                    ? SizedBox(
                        width: deviceWidth * 0.5,
                        child: TextFormField(
                          initialValue: _name,
                          autofocus: true,
                          onEditingComplete: () {
                            setState(() {
                              _enableNameField = false;
                            });
                          },
                          onFieldSubmitted: (String value) {
                            _name = value;
                          },
                          cursorColor: Colors.red,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          Text(
                            _name,
                            style: TextStyle(fontSize: 17),
                          ),
                          IconButton(
                            icon: Icon(Icons.edit),
                            color: Colors.red,
                            onPressed: () {
                              setState(() {
                                _enableNameField = true;
                              });
                            },
                          ),
                        ],
                      ),
              ],
            ),
            Divider(
              thickness: 1,
              //height: deviceHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Birthday',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      DateFormat('dd/MM/yyyy').format(_dob),
                      style: TextStyle(fontSize: 17),
                    ),
                    IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _presentDatePicker(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _enableAddressField
                    ? SizedBox(
                        width: deviceWidth * 0.5,
                        child: TextFormField(
                          initialValue: _address,
                          autofocus: true,
                          onEditingComplete: () {
                            setState(() {
                              _enableAddressField = false;
                            });
                          },
                          onFieldSubmitted: (String value) {
                            _address = value;
                          },
                          cursorColor: Colors.red,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          Text(
                            _address,
                            style: TextStyle(fontSize: 17),
                          ),
                          IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              setState(() {
                                _enableAddressField = true;
                              });
                            },
                          ),
                        ],
                      ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      _genderValue,
                      style: TextStyle(fontSize: 17),
                    ),
                    PopupMenuButton(
                        onSelected: (String selectedValue) {
                          setState(() {
                            _genderValue = selectedValue;
                          });
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.red,
                        ),
                        itemBuilder: (_) => [
                              PopupMenuItem(
                                child: Text('Male'),
                                value: 'Male',
                              ),
                              PopupMenuItem(
                                child: Text('Female'),
                                value: 'Female',
                              ),
                              PopupMenuItem(
                                child: Text('Others'),
                                value: 'Others',
                              ),
                            ])
                  ],
                ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mobile Number',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _enableNumberField
                    ? SizedBox(
                        width: deviceWidth * 0.5,
                        child: TextFormField(
                          initialValue: _phoneNumber.toString(),
                          autofocus: true,
                          onEditingComplete: () {
                            setState(() {
                              _enableNumberField = false;
                            });
                          },
                          onFieldSubmitted: (String value) {
                            _phoneNumber = int.parse(value);
                          },
                          cursorColor: Colors.red,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          Text(
                            ('$_phoneNumber'),
                            style: TextStyle(fontSize: 17),
                          ),
                          IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              setState(() {
                                _enableNumberField = true;
                              });
                            },
                          ),
                        ],
                      ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'E-mail',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _enableEmailField
                    ? SizedBox(
                        width: deviceWidth * 0.5,
                        child: TextFormField(
                          initialValue: _email,
                          autofocus: true,
                          onEditingComplete: () {
                            setState(() {
                              _enableEmailField = false;
                            });
                          },
                          onFieldSubmitted: (String value) {
                            _email = value;
                          },
                          cursorColor: Colors.red,
                          keyboardType: TextInputType.text,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 17,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      )
                    : Row(
                        children: [
                          Text(
                            _email,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontSize: 17),
                          ),
                          IconButton(
                            color: Colors.red,
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              setState(() {
                                _enableEmailField = true;
                              });
                            },
                          ),
                        ],
                      ),
              ],
            ),
            Divider(
              thickness: 1,
            ),
            Container(
              height: deviceHeight * 0.07,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.red,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Update'.toUpperCase(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: deviceHeight * 0.014,
              ),
              child: GestureDetector(
                onTap: () => _startShowDialogue(),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.02,
                    ),
                    Icon(
                      Icons.lock_open,
                      color: Colors.red,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),
            // Divider(
            //   thickness: 1,
            // ),
          ],
        ),
      ),
    );
  }
}
