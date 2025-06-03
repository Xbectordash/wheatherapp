import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheatherapp/bloc/weather_bloc.dart';
import 'package:wheatherapp/bloc/weather_event.dart';
import 'package:wheatherapp/bloc/weather_state.dart';
import 'package:wheatherapp/const/constdata.dart';
import 'package:wheatherapp/screen/card_weather_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Whetherlanding extends StatefulWidget {
  const Whetherlanding({super.key});

  @override
  State<Whetherlanding> createState() => _WhetherlandingState();
}

class _WhetherlandingState extends State<Whetherlanding> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "🌤️ Weather Search 🔍",
          style: GoogleFonts.marcellus(
            
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFF202125),
            ),
          ),
        ),
      ),

      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitiate) {
            return Center(
              child: Container(
                width: screenWidth * 0.5,
                height: screenHeight * 0.8,
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(left: 10, top: 12, bottom: 24),
                
              
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFFFFFF), // pure white
                      Color.fromARGB(255, 246, 245, 245), // very light grey
                      Color.fromARGB(255, 239, 238, 238), // soft silver
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: Colors.grey.shade700),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.3), // 👈 updated
                      offset: Offset(4, 6),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      "🌍 Search any city in the world 🌤️ and stay updated with the latest weather instantly ☀️ !",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.marcellus(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey.shade800,
                        letterSpacing: 0.5,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 100),
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Search weather in your city",
                        hintStyle: GoogleFonts.dmSans(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(Icons.location_city),
                      ),
                    ),
              
                    SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<WeatherBloc>(context).add(
                          Weatherreq(
                            uri: Constdata().api,
                            key: Constdata().apiKey,
                            location: _controller.text,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent, // button color
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 6,
                        shadowColor: Colors.black45,
                      ),
                      child: Text(
                        "Check Weather",
                        style: GoogleFonts.dmSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
              
                    Spacer(),
                  ],
                ),
              ),
            );
          } else if (state is WeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoaded) {
            return Center(
              // child: Text('data: ${state.resData!.current!.condition!.text}'),
              child: WeatherCard(data: state.resData!),
            );
          } else if (state is WeatherError) {
            return Center(
              child: Text('error mog: ${state.errorMsg.toString()}'),
            );
          } else {
            return Container(color: Colors.amber, child: Text("klklklklkl"));
          }
        },
      ),
    );
  }
}
