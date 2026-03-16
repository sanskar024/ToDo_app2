import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/screens/home_screen.dart';
import 'package:todo/screens/login_page.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscure = true;
  bool loading = false;
  bool agree = false;

  Future<void> signUp() async {

    if(!agree){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please accept Terms & Conditions")),
      );
      return;
    }

    try {

      setState(() {
        loading = true;
      });

      await Supabase.instance.client.auth.signUp(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),

        data: {
          "name": nameController.text.trim(),
        },
      );

      if(!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );

    } catch(e){

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );

    }

    setState(() {
      loading = false;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF1F2937),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: ListView(
            children: [

              const SizedBox(height:40),

              /// LOGO
              Center(
                child: Column(
                  children: [

                    Image.asset(
                      "assets/images/logo.png",
                      height:70,
                    ),

                    const SizedBox(height:10),

                    const Text(
                      "DayTask",
                      style: TextStyle(
                        fontSize:26,
                        color:Color(0xFFFED36A),
                        fontWeight:FontWeight.bold,
                      ),
                    )

                  ],
                ),
              ),

              const SizedBox(height:40),

              const Text(
                "Create your account",
                style: TextStyle(
                  fontSize:24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height:20),

              /// NAME
              const Text(
                "Full Name",
                style: TextStyle(color: Colors.white70),
              ),

              const SizedBox(height:8),

              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF455A64),

                  prefixIcon: const Icon(
                    Icons.person_outline,
                    color: Colors.white70,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height:20),

              /// EMAIL
              const Text(
                "Email Address",
                style: TextStyle(color: Colors.white70),
              ),

              const SizedBox(height:8),

              TextField(
                controller: emailController,
                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF455A64),

                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.white70,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height:20),

              /// PASSWORD
              const Text(
                "Password",
                style: TextStyle(color: Colors.white70),
              ),

              const SizedBox(height:8),

              TextField(
                controller: passwordController,
                obscureText: obscure,
                style: const TextStyle(color: Colors.white),

                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF455A64),

                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: Colors.white70,
                  ),

                  suffixIcon: IconButton(
                    icon: Icon(
                      obscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white70,
                    ),
                    onPressed: (){
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height:15),

              /// TERMS
              Row(
                children: [

                  Checkbox(
                    value: agree,
                    onChanged: (v){
                      setState(() {
                        agree = v!;
                      });
                    },
                    activeColor: const Color(0xFFFED36A),
                  ),

                  const Expanded(
                    child: Text(
                      "I have read & agreed to DayTask Privacy Policy, Terms & Condition",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize:12,
                      ),
                    ),
                  )

                ],
              ),

              const SizedBox(height:15),

              /// SIGNUP BUTTON
              SizedBox(
                height:50,
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFED36A),
                  ),

                  onPressed: loading ? null : signUp,

                  child: loading
                      ? const CircularProgressIndicator(color: Colors.black)
                      : InkWell(
                        onTap: (){
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:16,
                            ),
                          ),
                      ),
                ),
              ),

              const SizedBox(height:30),

              /// OR
              const Row(
                children: [

                  Expanded(child: Divider(color: Colors.white54)),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:10),
                    child: Text(
                      "Or continue with",
                      style: TextStyle(color: Colors.white54),
                    ),
                  ),

                  Expanded(child: Divider(color: Colors.white54)),

                ],
              ),

              const SizedBox(height:20),

              /// GOOGLE
              Container(
                height:50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70),
                  borderRadius: BorderRadius.circular(10),
                ),

                child: const Center(
                  child: Text(
                    "Google",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height:30),

              /// LOGIN
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(width:5),

                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        color: Color(0xFFFED36A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}