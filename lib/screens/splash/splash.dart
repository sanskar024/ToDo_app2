import 'package:flutter/material.dart';
import 'package:todo/screens/home_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E), // dark background

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              /// Logo Row
              Image.asset(
                "assets/images/logo.png",
                
              ),
              
             
              
              

              const SizedBox(height: 30),

              /// Illustration
              Center(
  child: Stack(
    alignment: Alignment.center,
    children: [

      /// White background card
      Container(
        width: 260,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
      ),

      /// Illustration image on top
      Image.asset(
        "assets/images/pana.png",
        width: 200,
        height: 230,
      ),

    ],
  ),
),

              const SizedBox(height: 10),

              /// Heading
              RichText(
                text: const TextSpan(
                  children: [

                    TextSpan(
                      text: "Manage\n your\nTask with\n",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    TextSpan(
                      text: "DayTask",
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF4C95D),
                      ),
                    ),

                  ],
                ),
              ),

              const Spacer(),

              /// Button
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF4C95D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Let's Start",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30)

            ],
          ),
        ),
      ),
    );
  }
}