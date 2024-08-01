import 'package:flutter/material.dart';
import 'package:flutter_tasklist_app/data/datasources/task_remote_datasource.dart';
import 'package:flutter_tasklist_app/data/models/task_response_model.dart';
import 'package:flutter_tasklist_app/pages/edit_task_page.dart';
import 'package:flutter_tasklist_app/pages/home_page.dart';

class DetailTaskPage extends StatefulWidget {
  final Task task;
  const DetailTaskPage({
    super.key,
    required this.task,
  });

  @override
  State<DetailTaskPage> createState() => _DetailTaskPageState();
}

class _DetailTaskPageState extends State<DetailTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Task',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 2,
        backgroundColor: Colors.yellow,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        children: [
          Text('Title: ${widget.task.attributes.title}'),
          const SizedBox(height: 16),
          Text('Description: ${widget.task.attributes.description}'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                   onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return  EditTaskPage(task: widget.task,);
                  }));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.yellow,
                ),
                child: const Text('Edit'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  //show dialog confirmation delete
                  //delete task
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Confirmation'),
                          content: const Text('are syou sure to delete this'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('No')),
                            TextButton(
                                onPressed: () async {
                                  await TaskRemoteDatasource()
                                      .deleteTask(widget.task.id);
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const HomePage();
                                  }));
                                },
                                child: const Text('Yes')),
                          ],
                        );
                      });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 40),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                child: const Text('Delete'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
