import 'package:flutter/material.dart';

import '../../data/travel_data.dart';

class DestinationCard extends StatefulWidget {
  final Destination destination;
  final VoidCallback onTap;

  const DestinationCard({
    super.key,
    required this.destination,
    required this.onTap,
  });

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
             SizedBox.expand(
  child: Image.asset(
    widget.destination.imagePath,
    fit: BoxFit.cover,
  ),
),
              Positioned(
                bottom: 0, left: 0, right: 0,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 12, left: 12, right: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.destination.title,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,
                        shadows: [Shadow(blurRadius: 4, color: Colors.black54)]),
                      maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Row(children: [
                      const Icon(Icons.location_on, color: Colors.white70, size: 14),
                      const SizedBox(width: 4),
                      Expanded(child: Text(widget.destination.location,
                        style: const TextStyle(color: Colors.white70, fontSize: 12),
                        maxLines: 1, overflow: TextOverflow.ellipsis)),
                    ]),
                    const SizedBox(height: 6),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Row(children: [
                        const Icon(Icons.star_rounded, color: Colors.amber, size: 16),
                        const SizedBox(width: 3),
                        Text(widget.destination.rating.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
                      ]),
                      Text('\$${widget.destination.price.toStringAsFixed(0)}',
                        style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                    ]),
                  ],
                ),
              ),
              Positioned(
                top: 10, right: 10,
                child: GestureDetector(
                  onTap: () { setState(() { isFavorite = !isFavorite; }); },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9), shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2))],
                    ),
                    child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.redAccent : Colors.grey[600], size: 20),
                  ),
                ),
              ),
              Positioned(
                top: 10, left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.9), borderRadius: BorderRadius.circular(12)),
                  child: Text(widget.destination.category,
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
                      color: _getPrimaryColor(widget.destination.category))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> _getGradientColors(String category) {
    switch (category) {
      case 'Beach': return [const Color(0xFF0891B2), const Color(0xFF06B6D4)];
      case 'Mountain': return [const Color(0xFF059669), const Color(0xFF34D399)];
      case 'City': return [const Color(0xFF7C3AED), const Color(0xFFA78BFA)];
      case 'Adventure': return [const Color(0xFFEA580C), const Color(0xFFFB923C)];
      case 'Cultural': return [const Color(0xFFDB2777), const Color(0xFFF472B6)];
      default: return [const Color(0xFF6366F1), const Color(0xFF818CF8)];
    }
  }

  Color _getPrimaryColor(String category) {
    switch (category) {
      case 'Beach': return const Color(0xFF0891B2);
      case 'Mountain': return const Color(0xFF059669);
      case 'City': return const Color(0xFF7C3AED);
      case 'Adventure': return const Color(0xFFEA580C);
      case 'Cultural': return const Color(0xFFDB2777);
      default: return const Color(0xFF6366F1);
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Beach': return Icons.beach_access;
      case 'Mountain': return Icons.terrain;
      case 'City': return Icons.location_city;
      case 'Adventure': return Icons.hiking;
      case 'Cultural': return Icons.temple_buddhist;
      default: return Icons.travel_explore;
    }
  }
}
