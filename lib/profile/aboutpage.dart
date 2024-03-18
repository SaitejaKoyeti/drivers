import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Container(
                child: Image.asset(
                  'assets/Finallogo.png',
                  fit: BoxFit.cover,
                  height: 45,
                  width: 161,
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text('Transmaa provides a wide range of services, such as load management, upfront pricing, on-time delivery, insurance and guarantee, and support for global logistics to provide smooth transportation solutions everywhere.'),
            Text('Load', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.deepOrange),),
            Text('Transmaa effective load management, which offers a range of services from logistics planning to real-time tracking, guarantees safe and timely delivery.'),
            Text("Transmaa is an expert in load management, making sure that cargo transportation is a dependable and smooth operation. Our wide range of services, which include logistical planning, real-time tracking, and exact delivery, meet the various needs of our clients. Regardless of the complexity of the supply chain activities or the short distances items must travel, Transmaa dedication to quality ensures that every cargo arrives at its destination promptly and safely.With an emphasis on accuracy and customer satisfaction, Transmaa has emerged as a reliable player in the logistics industry. Our load management services go beyond simple transportation; we plan an efficient workflow, utilizing knowledge and technology to maximize productivity and improve our clients’ supply chain experiences in general."),
            Text('Vehicle Buy & Sell', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.deepOrange),),
            Text('Transmaa simplifies ethical transactions by promoting transparent connections in a productive marketplace for buying and selling.'),
            Text("Transmaa services specifically designed for the trucking business are revolutionizing the buying and selling of vehicles. Truck buyers and sellers can transact in an open and effective market with our all-inclusive vehicle buying and selling services. Transmaa makes it easy to interact with people in a fair and competitive atmosphere, whether you’re trying to expand your fleet or find the right buyer for your vehicles.Truck owners may rely on Transmaa for a simple truck purchase or sale. Our website not only simplifies transactions, but it also offers a varied selection of vehicles for sale, guaranteeing that buyers discover the best fit for their needs and sellers enjoy fair and ethical transactions. Transmaa makes the vehicle buying and selling process simpler, more transparent, and tailored to the trucking industry’s specific needs."),
            Text('Insurance', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.deepOrange),),
            Text('With our all-inclusive insurance, which covers every stage of transportation and successfully reduces risks for asset protection, you can feel safe.'),
            Text("Transmaa takes delight in providing a complete range of insurance services to meet every need of the transportation business. Our Vehicle Insurance services cover your most precious assets, whether they are individual vehicles or a fleet. With an emphasis on risk reduction, our insurance solutions give you peace of mind by covering every part of your vehicle, from standard travel insurance for individual drivers to specialized coverage for trucks used in transportation and logistics.Transmaa goes beyond typical insurance offers, creating specialized solutions to address the transportation sector’s particular difficulties. Our Truck Insurance services are designed to secure your business from unforeseen dangers, ensuring that your activities continue smoothly even in the face of unexpected circumstances. Trust Transmaa to provide comprehensive insurance coverage, letting you to drive with confidence knowing that your vehicles and business are covered."),
            Text('Finance', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.deepOrange),),
            Text('Transmaa drives transportation industry growth by providing specialized financial services ranging from working capital to fleet expansion support.'),
            Text("Transmaa is your trusted financial services partner, providing a variety of options to help you navigate your financial path. Our Financial Planning Services offer specialized methods to people and organizations to ensure good financial health. Transmaa provides experienced personal finance advice and complete investment solutions to help you make informed decisions that correspond with your goals.Navigating the complexity of finance can be difficult, but with Transmaa, you have access to dedicated financial planning professionals who will walk you through each step. Whether you need personal finance guidance or strategic insights for corporate investments, Transmaa is dedicated to your financial success. Trust us to be your partner in achieving a secure and profitable financial future."),
            Text('Fuel', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.deepOrange),),
            Text('Transmaa new fuel Services provide ease and accessibility by cooperating with all fuel pumps across India for smooth fueling experiences.'),

            Text("Transmaa is happy to present our innovative “Fuel Services,” which will revolutionize the transportation sector. Our Fuel Services provide unmatched accessibility and convenience for all of your fueling requirements by working with every fuel pump in India. We recognize the vital role fuel plays in operations as a top logistics provider. In addition to our reliable transportation and logistics, Transmaa new Fuel Services guarantee a smooth fueling experience while maximizing procurement and skillfully controlling expenses. Transmaa is your reliable partner for all-inclusive solutions; come experience the fueling of the future with us.With Transmaa Fuel Services, you may achieve new heights of effectiveness and affordability. To revolutionize your fueling experience, we have carefully chosen to collaborate with every petrol pump in India. Our Fuel Services, which include real-time cost control and efficient procurement, are made to satisfy the needs of the dynamic transportation industry. You can rely on Transmaa to transform your fueling experience by providing accessibility and convenience at every stop. Transmaa, where innovation meets efficiency, can help you succeed."),

          ],

        ), ),
      )
    );
  }
}
