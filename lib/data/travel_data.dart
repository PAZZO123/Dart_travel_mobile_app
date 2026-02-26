class Destination {
  final String id;
  final String title;
  final String location;
  final String description;
  final double price;
  final double rating;
  final String imagePath;
  final String category;
  final List<String> highlights;
  final int duration;

  const Destination({
    required this.id,
    required this.title,
    required this.location,
    required this.description,
    required this.price,
    required this.rating,
    required this.imagePath,
    required this.category,
    required this.highlights,
    required this.duration,
  });
}

class TravelData {
  static const List<String> categories = [
    'All',
    'Beach',
    'Mountain',
    'City',
    'Adventure',
    'Cultural',
  ];

  static const List<Destination> destinations = [
    Destination(
      id: '1',
      title: 'Bali Paradise',
      location: 'Bali, Indonesia',
      description:
          'Bali is a tropical paradise known for its stunning beaches, lush rice terraces, and vibrant culture. '
          'Explore ancient temples perched on clifftops, surf world-class waves, and immerse yourself in the warm '
          'hospitality of the Balinese people. From the artistic hub of Ubud to the beach clubs of Seminyak, '
          'Bali offers an unforgettable blend of relaxation and adventure.',
      price: 1200.00,
      rating: 4.8,
      imagePath: 'assets/images/bali.jpg',
      category: 'Beach',
      highlights: ['Tanah Lot Temple', 'Ubud Rice Terraces', 'Seminyak Beach', 'Mount Batur Sunrise'],
      duration: 7,
    ),
    Destination(
      id: '2',
      title: 'Swiss Alps',
      location: 'Interlaken, Switzerland',
      description:
          'The Swiss Alps offer breathtaking mountain scenery, charming villages, and world-renowned skiing. '
          'Interlaken, nestled between two pristine lakes, serves as the perfect base for exploring the Jungfrau region. '
          'Take the scenic train to Jungfraujoch, the highest railway station in Europe, and marvel at the panoramic views.',
      price: 2500.00,
      rating: 4.9,
      imagePath: 'assets/images/swiss.jpg',
      category: 'Mountain',
      highlights: ['Jungfraujoch', 'Lake Thun', 'Paragliding', 'Grindelwald Village'],
      duration: 5,
    ),
    Destination(
      id: '3',
      title: 'Tokyo Explorer',
      location: 'Tokyo, Japan',
      description:
          'Tokyo is a mesmerizing blend of ultra-modern architecture and traditional temples. '
          'Experience the bustling energy of Shibuya crossing, find peace in the Meiji Shrine gardens, '
          'and indulge in the world best sushi at Tsukiji. From the neon-lit streets of Akihabara '
          'to the serene bamboo groves nearby, Tokyo is a city that never ceases to amaze.',
      price: 1800.00,
      rating: 4.7,
      imagePath: 'assets/images/tokyo.jpg',
      category: 'City',
      highlights: ['Shibuya Crossing', 'Meiji Shrine', 'Tsukiji Market', 'Akihabara District'],
      duration: 6,
    ),
    Destination(
      id: '4',
      title: 'Machu Picchu Trek',
      location: 'Cusco, Peru',
      description:
          'Embark on the legendary Inca Trail to Machu Picchu, one of the New Seven Wonders of the World. '
          'This ancient citadel, perched high in the Andes mountains, offers a glimpse into the remarkable '
          'engineering and spiritual practices of the Inca civilization. Trek through cloud forests, '
          'pass ancient ruins, and arrive at the Sun Gate for your first magical view of the lost city.',
      price: 1500.00,
      rating: 4.9,
      imagePath: 'assets/images/machu_picchu.jpg',
      category: 'Adventure',
      highlights: ['Inca Trail', 'Sun Gate', 'Sacred Valley', 'Cusco Old Town'],
      duration: 4,
    ),
    Destination(
      id: '5',
      title: 'Santorini Sunset',
      location: 'Santorini, Greece',
      description:
          'Santorini is famous for its dramatic views, stunning sunsets, and whitewashed buildings with blue domes. '
          'Perched on volcanic cliffs overlooking the Aegean Sea, this Greek island is the epitome of romance. '
          'Wander through the narrow streets of Oia, taste exceptional local wines, and relax on unique '
          'red and black sand beaches.',
      price: 2000.00,
      rating: 4.8,
      imagePath: 'assets/images/santorini.jpg',
      category: 'Beach',
      highlights: ['Oia Sunset', 'Red Beach', 'Wine Tasting', 'Caldera Cruise'],
      duration: 5,
    ),
    Destination(
      id: '6',
      title: 'Marrakech Medina',
      location: 'Marrakech, Morocco',
      description:
          'Marrakech is a sensory feast of colors, sounds, and flavors. Lose yourself in the ancient medina, '
          'haggle in the vibrant souks, and find tranquility in stunning riads and gardens. '
          'Visit the iconic Jardin Majorelle, explore the historic Bahia Palace, and experience the '
          'lively atmosphere of Jemaa el-Fnaa square as night falls.',
      price: 900.00,
      rating: 4.5,
      imagePath: 'assets/images/marrakech.jpg',
      category: 'Cultural',
      highlights: ['Jardin Majorelle', 'Bahia Palace', 'Jemaa el-Fnaa', 'Atlas Mountains Day Trip'],
      duration: 4,
    ),
    Destination(
      id: '7',
      title: 'Patagonia Wild',
      location: 'Torres del Paine, Chile',
      description:
          'Patagonia is the ultimate destination for nature lovers and adventure seekers. '
          'Torres del Paine National Park boasts towering granite peaks, pristine glacial lakes, '
          'and vast open steppes teeming with wildlife. Hike the famous W Trek, witness the '
          'thunderous calving of Grey Glacier, and camp under some of the clearest skies on Earth.',
      price: 2200.00,
      rating: 4.7,
      imagePath: 'assets/images/patagonia.jpg',
      category: 'Adventure',
      highlights: ['W Trek', 'Grey Glacier', 'Torres Base', 'Lake Pehoe'],
      duration: 8,
    ),
    Destination(
      id: '8',
      title: 'Kyoto Temples',
      location: 'Kyoto, Japan',
      description:
          'Kyoto, the cultural heart of Japan, is home to over 2,000 temples and shrines. '
          'Walk through the iconic vermillion torii gates of Fushimi Inari, contemplate the '
          'zen beauty of the Golden Pavilion, and stroll through enchanting bamboo groves. '
          'Experience a traditional tea ceremony, spot geisha in the Gion district, and savor '
          'refined kaiseki cuisine.',
      price: 1600.00,
      rating: 4.8,
      imagePath: 'assets/images/kyoto.jpg',
      category: 'Cultural',
      highlights: ['Fushimi Inari', 'Golden Pavilion', 'Bamboo Grove', 'Gion District'],
      duration: 5,
    ),
  ];

  static List<Destination> getByCategory(String category) {
    if (category == 'All') return destinations;
    return destinations.where((d) => d.category == category).toList();
  }

  static Destination? getById(String id) {
    try {
      return destinations.firstWhere((d) => d.id == id);
    } catch (_) {
      return null;
    }
  }
}
