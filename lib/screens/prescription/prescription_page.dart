import 'package:flutter/material.dart';
import 'package:blur/blur.dart';

class PrescriptionPage extends StatelessWidget {
  const PrescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/prescription_bg.jpg', fit: BoxFit.cover),

          Container(color: const Color.fromRGBO(0, 0, 0, 0.2)),

          // main content
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top blur card with "Prescription"
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Blur background
                      Blur(
                        blur: 3,
                        colorOpacity: 0.2,
                        child: Container(
                          width: double.infinity,
                          height: 80,
                          color: const Color.fromRGBO(0, 0, 0, 0.3),
                        ),
                      ),
                      // Text on top of blur
                      const Text(
                        'Prescription',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 100),

                const Text(
                  'Prescription History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Blur(
                          blur: 2,
                          colorOpacity: 0.2,
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(77, 0, 0, 0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: const [
                            DoctorTile(index: 0, name: 'Dr. Aminul Islam'),
                            SizedBox(height: 10),
                            DoctorTile(index: 1, name: 'Dr. Laila Hossain'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 20,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorTile extends StatelessWidget {
  final int index;
  final String name;
  const DoctorTile({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: const Color.fromRGBO(255, 255, 255, 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        '${index + 1}. $name',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.download_rounded, color: Colors.white),
        onPressed: () {
          // todo: download logic
        },
      ),
    );
  }
}
