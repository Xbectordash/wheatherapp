import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:wheatherapp/model/responseModel.dart';

class WeatherCard extends StatelessWidget {
  final ResponseData data;
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
        child: Stack(
          children: [
            // Time
            Positioned(
              top: 0,
              right: 0,
              child: Text(
                DateFormat.jm().format(
                  DateTime.parse(
                    data.location!.localtime ?? "2025-06-03 11:00",
                  ),
                ),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Header
            Positioned(
              top: 0,
              left: 0,
              child: Text(
                data.location!.name.toString().toString(),
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Temperature & Icon
            Positioned(
              top: 40,
              left: 0,
              child: Row(
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
                        'RealFeel ${data.current!.feelslikeC}°',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // RealFeel Shade
            Positioned(
              top: 110,
              left: 0,
              child: Text(
                'RealFeel Shade™   ${data.current!.feelslikeC}°',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            // Wind
            Positioned(
              top: 140,
              left: 0,
              child: Text(
                'Wind                        S ${data.current!.windKph} km/h',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            // Wind Gusts
            Positioned(
              top: 170,
              left: 0,
              child: Text(
                'Wind Gusts            ${data.current!.gustKph} km/h',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
            // Contiotion
            Positioned(
              top: 200,
              left: 0,
              child: Text(
                'Condition               ${data.current!.condition!.text}',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
