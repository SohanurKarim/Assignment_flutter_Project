import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';


class AlarmScreen extends StatelessWidget {
  final List<Map<String, dynamic>> alarms = [
    {'time': '7:10 pm', 'date': 'Fri 21 Mar 2025', 'enabled': true},
    {'time': '6:55 pm', 'date': 'Fri 21 Mar 2025', 'enabled': false},
    {'time': '7:10 pm', 'date': 'Fri 21 Mar 2025', 'enabled': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0C0327), Color(0xFF003F95)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected Location',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                color: Colors.white
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 28, color: Colors.white70),
                  const SizedBox(width: 10),
                  Text(
                    'Add your location',
                    style: TextStyle(
                        color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'Alarms',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
            // const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: alarms.length,
                itemBuilder: (context, index) {
                  final alarm = alarms[index];
                  return AlarmTile(
                    time: alarm['time'],
                    date: alarm['date'],
                    enabled: alarm['enabled'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 45), // bottom margin
        child: SizedBox(
          width: 70, // custom width
          height: 70, // custom height
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Color(0xFF5200FF),
            shape: CircleBorder(), // ensures perfect circular shape
            child: Icon(
              Icons.add,
              size: 36, // bigger icon
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class AlarmTile extends StatelessWidget {
  final String time;
  final String date;
  final bool enabled;

  const AlarmTile({
    required this.time,
    required this.date,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Text(
            time,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
          Spacer(),
          Text(
            date,
            style: TextStyle(color: Colors.white54),
          ),
          Switch(
            value: enabled,
            onChanged: (_) {},
            activeColor: Colors.white,
            activeTrackColor: Color(0xFF5200FF),
            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
