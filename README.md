# Wanderlust Travel App

A multi-screen travel application UI built with Flutter. All data is hard-coded inside Dart files. This project demonstrates advanced UI design, widget composition, and navigation between screens.

## Project Structure

```
travel_app/
  lib/
    main.dart                    # App entry point
    data/
      travel_data.dart           # Hard-coded destination data
    screens/
      home_screen.dart           # Home screen with search and grid
      detail_screen.dart         # Destination detail view
      booking_screen.dart        # Booking form and confirmation
    widgets/
      destination_card.dart      # Reusable destination card widget
      info_chip.dart             # Reusable info chip and highlight tile
  assets/
    images/                      # Destination images
  pubspec.yaml
```

## Screens

### 1. Home Screen (Complex Dashboard)
- AppBar with notification icon and user avatar
- Search bar with filter icon (UI functional for filtering)
- Horizontal scrollable category chips (All, Beach, Mountain, City, Adventure, Cultural)
- Grid layout of destination cards using SliverGrid
- Each card shows image placeholder, title, location, rating, price, favorite icon, and category badge
- Tapping a card navigates to the Detail Screen

### 2. Detail Screen
- Large gradient header with category icon
- Back and share buttons
- Destination title, location, and star rating
- Info chips showing duration, category, and price
- Scrollable description text
- Numbered highlight tiles
- Fixed bottom bar with total price and Book Now button
- Navigates to Booking Screen

### 3. Booking Screen
- Trip summary card
- Form fields: Full Name, Email, Phone (with validation using TextFormField and GlobalKey<FormState>)
- Travel date dropdown selector
- Guest counter with increment/decrement buttons (uses setState)
- Dynamic price calculation
- Confirm button triggers success AlertDialog
- Dialog navigates back to Home Screen

## Navigation Flow

```
Home Screen --> Detail Screen --> Booking Screen --> (Confirmation Dialog) --> Home Screen
     ^               |                  |
     |          Navigator.pop      Navigator.pop
     +<--------------+<-----------------+
```

Uses Navigator.push() and Navigator.pop() for imperative navigation.
Data is passed between screens via constructor parameters.

## Widgets Used (18+ Different Widgets)

1. MaterialApp
2. Scaffold
3. SafeArea
4. CustomScrollView
5. SliverToBoxAdapter
6. SliverGrid / SliverPadding
7. Container (with BoxDecoration, gradients, shadows)
8. Stack / Positioned
9. Row / Column
10. Text
11. Icon
12. TextField (with TextEditingController)
13. TextFormField (with validator)
14. ElevatedButton
15. GestureDetector
16. ListView.builder (horizontal scroll)
17. SingleChildScrollView
18. ClipRRect
19. Form (with GlobalKey<FormState>)
20. DropdownButtonFormField
21. AlertDialog
22. Wrap
23. Expanded / SizedBox
24. Padding
25. Card-style Containers
26. LinearGradient
27. BoxShadow
28. AppBar

## Custom Reusable Widget Classes

- **DestinationCard** (StatefulWidget) - Card with gradient, overlay text, favorite toggle, category badge
- **InfoChip** (StatelessWidget) - Icon + label chip with custom color
- **HighlightTile** (StatelessWidget) - Numbered highlight item with colored accent

## Design Features

- Consistent color theme based on destination category
- Gradient backgrounds and shadow effects
- Responsive spacing throughout
- Category-based color coding (Beach=teal, Mountain=green, City=purple, Adventure=orange, Cultural=pink)
- Form validation with error messages
- Success dialog with confirmation

## How to Run

```bash
cd travel_app
flutter pub get
flutter run
```

## Adding Real Images

Replace the gradient placeholders with actual images:
1. Add .jpg images to `assets/images/` folder
2. Update `imagePath` in `travel_data.dart`
3. Replace the gradient Container in `destination_card.dart` with `Image.asset()`
