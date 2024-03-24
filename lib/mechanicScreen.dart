import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MechanicScreen extends StatefulWidget {
  const MechanicScreen({Key? key}) : super(key: key);

  @override
  _MechanicScreenState createState() => _MechanicScreenState();
}

class _MechanicScreenState extends State<MechanicScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: _buildDrawer(),
        body: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Address')),
              DataColumn(label: Text('Call')), // Additional column for action
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('John Doe')),
                DataCell(Text('123 Main St456 Oak St456 Oak St',style: TextStyle(
                  fontSize: 13,),)),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('Jane Smith')),
                DataCell(Text('456 Oak St456 Oak St456 Oak St')),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              // Add more DataRow widgets for additional entries
              DataRow(cells: [
                DataCell(Text('John Doe')),
                DataCell(Text('123 Main St456 Oak St456 Oak St',style: TextStyle(
                  fontSize: 13,),)),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('Jane Smith')),
                DataCell(Text('456 Oak St456 Oak St456 Oak St')),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('John Doe')),
                DataCell(Text('123 Main St456 Oak St456 Oak St',style: TextStyle(
                  fontSize: 13,),)),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('Jane Smith')),
                DataCell(Text('456 Oak St456 Oak St456 Oak St')),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('John Doe')),
                DataCell(Text('123 Main St456 Oak St456 Oak St',style: TextStyle(
                  fontSize: 13,),)),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('Jane Smith')),
                DataCell(Text('456 Oak St456 Oak St456 Oak St')),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('John Doe')),
                DataCell(Text('123 Main St456 Oak St456 Oak St',style: TextStyle(
                  fontSize: 13,),)),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('Jane Smith')),
                DataCell(Text('456 Oak St456 Oak St456 Oak St')),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('John Doe')),
                DataCell(Text('123 Main St456 Oak St456 Oak St',style: TextStyle(
                  fontSize: 13,),)),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('Jane Smith')),
                DataCell(Text('456 Oak St456 Oak St456 Oak St')),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('John Doe')),
                DataCell(Text('123 Main St456 Oak St456 Oak St',style: TextStyle(
                  fontSize: 13,),)),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('Jane Smith')),
                DataCell(Text('456 Oak St456 Oak St456 Oak St')),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('John Doe')),
                DataCell(Text('123 Main St456 Oak St456 Oak St',style: TextStyle(
                  fontSize: 13,),)),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('Jane Smith')),
                DataCell(Text('456 Oak St456 Oak St456 Oak St')),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('John Doe')),
                DataCell(Text('123 Main St456 Oak St456 Oak St',style: TextStyle(
                  fontSize: 13,),)),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
              DataRow(cells: [
                DataCell(Text('Jane Smith')),
                DataCell(Text('456 Oak St456 Oak St456 Oak St')),
                DataCell(IconButton(
                  // Example of an action button
                  icon: Icon(Icons.call),
                  onPressed: () {
                    // Handle edit action
                  },
                )),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildDrawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Drawer Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Add your onTap logic here
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Add your onTap logic here
          },
        ),
        // Add more ListTiles for additional items
      ],
    ),
  );
}
