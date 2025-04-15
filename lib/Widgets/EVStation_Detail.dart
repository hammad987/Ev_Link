import 'package:flutter/material.dart';

class EVStation_Detail extends StatefulWidget {
  const EVStation_Detail({super.key});

  @override
  State<EVStation_Detail> createState() => _EVStation_DetailState();
}

class _EVStation_DetailState extends State<EVStation_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'EV Charging Station A',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '(20 Boekers)',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('12th Ave N, Birmingham'),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.phone, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text('+1 (1234) 125-4567'),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.green),
                    SizedBox(width: 4),
                    Text(
                      'Open 24 Hours',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),
            // Checkboxes
            Column(
              children: [
                _buildCheckboxItem('Nov 75 Min', false),
                const SizedBox(height: 8),
                _buildCheckboxItem('Nov 80 / Nov 90', true),
              ],
            ),

            const Divider(height: 40, thickness: 1),

            // Available Connectors Table
            const Text(
              'Available Connectors',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(2),
                  4: FlexColumnWidth(1),
                  5: FlexColumnWidth(1),
                },
                border: TableBorder.symmetric(
                  inside: const BorderSide(color: Colors.grey),
                ),
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    children: const [
                      _TableHeader('Time'),
                      _TableHeader('Maintenance'),
                      _TableHeader('27772'),
                      _TableHeader('CHAWAHOP'),
                      _TableHeader('CCSI'),
                      _TableHeader('CCSI'),
                    ],
                  ),
                  const TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text('- Battery Power - 500w to 250kw'),
                      ),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                      SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(height: 40, thickness: 1),

            // About Section
            const Text(
              'About',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Lorem ipsum dolor sit amet consectetur adipiscing elit. '
              'Aenean ut vulputate nisi. Nulla viverra odio nec risus '
              'vehicula lacuta.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxItem(String text, bool checked) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: checked ? const Icon(Icons.check, size: 16) : null,
        ),
        const SizedBox(width: 8),
        Text(text),
      ],
    );
  }
}

class _TableHeader extends StatelessWidget {
  final String text;

  const _TableHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
