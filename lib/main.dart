// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'About Me'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        // title: Text(
        //   widget.title,
        //   style: Theme.of(context).textTheme.headline4,
        // ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.brown[400],
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _header(),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."),
            ),
            _buildTitle("SKILLS"),
            SizedBox(height: 10.0),
            _buildSkill("HTML", 0.75),
            SizedBox(height: 5.0),
            _buildSkill("CSS", 0.75),
            SizedBox(height: 5.0),
            _buildSkill("Javascript", 0.75),
            SizedBox(height: 20.0),
            _buildTitle("EXPERIENCE"),
            SizedBox(height: 10.0),
            ListTile(
              leading: Padding(
                padding: EdgeInsets.only(top: 8.0, left: 20.0),
                child: Icon(
                  Icons.work,
                  size: 24.0,
                  color: Colors.black,
                ),
              ),
              title: Text(
                "Company",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildTitle("EDUCATION"),
            _buildTitle("SOCIALS"),
          ],
        ),
      ),
    );
  }

  Row _buildSkill(String skill, double level) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            skill,
            textAlign: TextAlign.right,
          ),
        ),
        SizedBox(width: 10.0),
        Expanded(
          child: LinearProgressIndicator(value: level),
          flex: 4,
        ),
        SizedBox(width: 20.0)
      ],
    );
  }

  Padding _buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Row _header() {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 20.0,
        ),
        Container(
          width: 80.0,
          child: Image.asset(
            "assets/images/myFace.jpg",
            width: 64.0,
            height: 64.0,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Fatha Ghani Al Rauf",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Web Developer"),
            Row(
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                Text(
                  "Bogor, Indonesia",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
