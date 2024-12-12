import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../model/task_model.dart';
import '../view_model/task_view_model.dart';
import 'add_new_task_screen.dart';
import 'widget/empty_list_widget.dart';
import 'widget/task_item_widget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

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
        child: const Icon(Icons.add),
      ),
      body: ListenableBuilder(
        listenable: viewModel, // Listen to changes in the viewModel
        builder: (context, _) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
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
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                  sectionTasks.isEmpty
                      ? EmptyListWidget()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: sectionTasks.length,
                          itemBuilder: (context, taskIndex) {
                            Task task = sectionTasks[taskIndex];

                            return TaskItemWidget(viewModel: viewModel, task: task);
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


}
