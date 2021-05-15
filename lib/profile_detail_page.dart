import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileDetailPage extends StatefulWidget {
  static const routeName = '/profile-detail';
  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
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

  Widget _buildContainer(
      double height, double width, String text, IconData icon) {
    return Container(
      height: height * 0.08,
      width: width * 0.8,
      margin: EdgeInsets.only(
        top: height * 0.014,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.red,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              icon,
              color: Colors.red,
              size: 30,
            ),
          ),
          SizedBox(
            width: width * 0.6,
            child: TextField(
              obscureText: true,
              cursorColor: Colors.red,
              style: TextStyle(
                color: Colors.red,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: height * 0.03,
                ),
                labelText: text,
                labelStyle: TextStyle(
                  color: Colors.red,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _presentDatePicker(BuildContext context) {
    showDatePicker(
      // builder: (BuildContext context, Widget? child) {
      //   return Theme(
      //       data: ThemeData.light().copyWith(
      //         colorScheme: ColorScheme.light().copyWith(
      //           primary: Colors.red,
      //         ),
      //       ),
      //       child: child);
      // },
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

  void _startChangePassword(BuildContext ctx, double height, double width) {
    showModalBottomSheet(
      context: ctx,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (_) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.028,
              ),
              Icon(
                Icons.lock_open,
                color: Colors.red,
                size: 50,
              ),
              SizedBox(
                height: height * 0.007,
              ),
              Text(
                'Change',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: height * 0.017,
              ),
              Text(
                'Make sure you remember your password',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: height * 0.007,
              ),
              _buildContainer(
                  height, width, 'Your current password', Icons.lock),
              _buildContainer(height, width, 'Your new password', Icons.lock),
              _buildContainer(
                  height, width, 'Confirm password', Icons.lock_outline),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: height * 0.014,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text(
                    'Done'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: width * 0.085)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.red,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.2),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
                      icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.red,
            ),
            onPressed: (){
              Navigator.pop(context);
            },
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
                onTap: () => _startChangePassword(
                  context,
                  deviceHeight,
                  deviceWidth,
                ),
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
