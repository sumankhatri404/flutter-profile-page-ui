import 'package:flutter/material.dart';
import 'package:profilepage/profile_detail_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final color = Theme.of(context).colorScheme.primary;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: BackButton(),
        
        // actions: [
        //   IconButton(
        //     // Setting Icon  Button
        //     icon: Icon(Icons.settings),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Center(
                        child: ClipOval(
                          child: Material(
                              child: Image.network(
                            items[index]['image'],
                            fit: BoxFit.cover,
                            height: height * 0.2,
                            width: width * 0.4,
                          )),
                        ),
                      ),
                      Positioned(
                        bottom: height * 0,
                        right: width * 0.3,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 25,
                          child: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfileDetailPage()));
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(items[index]['name']),
                      Divider(
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(items[index]['email']),
                      Divider(
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(items[index]['address']),
                      Divider(
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(items[index]['phone'].toString()),
                      Divider(
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(items[index]['dob'].toString()),
                      Divider(
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(items[index]['gender']),
                    ],
                  );
                }),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("logout"),
            )
          ],
        ),
      ),
    );
  }
}

var items = [
  {
    'image':
        'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
    'name': 'suman khatri',
    'email': 'sumanKhatri@gmail.com',
    'address': 'butwal',
    'phone': 9811536075,
    'gender': 'male',
    'dob': '2055 - 01 - 01',
  },
];
