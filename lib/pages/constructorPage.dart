import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String renderServerURL = 'https://f1stats-flask-server.onrender.com';

class ConstructorPage extends StatefulWidget {
  @override
  _ConstructorPageState createState() => _ConstructorPageState();
}

class _ConstructorPageState extends State<ConstructorPage> {
  late Future<String> futureString;

  @override
  void initState() {
    super.initState();
    futureString = fetchString();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: futureString,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Text(snapshot.data!),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}

Future<String> fetchString() async {
  final response = await http.get(Uri.parse(renderServerURL+'/'));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load string');
  }
}




















// class ConstructorPage extends StatefulWidget {
//   @override
//   _ConstructorPageState createState() => _ConstructorPageState();
// }

// class _ConstructorPageState extends State<ConstructorPage> {
//   late Future<List<dynamic>> futureTeams;

//   @override
//   void initState() {
//     super.initState();
//     futureTeams = fetchTeams();
//   }

//   Future<List<dynamic>> fetchTeams() async {
//     final response = await http.get(Uri.parse(renderServerURL));

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body) as List<dynamic>;
//     } else {
//       throw Exception('Failed to load teams');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<dynamic>>(
//       future: futureTeams,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: DataTable(
//               columns: const <DataColumn>[
//                 DataColumn(
//                   label: Text('ID'),
//                 ),
//                 DataColumn(
//                   label: Text('Name'),
//                 ),
//                 DataColumn(
//                   label: Text('Engine'),
//                 ),
//                 DataColumn(
//                   label: Text('Country'),
//                 ),
//                 DataColumn(
//                   label: Text('Color'),
//                 ),
//               ],
//               rows: snapshot.data!.map<DataRow>((team) => DataRow(
//                 cells: <DataCell>[
//                   DataCell(Text(team[0].toString())),
//                   DataCell(Text(team[1])),
//                   DataCell(Text(team[2])),
//                   DataCell(Text(team[3])),
//                   DataCell(Text(team[4])),
//                 ],
//               )).toList(),
//             ),
//           );
//         } else if (snapshot.hasError) {
//           return Text("${snapshot.error}");
//         }

//         return CircularProgressIndicator();
//       },
//     );
//   }
// }