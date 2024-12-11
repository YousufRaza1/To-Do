import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../model/task_model.dart';
import '../view_model/task_view_model.dart';
import 'task_details_screen.dart';
import 'add_new_task_screen.dart';

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewTaskScreen(viewModel: viewModel),
            ),
          ).then((_) {
            viewModel.getAllTaskList(); // Refresh the task list after returning
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListenableBuilder(
        listenable: viewModel, // Listen to changes in the viewModel
        builder: (context, _) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
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
                  sectionTasks.length == 0
                      ? _buildEmptyView()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: sectionTasks.length,
                          itemBuilder: (context, taskIndex) {
                            Task task = sectionTasks[taskIndex];

                            return Dismissible(
                              key: ValueKey(task.id),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                color: Colors.red,
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.centerRight,
                                child: Icon(Icons.delete, color: Colors.white),
                              ),
                              onDismissed: (direction) {
                                // Remove the task from the list
                                viewModel.removeATask(task);

                                // Optionally show a snackbar for feedback
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${task.title} deleted'),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  color:
                                      viewModel.getPriorityColor(task.priority),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                height: 100,
                                child: ListTile(
                                  title: Text(
                                    task.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    task.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: Container(
                                    height: 130,
                                    child: Column(
                                      children: [
                                        Text(
                                            'Priority: ${task.priority == 3 ? 'low' : task.priority == 2 ? 'medium' : 'high'}'),
                                        SizedBox(height: 8),
                                        GestureDetector(
                                          onTap: () {
                                            viewModel
                                                .changeThePriorityOfTask(task);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                    ).then((_) {
                                      viewModel.getAllTaskList();
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildEmptyView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.task_alt, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No tasks available',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 8)
        ],
      ),
    );
  }
}
