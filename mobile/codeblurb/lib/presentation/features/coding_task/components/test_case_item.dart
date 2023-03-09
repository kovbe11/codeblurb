import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestCaseItem extends StatelessWidget {
  const TestCaseItem({
    super.key,
    required this.testName,
    required this.isSuccessful,
    this.hasDetails = true,
  });

  final bool isSuccessful;
  final String testName;
  final bool hasDetails;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !hasDetails,
      child: ExpansionTile(
        trailing: !hasDetails ? const SizedBox() : null,
        title: Row(
          children: [
            isSuccessful
                ? DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.green.shade700.withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.check,
                        color: Colors.greenAccent.shade100,
                        size: 15,
                      ),
                    ),
                  )
                : DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.red.shade700.withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        color: Colors.redAccent.shade100,
                        Icons.close,
                        size: 15,
                      ),
                    ),
                  ),
            const SizedBox(width: 10),
            Text(
              testName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("Input"),
                const SizedBox(height: 6),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 172, 200, 244)
                        .withOpacity(0.4),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 4,
                      bottom: 4,
                    ),
                    child: Text('No Input'),
                  ),
                ),
                const SizedBox(height: 15),
                const Text("Your Output"),
                const SizedBox(height: 6),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      top: 4,
                      bottom: 4,
                    ),
                    child: Text(
                      'Hello, World!',
                      style: GoogleFonts.firaCode(),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Text("Expected Output"),
                const SizedBox(height: 6),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 172, 200, 244)
                        .withOpacity(0.4),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 4,
                      bottom: 4,
                    ),
                    child: Text('Java is great'),
                  ),
                ),
                const SizedBox(height: 25)
              ],
            ),
          )
        ],
      ),
    );
  }
}
