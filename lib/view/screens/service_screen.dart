import 'package:flutter/material.dart';

import '../widgets/curve_container.dart';

class Service extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CurvedContainer(height: 130), // Include the CurvedContainer here
          // Other widgets for the screen
        ],
      ),
    );
  }
}
