import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class EVStationCard extends StatelessWidget {
  final String name;
  final double rating;
  final String address;
  final String status;
  final String distance;
  final String power;
  final String cost;
  final VoidCallback onBook;
  final VoidCallback onView;

  const EVStationCard({
    super.key,
    required this.name,
    required this.rating,
    required this.address,
    required this.status,
    required this.distance,
    required this.power,
    required this.cost,
    required this.onBook,
    required this.onView,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Station Name
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          const SizedBox(height: 5),

          // Rating Bar added here
          RatingBarIndicator(
            rating: rating,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.orange,
            ),
            itemCount: 5,
            itemSize: 20.0,
            direction: Axis.horizontal,
          ),

          const SizedBox(height: 10),

          // Address Row
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey),
              SizedBox(width: 5),
              Expanded(child: Text(address)),
            ],
          ),
          const SizedBox(height: 5),

          // Status Text
          Text(
            status,
            style: TextStyle(
              color: Color(0xFF03C988),
            ),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                backgroundColor: Color(0xFFF5931F).withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ), // Explicitly remove border
                ),
                avatar: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.access_time,
                    color: Color(0xFFF5931F),
                    size: 18,
                  ),
                ),
                label: Text(
                  distance,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFF5931F),
                  ),
                ),
              ),
              Chip(
                backgroundColor: Color(0xFF03C988).withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                avatar: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.flash_on_sharp,
                    color: Color(0xFF03C988),
                    size: 18,
                  ),
                ),
                label: Text(
                  power,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF03C988),
                  ),
                ),
              ),
              Chip(
                backgroundColor: Color(0xFF3E79EC).withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
                // avatar: CircleAvatar(
                //   backgroundColor: Colors.transparent,
                //   child: Icon(
                //     Icons.currency_bitcoin,
                //     color: Color(0xFF3E79EC),
                //     size: 18,
                //   ),
                // ),
                label: Text(
                  cost,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF3E79EC),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onBook,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF03C988),
                  ),
                  child: Text(
                    "Book",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: onView,
                  child: Text(
                    "View",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
