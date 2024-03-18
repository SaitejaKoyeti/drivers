import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_registration/driver_login.dart';
import '../profile/aboutpage.dart';
import '../profile/help.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _showAnimation = false;
  String userName = '';
  String phoneNumber = '';


  @override
  void initState() {
    super.initState();

    fetchDriverData();
    Future.delayed(Duration(milliseconds: 15), () {
      setState(() {
        _showAnimation = true;
      });
    });
  }
  Future<void> fetchDriverData() async {
    // Get the current user
    User? driver = FirebaseAuth.instance.currentUser;

    if (driver != null) {
      // Get user document from Firestore based on phone number
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('Driver')
          .where('phone_number', isEqualTo: driver.phoneNumber)
          .get();

      // Check if any documents match the query
      if (querySnapshot.docs.isNotEmpty) {
        // Assuming phone number is unique, there should only be one document
        DocumentSnapshot driverDoc = querySnapshot.docs.first;

        // Extract user data from the document
        Map<String, dynamic>? driverData = driverDoc.data() as Map<String, dynamic>?;

        if (driverData != null) {
          if (driverData.containsKey('name')) {
            setState(() {
              userName = driverData['name'];
            });
          }
          if (driverData.containsKey('phone_number')) {
            setState(() {
              phoneNumber = driverData['phone_number'];
            });
          }
        } else {
          // Handle the case where driverData is null
          print('Driver data is null.');
        }
      } else {
        // Handle the case where no documents match the query
        print('No driver document found for the current user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 5)),
              CircleAvatar(
                radius: 25, // Adjust the radius as needed
                backgroundColor: Colors.orange[200], // Set background color if needed
                child: Icon(
                  Icons.person, // Specify the icon you want to use
                  size: 25, // Adjust the size of the icon as needed
                  color: Colors.white, // Set the color of the icon
                ),
              ),
              SizedBox(width: 10,),

              Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$userName',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '$phoneNumber',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),


          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [

                SizedBox(height: 20),
                buildListItem(
                  icon: Icons.notifications_none,
                  title: 'Notifications',
                  color: Colors.orangeAccent,
                  onTap: () {

                  },
                ),
                SizedBox(height: 20),
                buildListItem(
                  icon: Icons.help_outline,
                  title: 'Help',
                  color: Colors.orangeAccent,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>HelpPage()));

                  },
                ),
                SizedBox(height: 20),
                buildListItem(
                  icon: Icons.info_outline,
                  title: 'About Us',
                  color: Colors.orangeAccent,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>AboutPage()));

                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5,left: 5,bottom: 15),
            child: SizedBox(
               width: double.infinity,
              child: ElevatedButton(
               style: ButtonStyle(
               elevation: MaterialStateProperty.all<double>(5.0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                 ),
                backgroundColor:
               MaterialStateProperty.resolveWith<Color>(
                   (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                return Colors.orangeAccent;
                }
               return Colors.grey.shade500;
                 },
                 ),
                ),
                   onPressed: () async {
                     // Clear user session
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                     await prefs.remove('isLoggedIn');

                 // Navigate to login screen
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginScreen(onLogin: () {  }, phoneNumber: '',)));
                },

              child: Text(
                   "Logout",
                 style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _navigateToPage(Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 800),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            ),
            child: page,
          );
        },
      ),
    );
  }

  Widget buildListItem({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      height: _showAnimation ? 50 : 0,
      child: ClipPath(
        clipper: ShapeClipper(),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange.shade200, Colors.orange.shade400],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListTile(
            onTap: onTap,
            contentPadding: EdgeInsets.only(left: 10),
            leading: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width - 20, 0.0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

