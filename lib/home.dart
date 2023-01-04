// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:my_cv/cv.dart';
import 'package:my_cv/ecommerce.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        // actions: [],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              height: 380,
              decoration: BoxDecoration(
                color: Colors.brown[200],
              ),
            ),
          ),
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: 380,
              foregroundDecoration: BoxDecoration(color: Colors.brown[400]),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(8.0),
            children: [
              SizedBox(height: 90),
              Center(
                child: Container(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100.0),
                        ),
                        child: Image.asset(
                          "assets/images/myFace.jpg",
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                "FATHA GHANI AL RAUF",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              Text(
                "Web Developer",
                style: TextStyle(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Card(
                color: Colors.brown[100],
                elevation: 0,
                margin: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 32.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "255K",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "Followers",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "105K",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              "Following",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          )
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 28.0),
        visible: true,
        curve: Curves.bounceInOut,
        tooltip: "Menu",
        children: [
          SpeedDialChild(
            child: Icon(Icons.layers_outlined, color: Colors.white),
            backgroundColor: Colors.brown[300],
            onTap: () {
              Route route = MaterialPageRoute(
                  builder: (context) => MyCV(
                        title: "About Me",
                      ));
              Navigator.push(context, route);
            },
            label: 'My CV',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.brown[400],
          ),
          SpeedDialChild(
            child: Icon(Icons.layers_outlined, color: Colors.white),
            backgroundColor: Colors.brown[300],
            onTap: () {
              Route route =
                  MaterialPageRoute(builder: (context) => ECommerceApp());
              Navigator.push(context, route);
            },
            label: 'E - Commerce',
            labelStyle:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
            labelBackgroundColor: Colors.brown[400],
          ),
        ],
      ),
    );
  }
}
