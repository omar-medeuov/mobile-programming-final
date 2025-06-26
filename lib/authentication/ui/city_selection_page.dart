import 'package:flutter/material.dart';
import 'add_product_page.dart';

class CitySelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select City'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 20),
            CityButton(city: 'Almaty', icon: Icons.location_city),
            SizedBox(height: 20),
            CityButton(city: 'Astana', icon: Icons.location_city),
            SizedBox(height: 20),
            CityButton(city: 'Shymkent', icon: Icons.location_city),
          ],
        ),
      ),
    );
  }
}

class CityButton extends StatelessWidget {
  final String city;
  final IconData icon;

  const CityButton({required this.city, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddProductPage(),
          ),
        );
      },
      icon: Icon(icon, color: Colors.grey),
      label: Text(city),
    );
  }
}
