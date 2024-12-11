import 'package:flutter/material.dart';
import 'package:to_do/base_module/task_management/view/task_screen.dart';
import 'task_management/repository/local_data_source.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedIndex = 0; // Current selected index

  // List of screens for each tab
  final List<Widget> _screens = [
    TaskScreen(),
    StateTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display the current screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Active tab index
        onTap: _onItemTapped, // Handle tab tap
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            label: 'State',
          ),
        ],
      ),
    );
  }
}

class TaskTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Task Screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class StateTab extends StatelessWidget {
  TaskLocalDataSource  datasource= TaskLocalDataSource();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            datasource.deleteAllTasks();
          }, 
          child: Text('Delete all task')
      ),
    );
  }
}