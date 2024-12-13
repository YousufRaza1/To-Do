import 'package:flutter/material.dart';
import '../view_model/counter_view_model.dart';

class Example2Screen extends StatefulWidget {
  final CounterViewModel viewModel;

  const Example2Screen({super.key, required this.viewModel});

  @override
  State<Example2Screen> createState() => _Example2ScreenState();
}

class _Example2ScreenState extends State<Example2Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Example2Screen created = ${DateTime.now()}');
  }

  @override
  void activate() {
    // TODO: implement activate
    super.activate();
    print('Example2Screen activate = ${DateTime.now()}');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('Example2Screen didChangeDependencies = = ${DateTime.now()}');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('Example2Screen deactivate == ${DateTime.now()}');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('Example2Screen dispose = = ${DateTime.now()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (BuildContext content, _) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display current counter value
                  Text(
                    'Counter: ${widget.viewModel.counter}',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Increment button
                      IconButton(
                        icon: Icon(Icons.add, size: 36),
                        onPressed: widget.viewModel.increment,
                      ),
                      SizedBox(width: 20),
                      // Decrement button
                      IconButton(
                        icon: Icon(Icons.remove, size: 36),
                        onPressed: widget.viewModel.decrement,
                      ),
                      SizedBox(width: 20),
                      // Reset button
                      IconButton(
                        icon: Icon(Icons.refresh, size: 36),
                        onPressed: widget.viewModel.setToZero,
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(content);
                      },
                      child: Text('Back'))
                ],
              ),
            );
          }),
    );
  }
}
