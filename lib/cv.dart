// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_cv/cv.dart';
import 'package:my_cv/home.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyCV extends StatefulWidget {
  const MyCV({super.key, required this.title});

  final String title;

  @override
  State<MyCV> createState() => _MyCVState();
}

class _MyCVState extends State<MyCV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        leading: BackButton(
            color: Colors.black,
            ),
        title: Text(
          widget.title,

          // style: Theme.of(context).textTheme.headline5,
          style: TextStyle(color: Colors.brown),
        ),
        backgroundColor: Colors.brown[100],
        elevation: 0,
        // automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.comment,
              color: Colors.brown[400],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.brown[400],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _header(),

            // SKILLS
            _buildTitle("SKILLS"),
            _buildSkill("HTML", 0.75),
            SizedBox(height: 5.0),
            _buildSkill("CSS", 0.75),
            SizedBox(height: 5.0),
            _buildSkill("Javascript", 0.75),
            SizedBox(height: 40.0),

            // EXPERIENCE
            _buildTitle("EXPERIENCE"),
            _ExperienceEducation(
              company: "Gajah Tunggal",
              position: "Web Developer",
              duration: "2022 - Unknows",
            ),
            _ExperienceEducation(
              company: "Gajah Tunggal",
              position: "Web Developer",
              duration: "2022 - Unknows",
            ),
            _ExperienceEducation(
              company: "Gajah Tunggal",
              position: "Web Developer",
              duration: "2022 - Unknows",
            ),
            SizedBox(height: 40.0),

            // EDUCATION
            _buildTitle("EDUCATION"),
            _ExperienceEducation(
              company: "SMKN 2 Bogor",
              position: "Computer Network Engineering",
              duration: "2019-2022",
            ),
            SizedBox(height: 40.0),
            _buildTitle("CONTACT"),
            Row(
              children: <Widget>[
                SizedBox(width: 25),
                IconButton(
                  onPressed: () {
                    _launchURL("mailto:ghanirauf312@gmail.com");
                  },
                  icon: const Icon(
                    FontAwesomeIcons.envelope,
                    size: 24.0,
                  ),
                ),
                // SizedBox(width: 10),
                Text(
                  "ghanirauf312@gmail.com",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                SizedBox(width: 30),
                Icon(Icons.phone),
                SizedBox(width: 10),
                Text(
                  "+6285770159432",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 25,
                ),
                IconButton(
                  onPressed: () {
                    _launchURL(
                        "https://www.linkedin.com/in/fatha-ghani-al-rauf-a86102243/");
                  },
                  icon: Icon(
                    FontAwesomeIcons.linkedin,
                    size: 24.0,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _launchURL("https://github.com/raupsss");
                  },
                  icon: Icon(
                    FontAwesomeIcons.github,
                    size: 24.0,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _launchURL("https://wa.me/6285770159432");
                  },
                  icon: Icon(
                    FontAwesomeIcons.whatsapp,
                    size: 24.0,
                    color: Colors.green,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _launchURL("https://instagram.com/ghani.ar_");
                  },
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                    size: 24.0,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ListTile _ExperienceEducation(
      {required String company, String? position, String? duration}) {
    return ListTile(
      leading: Padding(
        padding: EdgeInsets.only(top: 8.0, left: 20.0),
        child: Icon(
          Icons.computer,
          size: 24.0,
          color: Colors.brown,
        ),
      ),
      title: Text(
        company,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text("$position ($duration)"),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Divider(
            color: Colors.black54,
          ),
        ],
      ),
    );
  }

  Container _header() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.brown[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              SizedBox(
                width: 20.0,
              ),
              Container(
                width: 80.0,
                height: 80.0,
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.brown[100],
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage("assets/images/myFace.jpg"),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "FATHA GHANI AL RAUF",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "-- Junior Web Developer --",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.brown[50],
                      ),
                      Text(
                        "Bogor, Indonesia",
                        style: TextStyle(color: Colors.brown[50]),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.brown[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Have basic networking skills based on an educational background, as well as an interest in the field of Web Development, which is self-taught and accompanied by participating in various training.",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
