import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Contact Information', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.deepOrange),),
            Text(' Make your supply chain more efficient. Contact us right now for excellent logistics and transportation!'),
            Text('Company Mail', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.deepOrange),),
            Text('info@transmaa.com'),
            Text('Office Phone Number', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.deepOrange),),
            Text('7026943777'),
            Text('9108883777'),
            Text('Office Location', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.deepOrange),),
            Text('278/14 parimala nagara, opp SBI Bank, Arishinakunte, kasaba Hobli, Nelamangala Taluk, Bangalore Rural-562123'),
            Text(''),
          ],
        ),
      ),
    );
  }
}
