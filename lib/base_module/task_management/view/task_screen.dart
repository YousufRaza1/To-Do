import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../model/task_model.dart';
import '../view_model/task_view_model.dart';
import 'task_details_screen.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  // State variables to hold lists of tasks
  TaskViewModel viewModel = TaskViewModel();

  @override
  void initState() {
    super.initState();
    // Load all tasks once the screen is initialized
    viewModel.getAllTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),
      body: viewModel.allTaskList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: viewModel.allTaskList.length,
              itemBuilder: (context, sectionIndex) {
                // Get the section of tasks (Pending, In Progress, Completed)
                List<Task> sectionTasks = viewModel.allTaskList[sectionIndex];

                // Group title
                String sectionTitle;
                switch (sectionIndex) {
                  case 0:
                    sectionTitle = 'In Progress';
                    break;
                  case 1:
                    sectionTitle = 'Completed';
                    break;
                  case 2:
                    sectionTitle = 'Pending';
                    break;
                  default:
                    sectionTitle = '';
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        sectionTitle,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: sectionTasks.length,
                      itemBuilder: (context, taskIndex) {
                        Task task = sectionTasks[taskIndex];

                        return Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: viewModel.getPriorityColor(task.priority),
                            // Set background color based on priority
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 100,
                          child: ListTile(
                            title: Text(task.title),
                            subtitle: Text(task.description),
                            trailing: Container(
                              height: 130,
                              child: Column(
                                children: [
                                  Text(
                                      'Priority: ${task.priority == 3 ? 'low' : task.priority == 2 ? 'medium' : 'high'}'),
                                  SizedBox(height: 8),
                                  GestureDetector(
                                    onTap: () {
                                      viewModel.changeThePriorityOfTask(task);
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(2)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Change Priority"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TaskDetailsScreen(task: task),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
    );
  }

// Helper function to get color for task status

// Helper function to get background color for task priority
}
