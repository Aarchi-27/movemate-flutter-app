import 'package:flutter/material.dart';
import 'location_screen.dart';

class VehicleSelectionScreen extends StatelessWidget {
  const VehicleSelectionScreen({super.key});

  Widget vehicleCard({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String vehicleName,
    required int fare,
    required String subtitle,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          vehicleName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Text(
          "₹$fare",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
            fontSize: 16,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LocationScreen(
                vehicleName: vehicleName,
                fare: fare,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("🚛 Select Vehicle"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2563EB),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "🚚 Choose Your Vehicle",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Select the best vehicle for your delivery",
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [

                  vehicleCard(
                    context: context,
                    icon: Icons.pedal_bike,
                    color: Colors.orange,
                    vehicleName: "🚲 Bike Delivery",
                    fare: 49,
                    subtitle: "Small packages & documents",
                  ),

                  vehicleCard(
                    context: context,
                    icon: Icons.two_wheeler,
                    color: Colors.purple,
                    vehicleName: "🛵 Scooter",
                    fare: 69,
                    subtitle: "Fast city delivery",
                  ),

                  vehicleCard(
                    context: context,
                    icon: Icons.local_shipping,
                    color: Colors.green,
                    vehicleName: "🚚 Mini Truck",
                    fare: 99,
                    subtitle: "Medium goods transport",
                  ),

                  vehicleCard(
                    context: context,
                    icon: Icons.fire_truck,
                    color: Colors.red,
                    vehicleName: "🚛 Pickup Truck",
                    fare: 149,
                    subtitle: "Heavy goods & shifting",
                  ),

                  vehicleCard(
                    context: context,
                    icon: Icons.airport_shuttle,
                    color: Colors.blueGrey,
                    vehicleName: "🚐 Tempo",
                    fare: 199,
                    subtitle: "Large cargo transport",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}