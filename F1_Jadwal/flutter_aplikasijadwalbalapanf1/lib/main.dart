import 'package:flutter/material.dart';

void main() {
  runApp(F1ScheduleApp());
}

class F1ScheduleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 Schedule',
      theme: ThemeData(),
      home: RaceListPage(),
    );
  }
}

class Race {
  final String name;
  final String location;
  final String date;
  final String time;

  Race(this.name, this.location, this.date, this.time);
}

class RaceListPage extends StatelessWidget {
  final List<Race> races = [
    Race("Bahrain Grand Prix", "Sakhir, Bahrain", "2024-03-10", "15:00"),
    Race("Monaco Grand Prix", "Monte Carlo, Monaco", "2024-05-26", "14:00"),
    Race("British Grand Prix", "Silverstone, UK", "2024-07-14", "16:00"),
    Race("Singapore Grand Prix", "Singapore", "2024-09-22", "20:00"),
    Race("Abu Dhabi Grand Prix", "Abu Dhabi, UAE", "2024-11-30", "17:00"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('F1 Race Schedule 2024'),
      ),
      body: ListView.builder(
        itemCount: races.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(races[index].name),
              subtitle: Text('${races[index].location} - ${races[index].date}'),
              trailing: Text(races[index].time),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RaceDetailPage(race: races[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class RaceDetailPage extends StatelessWidget {
  final Race race;

  RaceDetailPage({required this.race});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(race.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              race.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Location: ${race.location}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Date: ${race.date}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Time: ${race.time}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Center(
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Circuit_de_Monaco.svg/500px-Circuit_de_Monaco.svg.png',
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}