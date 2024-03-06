// import 'package:flutter/material.dart';
// class ServicesPage extends StatefulWidget {
//   const ServicesPage({super.key});
//
//   @override
//   State<ServicesPage> createState() => _ServicesPageState();
// }
//
// class _ServicesPageState extends State<ServicesPage> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<Service> services = [
    Service(
      title: 'Taxi Service',
      description:
      'Get a taxi whenever and wherever you need it. Safe and reliable transportation.',
      icon: FontAwesomeIcons.taxi,
      iconBackgroundColor: Colors.blue[400],
    ),
    Service(
      title: 'Food Delivery',
      description:
      'Order food from your favorite restaurants and get it delivered to your doorstep.',
      icon: FontAwesomeIcons.pizzaSlice,
      iconBackgroundColor: Colors.orange[600],
    ),
    Service(
      title: 'Parcel Delivery',
      description:
      'Send and receive parcels quickly and efficiently. Track your package in real-time.',
      icon: FontAwesomeIcons.box,
      iconBackgroundColor: Colors.green,
    ),
    Service(
      title: 'Grocery Delivery',
      description:
      'Have your groceries delivered to your home. Choose from a wide selection of fresh produce.',
      icon: FontAwesomeIcons.shoppingBag,
      iconBackgroundColor: Colors.purple[400],
    ),
  ];

  @override
  Widget _buildServiceCard(BuildContext context, Service service) {
    List<Color> backgroundColors = [
      Colors.blue[300]!,
      Colors.orange[600]!,
      Colors.green[400]!,
      Colors.purple[300]!,
    ];

    int index = services.indexOf(service) % backgroundColors.length;

    return GestureDetector(
      onTap: () {
        print('Tapped on ${service.title}');
      },
      child: Card(
        margin: EdgeInsets.all(8.0),
        elevation: 4.0,
        color: backgroundColors[index],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: service.iconBackgroundColor,
                ),
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  service.icon,
                  size: 48.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      service.description,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Set app bar background color to white
        iconTheme: IconThemeData(color: Colors.black), // Set icon color to black
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
        title: Text(
          'Services',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black, // Set title color to black
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: services.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildServiceCard(context, services[index]);
        },
      ),
    );
  }
}

class Service {
  final String title;
  final String description;
  final IconData icon;
  final Color? iconBackgroundColor;

  Service({
    required this.title,
    required this.description,
    required this.icon,
    this.iconBackgroundColor,
  });
}

void main() {
  runApp(MaterialApp(
    home: ServicesPage(),
  ));
}
