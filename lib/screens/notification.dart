import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF1F2937),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                children: [

                  IconButton(
                    icon: const Icon(Icons.arrow_back,color: Colors.white),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "Notifications",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize:18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width:40)

                ],
              ),

              const SizedBox(height:20),

              /// NEW
              const Text(
                "New",
                style: TextStyle(
                  color: Colors.white,
                  fontSize:18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height:10),

              const NotificationTile(
                title: "Task Completed",
                subtitle: "Mobile App Wireframe finished",
                time: "5 min ago",
                isNew: true,
              ),

              const NotificationTile(
                title: "New Task Added",
                subtitle: "Dashboard & App Design created",
                time: "10 min ago",
                isNew: true,
              ),

              const SizedBox(height:20),

              /// EARLIER
              const Text(
                "Earlier",
                style: TextStyle(
                  color: Colors.white,
                  fontSize:18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height:10),

              const NotificationTile(
                title: "Reminder",
                subtitle: "Finance Mobile App due tomorrow",
                time: "1 hour ago",
              ),

              const NotificationTile(
                title: "Task Updated",
                subtitle: "Real Estate Website progress updated",
                time: "Yesterday",
              ),

              const NotificationTile(
                title: "Project Created",
                subtitle: "New UI project started",
                time: "2 days ago",
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {

  final String title;
  final String subtitle;
  final String time;
  final bool isNew;

  const NotificationTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom:12),
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: const Color(0xFF374151),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [

          const CircleAvatar(
            backgroundColor: Color(0xFFFED36A),
            child: Icon(Icons.notifications,color: Colors.black),
          ),

          const SizedBox(width:12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height:4),

                Text(
                  subtitle,
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

              if(isNew)
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