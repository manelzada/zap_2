import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  final String name;
  const LoadingPage({Key? key, required this.name}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),
        () => {Navigator.pushNamed(context, '/home', arguments: widget.name)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 15),
            Text(
              'Conectando ao chat',
              style: TextStyle(fontSize: 25, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
