import 'package:flutter/material.dart';
import 'detail_screen.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(
      brightness: Brightness.dark, // Enable dark mode
      primarySwatch: Colors.deepPurple,
      scaffoldBackgroundColor: const Color(0xFF1C1C1E), // Dark background color
      textTheme: TextTheme(
        bodySmall: TextStyle(fontSize: 16.0, color: Colors.grey.shade300),
        bodyLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF292B2F), // Darker app bar color
        titleTextStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        elevation: 0, // Flat app bar
      ),
      cardColor: const Color(0xFF2C2C2E), // Dark color for cards
      iconTheme: IconThemeData(
        color: Colors.grey.shade300,
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final List<Map<String, String>> recipes = [
    {"name": "Tacos al Pastor", "image": "lib/assets/tacos_al_pastor.jpg"}, 
    {"name": "Chiles Rellenos", "image": "lib/assets/chiles_rellenos.jpg"},
    {"name": "Guacamole", "image": "lib/assets/guacamole.jpg"},
    {"name": "Enchiladas Verdes", "image": "lib/assets/enchiladas_verdes.jpg"},
    {"name": "Pozole Rojo", "image": "lib/assets/pozole_rojo.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe List'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {
              // Placeholder for favorites screen navigation
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            elevation: 2, // Reduce elevation for a flat look
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              contentPadding: EdgeInsets.all(15),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Rounded corners for the image
                child: Image.asset(
                  recipes[index]['image']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                recipes[index]['name']!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              subtitle: Text(
                'Tap for details',
                style: TextStyle(color: Colors.grey.shade500),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => detail_screen(recipe: recipes[index]['name']!),
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
