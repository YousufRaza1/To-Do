import 'package:flutter/material.dart';
import 'package:to_do/base_module/common/util.dart';
import '../model/task_model.dart';
import '../view_model/task_view_model.dart';

class AddNewTaskScreen extends StatefulWidget {
  final TaskViewModel viewModel;

  AddNewTaskScreen({required this.viewModel});

  @override
  _AddNewTaskScreenState createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late int _priority;
  late TaskStatus _status;
  DateTime? _dueDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: '');
    _descriptionController = TextEditingController(text: '');
    _priority = 1;
    _status = TaskStatus.pending;
    _dueDate = DateTime.now();
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
    final task = Task(
        id: generateId(),
        description: _descriptionController.text,
        title: _titleController.text,
        status: _status,
        dueDate: _dueDate,
        priority: _priority,
        createdAt: DateTime.now());
    widget.viewModel.addNewTask(task);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleLabel(),
              SizedBox(height: 16),
              _discriptiongLabel(),
              SizedBox(height: 16),
              _priorityLabel(),
              const SizedBox(height: 16),
              _taskStatusLabel(),
              SizedBox(height: 16),
              _dueDateLabel(),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: _saveTask,
                  child: const Text('Add New Task'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleLabel() {
    return TextField(
      controller: _titleController,
      decoration: const InputDecoration(
        labelText: 'Title',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _discriptiongLabel() {
    return TextField(
      controller: _descriptionController,
      decoration: const InputDecoration(
        labelText: 'Description',
        border: OutlineInputBorder(),
      ),
      maxLines: 3,
    );
  }

  Widget _priorityLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Priority:'),
        DropdownButton<int>(
          value: _priority,
          items: const [
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
    );
  }

  Widget _taskStatusLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Status:'),
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
    );
  }

  Widget _dueDateLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Due Date:'),
        TextButton(
          onPressed: _selectDueDate,
          child: Text(
            _dueDate == null
                ? 'Select Date'
                : _dueDate!.toLocal().toString().split(' ')[0],
          ),
        ),
      ],
    );
  }
}
