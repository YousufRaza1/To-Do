import 'package:flutter/material.dart';
import '../model/task_model.dart';

class TaskDetailsScreen extends StatefulWidget {
  final Task task;

  TaskDetailsScreen({required this.task});

  @override
  _TaskDetailsScreenState createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late int _priority;
  late TaskStatus _status;
  DateTime? _dueDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController = TextEditingController(text: widget.task.description);
    _priority = widget.task.priority;
    _status = widget.task.status;
    _dueDate = widget.task.dueDate;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _selectDueDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _dueDate) {
      setState(() {
        _dueDate = pickedDate;
      });
    }
  }

  void _saveTask() {
    setState(() {
      widget.task.update(
        title: _titleController.text,
        description: _descriptionController.text,
        priority: _priority,
        status: _status,
        dueDate: _dueDate,
      );
    });
    Navigator.pop(context, widget.task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Priority:'),
                  DropdownButton<int>(
                    value: _priority,
                    items: [
                      DropdownMenuItem(value: 1, child: Text('High')),
                      DropdownMenuItem(value: 2, child: Text('Medium')),
                      DropdownMenuItem(value: 3, child: Text('Low')),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _priority = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Status:'),
                  DropdownButton<TaskStatus>(
                    value: _status,
                    items: TaskStatus.values
                        .map(
                          (status) => DropdownMenuItem(
                        value: status,
                        child: Text(status.toString().split('.').last),
                      ),
                    )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _status = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Due Date:'),
                  TextButton(
                    onPressed: _selectDueDate,
                    child: Text(
                      _dueDate == null
                          ? 'Select Date'
                          : _dueDate!.toLocal().toString().split(' ')[0],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _saveTask,
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
