import 'dart:ffi';

import 'package:flutter/material.dart';

var mainBlue = const Color(0xFF267EBE);
var secondaryBlue = const Color(0xFF408DC5);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlue,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  // Greeting
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hi, Virgy',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            '15 November, 2022',
                            style: TextStyle(
                              color: Colors.blue[200],
                            ),
                          )
                        ],
                      ),

                      // notification
                      Container(
                        decoration: BoxDecoration(
                          color: secondaryBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  // Search bar
                  Container(
                    decoration: BoxDecoration(
                      color: secondaryBlue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Search',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  // How do you feel
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'How do you feel?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 24,
                  ),

                  // 4 emot
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      EmoticonFace(emoticon: '😔', emotDesc: 'Badly'),
                      EmoticonFace(emoticon: '😊', emotDesc: 'Fine'),
                      EmoticonFace(emoticon: '😁', emotDesc: 'Well'),
                      EmoticonFace(emoticon: '😃', emotDesc: 'Excellent'),
                    ],
                  ),
                ],
              ),
            ),

            // Bottom expanded view
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    // Capsule icon
                    Container(
                      height: 8,
                      width: 48,
                      margin: const EdgeInsets.only(bottom: 24),
                      decoration: BoxDecoration(
                        color: const Color(0xFFC8DBF8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Excercises',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.more_horiz)
                      ],
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    // Exercises list
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        children: const [
                          ExerciseBox(
                            icon: Icons.favorite,
                            iconColor: Color(0xFFF78556),
                            exerciseName: 'Speaking sklils',
                            exerciseDesc: '16 Exercises',
                          ),
                          ExerciseBox(
                            icon: Icons.person,
                            iconColor: Color(0xFF297FBE),
                            exerciseName: 'Reading speed',
                            exerciseDesc: '8 Exercises',
                          ),
                          ExerciseBox(
                            icon: Icons.people,
                            iconColor: Color(0xFFFA5A7D),
                            exerciseName: 'Listening sklils',
                            exerciseDesc: '7 Exercises',
                          ),
                          ExerciseBox(
                            icon: Icons.favorite,
                            iconColor: Color(0xFFF78556),
                            exerciseName: 'Speaking sklils',
                            exerciseDesc: '16 Exercises',
                          ),
                          ExerciseBox(
                            icon: Icons.favorite,
                            iconColor: Color(0xFFF78556),
                            exerciseName: 'Speaking sklils',
                            exerciseDesc: '16 Exercises',
                          ),
                          ExerciseBox(
                            icon: Icons.favorite,
                            iconColor: Color(0xFFF78556),
                            exerciseName: 'Speaking sklils',
                            exerciseDesc: '16 Exercises',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable emoticon with rounded square background
class EmoticonFace extends StatelessWidget {
  final String emoticon;
  final String emotDesc;
  const EmoticonFace({
    super.key,
    required this.emoticon,
    required this.emotDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: secondaryBlue,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            emoticon,
            style: const TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          emotDesc,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

// Exercise box
class ExerciseBox extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String exerciseName;
  final String exerciseDesc;
  const ExerciseBox({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.exerciseName,
    required this.exerciseDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFAFAFA),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: iconColor,
            ),
            padding: const EdgeInsets.all(12),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exerciseName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(exerciseDesc),
            ],
          ),
          const Spacer(),
          const Icon(Icons.more_horiz),
        ],
      ),
    );
  }
}
