import 'package:flutter/material.dart';

import '../../data/travel_data.dart';

class BookingScreen extends StatefulWidget {
  final Destination destination;

  const BookingScreen({super.key, required this.destination});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  int guestCount = 1;
  String selectedDate = 'March 15, 2026';

  final List<String> availableDates = [
    'March 15, 2026',
    'April 1, 2026',
    'April 20, 2026',
    'May 10, 2026',
    'June 5, 2026',
  ];

  Color get _accentColor {
    switch (widget.destination.category) {
      case 'Beach': return const Color(0xFF0891B2);
      case 'Mountain': return const Color(0xFF059669);
      case 'City': return const Color(0xFF7C3AED);
      case 'Adventure': return const Color(0xFFEA580C);
      case 'Cultural': return const Color(0xFFDB2777);
      default: return const Color(0xFF6366F1);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _confirmBooking() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 70, height: 70,
                decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), shape: BoxShape.circle),
                child: const Icon(Icons.check_circle_rounded, color: Colors.green, size: 50),
              ),
              const SizedBox(height: 20),
              const Text('Booking Confirmed!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
              const SizedBox(height: 10),
              Text('Your trip to ${widget.destination.title} has been booked successfully.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[600], height: 1.5)),
              const SizedBox(height: 8),
              Text('$guestCount Guest(s) - $selectedDate',
                style: TextStyle(fontSize: 13, color: _accentColor, fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // close dialog
                    Navigator.pop(context); // back to detail
                    Navigator.pop(context); // back to home
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _accentColor, foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: const Text('Back to Home', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.destination.price * guestCount;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF1A1A2E), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Booking', style: TextStyle(color: Color(0xFF1A1A2E), fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trip Summary Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(18),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12, offset: const Offset(0, 4))],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 70, height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        gradient: LinearGradient(colors: [_accentColor, _accentColor.withOpacity(0.7)]),
                      ),
                      child: const Center(child: Icon(Icons.travel_explore, color: Colors.white, size: 30)),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.destination.title,
                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
                          const SizedBox(height: 4),
                          Text(widget.destination.location,
                            style: TextStyle(fontSize: 13, color: Colors.grey[500])),
                          const SizedBox(height: 4),
                          Text('${widget.destination.duration} Days',
                            style: TextStyle(fontSize: 13, color: _accentColor, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Guest Details
              const Text('Guest Details', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
              const SizedBox(height: 14),
              _buildTextField(_nameController, 'Full Name', Icons.person_outline_rounded, 'Please enter your name'),
              const SizedBox(height: 14),
              _buildTextField(_emailController, 'Email Address', Icons.email_outlined, 'Please enter a valid email',
                keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 14),
              _buildTextField(_phoneController, 'Phone Number', Icons.phone_outlined, 'Please enter your phone number',
                keyboardType: TextInputType.phone),
              const SizedBox(height: 24),
              // Travel Date
              const Text('Travel Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
                ),
                child: DropdownButtonFormField<String>(
                  value: selectedDate,
                  icon: Icon(Icons.keyboard_arrow_down_rounded, color: _accentColor),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.calendar_today_rounded, size: 20),
                  ),
                  items: availableDates.map((date) =>
                    DropdownMenuItem(value: date, child: Text(date, style: const TextStyle(fontSize: 14)))).toList(),
                  onChanged: (val) { setState(() { selectedDate = val!; }); },
                ),
              ),
              const SizedBox(height: 24),
              // Number of guests
              const Text('Number of Guests', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(14),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(children: [
                      Icon(Icons.group_outlined, color: Color(0xFF1A1A2E)),
                      SizedBox(width: 12),
                      Text('Guests', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                    ]),
                    Row(children: [
                      _counterButton(Icons.remove, guestCount > 1, () { setState(() { guestCount--; }); }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('$guestCount', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      _counterButton(Icons.add, guestCount < 10, () { setState(() { guestCount++; }); }),
                    ]),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Price Summary
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _accentColor.withOpacity(0.06), borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: _accentColor.withOpacity(0.15)),
                ),
                child: Column(
                  children: [
                    _priceRow('Price per person', '\$${widget.destination.price.toStringAsFixed(0)}'),
                    const SizedBox(height: 10),
                    _priceRow('Guests', 'x $guestCount'),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
                        Text('\$${totalPrice.toStringAsFixed(0)}',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: _accentColor)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Confirm button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _confirmBooking,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _accentColor, foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 4, shadowColor: _accentColor.withOpacity(0.4),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check_circle_outline_rounded, size: 22),
                      SizedBox(width: 10),
                      Text('Confirm Booking', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, String errorMsg,
      {TextInputType? keyboardType}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (value) => (value == null || value.isEmpty) ? errorMsg : null,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[500], fontSize: 14),
          prefixIcon: Icon(icon, color: _accentColor, size: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
          filled: true, fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: Colors.redAccent)),
        ),
      ),
    );
  }

  Widget _counterButton(IconData icon, bool enabled, VoidCallback onTap) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 36, height: 36,
        decoration: BoxDecoration(
          color: enabled ? _accentColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: enabled ? Colors.white : Colors.grey[400], size: 18),
      ),
    );
  }

  Widget _priceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF1A1A2E))),
      ],
    );
  }
}
