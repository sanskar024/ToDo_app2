import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final Map task;
  final VoidCallback onComplete;
  final VoidCallback onDelete;
  final Widget avatars;
  final String dueText;

  const TaskTile({
    super.key,
    required this.task,
    required this.onComplete,
    required this.onDelete,
    required this.avatars,
    required this.dueText,
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,

      child: Dismissible(

        key: Key(task['id']),
        direction: DismissDirection.horizontal,

        background: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 20),
          color: Colors.green,
          child: const Icon(Icons.check,color: Colors.white),
        ),

        secondaryBackground: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          color: Colors.red,
          child: const Icon(Icons.delete,color: Colors.white),
        ),

        confirmDismiss: (direction) async {

          if(direction == DismissDirection.startToEnd){
            onComplete();
            return true;
          }else{
            onDelete();
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

                    const SizedBox(height:6),

                    avatars,

                    const SizedBox(height:8),

                    Text(
                      dueText,
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
      ),
    );
  }
}