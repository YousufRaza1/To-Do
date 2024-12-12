import 'package:flutter/material.dart';
import '../../view_model/task_view_model.dart';
import '../../model/task_model.dart';
import '../task_details_screen.dart';

final class TaskItemWidget extends StatefulWidget {
  final Task task;
  final TaskViewModel viewModel;

  TaskItemWidget({required this.viewModel, required this.task});

  @override
  State<TaskItemWidget> createState() => _task_item_widgetState();
}

class _task_item_widgetState extends State<TaskItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.task.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        // Remove the task from the list
        widget.viewModel.removeATask(widget.task);

        // Optionally show a snackbar for feedback
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${widget.task.title} deleted'),
          ),
        );

        setState(() {
          widget.viewModel.getAllTaskList();
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
          color: widget.viewModel.getPriorityColor(widget.task.priority),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 100,
        child: ListTile(
          title: Text(
            widget.task.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            widget.task.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Container(
            height: 130,
            child: Column(
              children: [
                Text(
                    'Priority: ${widget.task.priority == 3 ? 'low' : widget.task.priority == 2 ? 'medium' : 'high'}'),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    widget.viewModel.changeThePriorityOfTask(widget.task);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(2)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
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
                    TaskDetailsScreen(task: widget.task, viewModel: widget.viewModel),
              ),
            ).then((_) {
              widget.viewModel.getAllTaskList();
              setState(() {});
            });
          },
        ),
      ),
    );
  }
}
