import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo/screens/home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscure = true;
  bool loading = false;

  Future<void> login() async {

    try {

      setState(() {
        loading = true;
      });

      await Supabase.instance.client.auth.signInWithPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );

    } catch (e) {

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
                "Welcome Back!",
                style: TextStyle(
                  fontSize:24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
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
                    onPressed: () {
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

              const SizedBox(height:10),

              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.white70),
                ),
              ),

              const SizedBox(height:25),

              /// LOGIN BUTTON
              SizedBox(
                height:50,
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFED36A),
                  ),

                  onPressed: loading ? null : login,

                  child: loading
                      ? const CircularProgressIndicator(color: Colors.black)
                      : const Text(
                          "Log In",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize:16,
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

              /// GOOGLE BUTTON
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

              /// SIGN UP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(width:5),

                  InkWell(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, "/signup");
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFFFED36A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}