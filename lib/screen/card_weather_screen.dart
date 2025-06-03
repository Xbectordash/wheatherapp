import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wheatherapp/model/weather_data_model.dart';

class WeatherCard extends StatelessWidget {
  final WeatherData data;
  const WeatherCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: screenWidth * 0.5,
        height: screenHeight * 0.4,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row: Location & Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.location!.name.toString(),
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat.jm().format(
                    DateTime.parse(data.location!.localtime ?? "2025-06-03 11:00"),
                  ),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Icon and Temperature
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  data.current!.condition!.icon.toString(),
                  height: 40,
                  width: 40,
                  color: Colors.orangeAccent,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data.current!.tempC}°C',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'RealFeel ${data.current!.feelslikeC}°C',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // RealFeel Shade
            Text(
              'RealFeel Shade™   ${data.current!.feelslikeC}°C',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 8),

            // Wind
            Text(
              'Wind                        S ${data.current!.windKph} km/h',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 8),

            // Wind Gusts
            Text(
              'Wind Gusts            ${data.current!.gustKph} km/h',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 8),

            // Condition
            Text(
              'Condition               ${data.current!.condition!.text}',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
