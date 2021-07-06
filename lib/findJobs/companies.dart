import 'package:flutter/material.dart';

class Companies extends StatefulWidget {
  const Companies({Key key}) : super(key: key);

  @override
  _CompaniesState createState() => _CompaniesState();
}

class _CompaniesState extends State<Companies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Companies'),
      ),
      body: Column(
        children: [
          Text('Company List'),
        ],
      ),
    );
  }
}
