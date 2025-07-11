// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController controller;
  final List<Map<String, dynamic>> hourlyData = [
    {'time': '1 PM', 'temp': 29, 'icon': 'assets/weather/sunny.json'},
    {'time': '2 PM', 'temp': 30, 'icon': 'assets/weather/sunny.json'},
    {'time': '3 PM', 'temp': 31, 'icon': 'assets/weather/thunder.json'},
    {'time': '4 PM', 'temp': 28, 'icon': 'assets/weather/shower.json'},
    {'time': '5 PM', 'temp': 27, 'icon': 'assets/weather/windy.json'},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = VideoPlayerController.asset('assets/images/rain.mp4')
      ..initialize().then((_) {
        controller.setLooping(true);
        controller.setVolume(0); // Mute the video
        controller.setPlaybackSpeed(0.65);
        controller.play(); // Auto-play
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? Stack(
            children: [
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: controller.value.size.width,
                    height: controller.value.size.height,
                    child: VideoPlayer(controller),
                  ),
                ),
              ),

              Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 60, left: 8, right: 12),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 190,
                                height: 244,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 12,
                                      sigmaY: 12,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Colors.white.withOpacity(0.12),
                                            Colors.white.withOpacity(0.08),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.15),
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              /// Weather icon
                              Positioned(
                                top: 2,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: SizedBox(
                                    width: 120,
                                    height: 120,
                                    child: Lottie.asset(
                                      'assets/weather/thunder.json',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),

                              /// Location name
                              Positioned(
                                top: 102,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Text(
                                    "Kottathala",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ),

                              /// Weather condition
                              Positioned(
                                top: 128,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Text(
                                    "Thunder",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white.withOpacity(0.9),
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                ),
                              ),

                              /// Temperature
                              Positioned(
                                top: 142,
                                left: 0,
                                right: 0,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "22",
                                          style: TextStyle(
                                            fontSize: 48,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            "°",
                                            style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white.withOpacity(
                                                0.9,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Feels like 24°",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// Bottom bar
                              Positioned(
                                bottom: 8,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Container(
                                    height: 3,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // You can add more weather cards here for scrolling
                          const SizedBox(height: 120),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: hourlyData.length,
                              itemBuilder: (context, index) {
                                final hour = hourlyData[index];
                                return Padding(
                                  padding: (EdgeInsets.all(8)),
                                  child: Container(
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.1),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          hour['time'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: Lottie.asset(
                                            hour['icon'],
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          '${hour['temp']}°',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : const Center(child: CircularProgressIndicator());
  }
}
