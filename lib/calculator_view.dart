import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Needed for input formatters

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {

  int x = 0;
  int y= 0;
  int z = 0;
  String operation = "";
final displayOneController = TextEditingController();
final displayTwoController = TextEditingController();



void calculate(String operation) {
    setState(() {
      // Parse input values
      x = int.tryParse(displayOneController.text) ?? 0;
      y = int.tryParse(displayTwoController.text) ?? 0;

      // Perform the calculation based on the operation
      if (operation == 'add') {
        z = x + y;
      } else if (operation == 'subtract') {
        z = x - y;
      } else if (operation == 'multiply') {
        z = x * y;
      } else if (operation == 'divide') {
        z = (y != 0) ? x ~/ y : 0; // Integer division with zero check
      }
    });
  }

void setOperation(String op) {
  setState(() {
    operation = op; // Change 'Operation' to 'operation'
  });
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          // DisplayOne widget with different hint texts
          CalculatorDisplay(hint: "Enter First Number", controller: displayOneController),
          SizedBox(height: 30), // Adding space between inputs
          CalculatorDisplay(hint: "Enter Second Number",  controller: displayTwoController),
          SizedBox(height: 30),
         // Reuse with another label 
         //if needed
         Text(z.toString(),style:TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
         )),
        
         Spacer(),

         Row(children: [
          FloatingActionButton(onPressed:() {
             calculate('add');
          },
          child:const Icon(Icons.add),
          backgroundColor: Colors.deepOrange,
          ),
          Spacer(),

           FloatingActionButton(onPressed:() {
             calculate('subtract');
           },
          child:const Icon(Icons.remove),
          backgroundColor: Colors.deepOrange,
          ),

         Spacer(),

           FloatingActionButton(onPressed:() {
             calculate('multiply');
           },
          child:const Icon(Icons.clear),
          backgroundColor: Colors.deepOrange,
          ),
        
  Spacer(),
           FloatingActionButton(onPressed:() {
             
             calculate('divide');
           },
          child:const Icon(CupertinoIcons.divide),
          backgroundColor: Colors.deepOrange,
          ),
         ],
         ),

        Spacer(),

Row(children: [
  Spacer(),
           FloatingActionButton(onPressed:() {
            calculate('equal');
           },
          child:const Icon(CupertinoIcons.equal),
          backgroundColor: Colors.deepOrange,
           ),
           Spacer(),
  ],
), 
        ],
         ),
    );
  }
}
// Example widget for DisplayOne with a hint parameter
class CalculatorDisplay extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const CalculatorDisplay({super.key, required this.hint,required  this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number, // Sets keyboard type to numbers
      autofocus: true,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly, // Ensures only digits are allowed
      ],
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
        ),
        hintText: hint, // Using hint text from the constructor
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
