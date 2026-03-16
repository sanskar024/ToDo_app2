import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/messages.dart';
import 'package:todo/screens/notification.dart';
import 'package:todo/screens/profile.dart';
import '../provider/task_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() =>
        Provider.of<TaskProvider>(context, listen: false).fetchTasks());
  }

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<TaskProvider>(context);

    final completed =
        provider.filtered.where((t) => t['completed']).toList();
completed.sort(
  (a, b) => DateTime.parse(b['created_at'])
      .compareTo(DateTime.parse(a['created_at'])),
);
    final ongoing =
        provider.filtered.where((t) => !t['completed']).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF1F2937),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFFED36A),
        child: const Icon(Icons.add,color: Colors.black),
        onPressed: () => _addTask(context),
      ),

     bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  backgroundColor: const Color(0xFF263238),
  selectedItemColor: const Color(0xFFFED36A),
  unselectedItemColor: Colors.white54,

  onTap: (index) {

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const MessagesScreen(),
        ),
      );
    }

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const NotificationScreen(),
        ),
      );
    }

  },

  items: [

    BottomNavigationBarItem(
      icon: Image.asset("assets/images/home2.png",height:24),
      label: "Home",
    ),

    BottomNavigationBarItem(
      icon: Image.asset("assets/images/chat.png",height:24),
      label: "Chat",
    ),

    BottomNavigationBarItem(
      icon: Image.asset("assets/images/calendar.png",height:24),
      label: "Calendar",
    ),

    BottomNavigationBarItem(
      icon: Image.asset("assets/images/notification1.png",height:24),
      label: "Notification",
    ),

  ],
),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                children: [

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFFED36A),
                        ),
                      ),

                      Text(
                        "Sanskar",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),

                  const Spacer(),

                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
                    },
                    child: const CircleAvatar(
                      radius: 22,
                      backgroundImage:
                          AssetImage("assets/images/Rectangle 6.png"),
                    ),
                  )

                ],
              ),

              const SizedBox(height: 20),

              /// SEARCH BAR
              Row(
                children: [

                  Expanded(
                    child: TextField(

                      onChanged: (v) {
                        provider.search(v);
                      },

                      style: const TextStyle(color: Colors.white),

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFF455A64),
                        hintText: "Search tasks",
                        hintStyle:
                            const TextStyle(color: Colors.white54),
                        prefixIcon:
                            const Icon(Icons.search,color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFED36A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.tune,color: Colors.black),
                  )

                ],
              ),

              const SizedBox(height: 20),

              /// COMPLETED TASKS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [

                  Text(
                    "Completed Tasks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "See all",
                    style: TextStyle(color: Color(0xFFFED36A)),
                  )

                ],
              ),

              const SizedBox(height: 12),

              /// COMPLETED CARDS
              SizedBox(
                height: 160,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: completed.length,
                  itemBuilder: (context, index) {

                    final task = completed[index];

                    return Container(
                      width: 150,
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(6),

                      decoration: BoxDecoration(
  color: index == 0
      ? const Color(0xFFFED36A) // newest completed
      : const Color(0xFF455A64), // older completed
 
),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            task['title'],
                           style: TextStyle(
  fontWeight: FontWeight.bold,
  fontSize:20,
  color: index == 0 ? Colors.black : Colors.white,
),
                          ),

                          const SizedBox(height: 10),

                          Row(
                            children: [

                              const Text(
                                "Team members",
                                style: TextStyle(fontSize: 8),
                              ),

                              const Spacer(),

                             overlappingAvatars(),

                            ],
                          ),

                          const Spacer(),

                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Completed",
                                  style: TextStyle(fontSize: 12)),
                              Text("100%",
                                  style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            ],
                          ),

                          const SizedBox(height:4),

                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: 1,
                              minHeight: 6,
                              backgroundColor: Colors.white,
                             color: index == 0 ? Colors.black : Colors.white,
                            ),
                          )

                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              /// ONGOING PROJECTS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [

                  Text(
                    "Ongoing Projects",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),

                  Text(
                    "See all",
                    style: TextStyle(color: Color(0xFFFED36A)),
                  )

                ],
              ),

              const SizedBox(height: 12),

              Expanded(
                child: ListView.builder(
                  itemCount: ongoing.length,
                  itemBuilder: (context, index) {

                    final task = ongoing[index];

                    return Dismissible(

  key: Key(task['id']),

  direction: DismissDirection.horizontal,

  /// SWIPE RIGHT → COMPLETE
  background: Container(
    alignment: Alignment.centerLeft,
    padding: const EdgeInsets.only(left: 20),
    color: Colors.green,
    child: const Icon(Icons.check,color: Colors.white),
  ),

  /// SWIPE LEFT → DELETE
  secondaryBackground: Container(
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 20),
    color: Colors.red,
    child: const Icon(Icons.delete,color: Colors.white),
  ),

  confirmDismiss: (direction) async {

    if (direction == DismissDirection.startToEnd) {

      /// COMPLETE TASK
      provider.completeTask(task['id']);
      return true;

    } else {

      /// DELETE TASK
      provider.deleteTask(task['id']);
      return true;

    }

  },

  child: Container(
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.only(bottom: 12),

    decoration: BoxDecoration(
      color: const Color(0xFF455A64),
      borderRadius: BorderRadius.circular(18),
    ),

    child: Row(
      children: [

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                task['title'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height:6),

              const Text(
                "Team members",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
              
              const SizedBox(width:10),
              
              overlappingAvatars(),

              const SizedBox(height:8),

              Text(
                task['due_date'] != null
                    ? "Due on : ${DateTime.parse(task['due_date']).day} ${_monthName(DateTime.parse(task['due_date']).month)}"
                    : "No due date",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              )

            ],
          ),
        ),

        Stack(
          alignment: Alignment.center,
          children: [

            SizedBox(
              height: 55,
              width: 55,
              child: CircularProgressIndicator(
                value: task['progress'] / 100,
                strokeWidth: 6,
                color: const Color(0xFFFED36A),
                backgroundColor: Colors.white24,
              ),
            ),

            Text(
              "${task['progress']}%",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            )

          ],
        )

      ],
    ),
  ),
);
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  /// OVERLAPPING AVATAR WIDGET
Widget overlappingAvatars() {

  final random = Random();

  List<String> allImages = [
    "assets/images/p1.png",
    "assets/images/p2.png",
    "assets/images/p3.png",
    "assets/images/p4.png",
    "assets/images/p5.png",
  ];

  // shuffle images
  allImages.shuffle(random);

  // pick 3 random images
  List<String> selected = allImages.take(3).toList();

  return SizedBox(
    height: 23,
    width: 19 + (selected.length - 1) * 16,
    child: Stack(
      children: selected.asMap().entries.map((entry) {

        int index = entry.key;
        String img = entry.value;

        return Positioned(
          left: index * 14,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage(img),
            ),
          ),
        );

      }).toList(),
    ),
  );
}

  void _addTask(BuildContext context) {

    final controller = TextEditingController();
    DateTime? selectedDate;

    showDialog(
      context: context,
      builder: (_) {

        return StatefulBuilder(
          builder: (context, setState) {

            return AlertDialog(

              title: const Text("Add Task"),

              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  TextField(
                    controller: controller,
                    decoration:
                        const InputDecoration(hintText: "Task title"),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [

                      Expanded(
                        child: Text(
                          selectedDate == null
                              ? "Select Due Date"
                              : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                        ),
                      ),

                      IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () async {

                          DateTime? picked =
                              await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030),
                          );

                          if (picked != null) {
                            setState(() {
                              selectedDate = picked;
                            });
                          }

                        },
                      )

                    ],
                  )

                ],
              ),

              actions: [

                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),

                ElevatedButton(
                  onPressed: () {

                    if (controller.text.isNotEmpty &&
                        selectedDate != null) {

                      Provider.of<TaskProvider>(context,
                              listen: false)
                          .addTask(
                              controller.text, selectedDate!);

                      Navigator.pop(context);
                    }

                  },
                  child: const Text("Add"),
                )

              ],
            );
          },
        );
      },
    );
  }

  String _monthName(int month) {
    const months = [
      "",
      "Jan","Feb","Mar","Apr","May","Jun",
      "Jul","Aug","Sep","Oct","Nov","Dec"
    ];
    return months[month];
  }

}