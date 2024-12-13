import 'package:flutter/material.dart';
import '../view_model/counter_view_model.dart';
import 'example2_screen.dart';

class Example1Screen extends StatefulWidget {
  const Example1Screen({super.key});

  @override
  State<Example1Screen> createState() => _Example1ScreenState();
}

class _Example1ScreenState extends State<Example1Screen> {
  final viewModel = CounterViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Example1Screen created = ${DateTime.now()}');
  }

  @override
  void activate() {
    // TODO: implement activate
    super.activate();
    print('Example1Screen activate = ${DateTime.now()}');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('Example1Screen didChangeDependencies = = ${DateTime.now()}');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('Example1Screen deactivate == ${DateTime.now()}');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('Example1Screen dispose = = ${DateTime.now()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: ListenableBuilder(
          listenable: viewModel,
          builder: (BuildContext content, _) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display current counter value
                  Text(
                    'Counter: ${viewModel.counter}',
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
                        onPressed: viewModel.increment,
                      ),
                      SizedBox(width: 20),
                      // Decrement button
                      IconButton(
                        icon: Icon(Icons.remove, size: 36),
                        onPressed: viewModel.decrement,
                      ),
                      SizedBox(width: 20),
                      // Reset button
                      IconButton(
                        icon: Icon(Icons.refresh, size: 36),
                        onPressed: viewModel.setToZero,
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (content) =>
                                    Example2Screen(viewModel: viewModel)));
                      },
                      child: Text('Go to second page'))
                ],
              ),
            );
          }),
    );
  }
}
