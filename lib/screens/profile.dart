import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Supabase.instance.client.auth.currentUser;

    String name = user?.userMetadata?['name'] ?? "User";
    String email = user?.email ?? "";

    return Scaffold(
      backgroundColor: const Color(0xFF1F2937),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              /// TOP BAR
              Row(
                children: [

                  IconButton(
                    icon: const Icon(Icons.arrow_back,color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width:40)

                ],
              ),

              const SizedBox(height:20),

              /// PROFILE IMAGE
              Stack(
                children: [

                  const CircleAvatar(
                    radius: 46,
                    backgroundImage:
                        AssetImage("assets/images/profilepic.png"),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(Icons.edit,size:16),
                      ),
                    ),
                  )

                ],
              ),

              const SizedBox(height:30),

              /// NAME
              profileTile(
                Icons.person_outline,
                name,
              ),

              const SizedBox(height:15),

              /// EMAIL
              profileTile(
                Icons.mail_outline,
                email,
              ),

              const SizedBox(height:15),

              /// PASSWORD
              profileTile(
                Icons.lock_outline,
                "********",
              ),

              const SizedBox(height:15),

              /// MY TASKS
              dropdownTile("My Tasks"),

              const SizedBox(height:15),

              /// PRIVACY
              dropdownTile("Privacy"),

              const SizedBox(height:15),

              /// SETTINGS
              dropdownTile("Setting"),

              const Spacer(),

              /// LOGOUT BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFED36A),
                  ),

                  onPressed: () async {

                    await Supabase.instance.client.auth.signOut();

                    Navigator.pushReplacementNamed(context, "/login");

                  },

                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  /// PROFILE FIELD
  Widget profileTile(IconData icon,String text) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal:16,vertical:14),

      decoration: BoxDecoration(
        color: const Color(0xFF455A64),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [

          Icon(icon,color:Colors.white70),

          const SizedBox(width:12),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),

          const Icon(Icons.edit,color:Colors.white70)

        ],
      ),
    );
  }

  /// DROPDOWN TILE
  Widget dropdownTile(String text) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal:16,vertical:14),

      decoration: BoxDecoration(
        color: const Color(0xFF455A64),
        borderRadius: BorderRadius.circular(10),
      ),

      child: Row(
        children: [

          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ),

          const Icon(Icons.keyboard_arrow_down,color:Colors.white)

        ],
      ),
    );
  }
}