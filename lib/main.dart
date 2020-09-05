import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ListDemo(),
    //  theme: _buildShrineTheme(),
    );
  }
}

class ListDemo extends StatefulWidget {
  @override
  _ListDemoState createState() => _ListDemoState();
}

class _ListDemoState extends State<ListDemo> {
  Map<int, bool> countToValue = <int, bool>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Three-line list with theming'),
      ),
      body: ListTileTheme(
        selectedColor: Colors.blue,
        child: ListView(
          children: [
            for (int count in List.generate(9, (index) => index + 1))
              ListTile(
                title: Text('List item $count'),
                isThreeLine: true,
                subtitle: Text('Secondary text\nTertiary text'),
                leading: Icon(Icons.label),
                selected: countToValue[count] ?? false,
                trailing: Checkbox(
                  value: countToValue[count] ?? false,
                  onChanged: (bool value) {
                    setState(() {
                      countToValue[count] = value;
                    });
                  },
                  activeColor: Colors.pink,
                ),
              ),
          ],
        ),
      ),
    );
  }
}