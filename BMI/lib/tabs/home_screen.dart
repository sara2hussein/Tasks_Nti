import 'package:creativa/tabs/screen2.dart';
import 'package:creativa/widgets/button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const String routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedGender;

  void selectGender(String gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFFB534),
                ),
              ),
              SizedBox(width: 8),
              Text(
                "Calculator",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF65B741),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Please choose your gender",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0A1207),
            ),
          ),
          SizedBox(height: 20),
          buildGenderCard(label: "Male", imagePath: 'assets/images/b.png'),
          SizedBox(height: 10),
          buildGenderCard(label: "Female", imagePath: 'assets/images/g.png'),
          SizedBox(height: 30),
          EButton(
            onpressed: () {
              Navigator.pushNamed(context, Screen2.routeName);
            },
            text: "Continue",
          ),
        ],
      ),
    );
  }

  Widget buildGenderCard({required String label, required String imagePath}) {
    bool isSelected = selectedGender == label;
    return Stack(
      children: [
        InkWell(
          onTap: () => selectGender(label),
          borderRadius: BorderRadius.circular(50),
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: label == "Male" ? Color(0xFFF0F8EC) : Color(0xFFFBF6EE),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color:
                    isSelected ? const Color(0xFF65B741) : Colors.transparent,
                width: 3,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  offset: Offset(0, 2),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color:
                        isSelected
                            ? const Color(0xFF65B741)
                            : const Color(0xFFCE922A),
                  ),
                ),
                Image.asset(imagePath),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
