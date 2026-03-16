import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F2937),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [

              /// TOP BAR
              Row(
                children: [

                 InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },

                  child: Icon(Icons.arrow_back,color: Colors.white)),

                  const Spacer(),

                  const Text(
                    "Messages",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize:18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const Spacer(),

                  const Icon(Icons.edit_outlined,color: Colors.white)

                ],
              ),

              const SizedBox(height:20),

              /// CHAT / GROUPS
              Row(
                children: [

                  Expanded(
                    child: Container(
                      height:40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFED36A),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Chat",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width:10),

                  Expanded(
                    child: Container(
                      height:40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF374151),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "Groups",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              const SizedBox(height:20),

              /// CHAT LIST
              Expanded(
                child: ListView(
                  children: const [

                    ChatTile(
                      image: "assets/images/p1.png",
                      name: "Olivia Anna",
                      message: "Hi, please check the last task, that I...",
                      time: "31 min",
                      unread: true,
                    ),

                    ChatTile(
                      image: "assets/images/p2.png",
                      name: "Emma",
                      message: "Hi, please check the last task, that I...",
                      time: "43 min",
                      unread: true,
                    ),

                    ChatTile(
                      image: "assets/images/p3.png",
                      name: "Robert Brown",
                      message: "Hi, please check the last task, that I...",
                      time: "8 Nov",
                    ),

                    ChatTile(
                      image: "assets/images/p4.png",
                      name: "James",
                      message: "Hi, please check the last task, that I...",
                      time: "8 Dec",
                    ),

                    ChatTile(
                      image: "assets/images/p5.png",
                      name: "Sophia",
                      message: "Hi, please check the last task, that I...",
                      time: "27 Dec",
                    ),

                    ChatTile(
                      image: "assets/images/p6.png",
                      name: "Isabella",
                      message: "Hi, please check the last task, that I...",
                      time: "31 min",
                    ),

                  ],
                ),
              ),

              const SizedBox(height:10),

              /// START CHAT BUTTON
              SizedBox(
                width:200,
                height:50,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFED36A),
                  ),

                  onPressed: () {},

                  child: const Text(
                    "Start chat",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize:16,
                    ),
                  ),

                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class ChatTile extends StatelessWidget {

  final String image;
  final String name;
  final String message;
  final String time;
  final bool unread;

  const ChatTile({
    super.key,
    required this.image,
    required this.name,
    required this.message,
    required this.time,
    this.unread = false,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom:18),

      child: Row(
        children: [

          CircleAvatar(
            radius:24,
            backgroundImage: AssetImage(image),
          ),

          const SizedBox(width:12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height:4),

                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize:12,
                  ),
                ),

              ],
            ),
          ),

          Column(
            children: [

              Text(
                time,
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize:12,
                ),
              ),

              const SizedBox(height:6),

              if(unread)
                Container(
                  width:6,
                  height:6,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFED36A),
                    shape: BoxShape.circle,
                  ),
                )

            ],
          )

        ],
      ),
    );
  }
}