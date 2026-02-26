import 'package:flutter/material.dart';

import '../../data/travel_data.dart';
import '../../widgets/info_chip.dart';
import 'booking_screen.dart';

class DetailScreen extends StatelessWidget {
  final Destination destination;

  const DetailScreen({super.key, required this.destination});

  Color _getCategoryColor() {
    switch (destination.category) {
      case 'Beach': return const Color(0xFF0891B2);
      case 'Mountain': return const Color(0xFF059669);
      case 'City': return const Color(0xFF7C3AED);
      case 'Adventure': return const Color(0xFFEA580C);
      case 'Cultural': return const Color(0xFFDB2777);
      default: return const Color(0xFF6366F1);
    }
  }

  IconData _getCategoryIcon() {
    switch (destination.category) {
      case 'Beach': return Icons.beach_access;
      case 'Mountain': return Icons.terrain;
      case 'City': return Icons.location_city;
      case 'Adventure': return Icons.hiking;
      case 'Cultural': return Icons.temple_buddhist;
      default: return Icons.travel_explore;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getCategoryColor();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Image Area
                Stack(
                  children: [
                    SizedBox(
                  height: 340,
                  width: double.infinity,
                  child: Image.asset(
                    destination.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                    // Back button and share
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 10, left: 16, right: 16,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _circleButton(Icons.arrow_back_ios_new_rounded, () => Navigator.pop(context)),
                          _circleButton(Icons.share_rounded, () {}),
                        ],
                      ),
                    ),
                    // Bottom curve
                    Positioned(
                      bottom: 0, left: 0, right: 0,
                      child: Container(
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF8F9FA),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                        ),
                      ),
                    ),
                  ],
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title and rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(destination.title,
                                  style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
                                const SizedBox(height: 6),
                                Row(children: [
                                  Icon(Icons.location_on_outlined, size: 16, color: Colors.grey[500]),
                                  const SizedBox(width: 4),
                                  Text(destination.location,
                                    style: TextStyle(fontSize: 14, color: Colors.grey[500], fontWeight: FontWeight.w500)),
                                ]),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.amber.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(14)),
                            child: Row(children: [
                              const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                              const SizedBox(width: 4),
                              Text(destination.rating.toString(),
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
                            ]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Info chips
                      Wrap(
                        spacing: 10, runSpacing: 10,
                        children: [
                          InfoChip(icon: Icons.schedule_rounded, label: '${destination.duration} Days', color: color),
                          InfoChip(icon: Icons.category_rounded, label: destination.category, color: color),
                          InfoChip(icon: Icons.attach_money_rounded,
                            label: 'From \$${destination.price.toStringAsFixed(0)}', color: color),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Description
                      const Text('About', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
                      const SizedBox(height: 10),
                      Text(destination.description,
                        style: TextStyle(fontSize: 15, color: Colors.grey[600], height: 1.6)),
                      const SizedBox(height: 24),
                      // Highlights
                      const Text('Highlights', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
                      const SizedBox(height: 12),
                      ...destination.highlights.asMap().entries.map((entry) =>
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: HighlightTile(text: entry.value, index: entry.key),
                        ),
                      ),
                      const SizedBox(height: 100), // Space for bottom button
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Bottom Book Now button
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 20, offset: const Offset(0, -5))],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Total Price', style: TextStyle(fontSize: 13, color: Colors.grey[500])),
                      const SizedBox(height: 2),
                      Text('\$${destination.price.toStringAsFixed(0)}',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BookingScreen(destination: destination)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 4,
                        shadowColor: color.withOpacity(0.4),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bookmark_add_rounded, size: 20),
                          SizedBox(width: 8),
                          Text('Book Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9), shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 6)],
        ),
        child: Icon(icon, size: 20, color: const Color(0xFF1A1A2E)),
      ),
    );
  }
}
