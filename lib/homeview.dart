import 'package:flutter/material.dart';
import 'calculator_view.dart'; // Ensure this import matches the actual file location

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.deepOrange, // AppBar background color
      ),
      
 body: ClipRRect(
        borderRadius: BorderRadius.circular(40.0), // Set the curvature here
        child: Container(
          color: Colors.white, 
      
      child: const SafeArea(
        child: CalculatorView(), // Ensure CalculatorView is properly imported and defined
      ),
    ),
 ),
    );
  }
}





