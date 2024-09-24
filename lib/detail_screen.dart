import 'package:flutter/material.dart';

class detail_screen extends StatelessWidget {
  final String recipe;

  detail_screen({required this.recipe});

  final Map<String, Map<String, dynamic>> recipeDetails = {
  "Tacos al Pastor": {
    "description": "Flavorful marinated pork tacos with pineapple, cilantro, and onion.",
    "image": "lib/assets/tacos_al_pastor.jpg",
    "ingredients": [
      "1 lb pork shoulder, thinly sliced",
      "3 dried guajillo chiles",
      "2 cloves garlic",
      "1/4 cup vinegar",
      "1/4 cup orange juice",
      "1/2 tsp cumin",
      "1/4 tsp cinnamon",
      "Salt to taste",
      "Pineapple slices",
      "Corn tortillas",
      "Cilantro",
      "Onion, finely chopped",
      "Lime wedges"
    ],
    "instructions": [
      "1. Rehydrate guajillo chiles in hot water for 10 minutes. Blend with garlic, vinegar, orange juice, cumin, cinnamon, and salt to create a marinade.",
      "2. Marinate the pork in the sauce for at least 2 hours (or overnight for best results).",
      "3. Cook the pork on a hot grill or skillet until charred and cooked through.",
      "4. Grill pineapple slices and chop them.",
      "5. Serve the pork on warm corn tortillas, topped with grilled pineapple, cilantro, and onion. Add a squeeze of lime before serving."
    ]
  },
  "Chiles Rellenos": {
    "description": "Poblano peppers stuffed with cheese, battered and fried, topped with tomato sauce.",
    "image": "lib/assets/chiles_rellenos.jpg",
    "ingredients": [
      "4 large poblano peppers",
      "1 cup shredded Oaxaca cheese",
      "4 large eggs, separated",
      "1/4 cup flour",
      "1/2 cup oil for frying",
      "2 tomatoes",
      "1 onion, diced",
      "2 cloves garlic",
      "Salt to taste"
    ],
    "instructions": [
      "1. Roast the poblano peppers until charred, then peel and carefully slit to remove seeds.",
      "2. Stuff the peppers with Oaxaca cheese and close them.",
      "3. In a bowl, beat egg whites to stiff peaks, then gently fold in the yolks.",
      "4. Heat oil in a skillet. Dust the stuffed peppers with flour and dip in the egg mixture.",
      "5. Fry the peppers until golden on all sides.",
      "6. For the sauce, blend tomatoes, onion, garlic, and salt, and simmer for 10 minutes.",
      "7. Serve the chiles rellenos with the tomato sauce on top."
    ]
  },
  "Guacamole": {
    "description": "Creamy avocado dip with fresh lime, cilantro, and tomatoes.",
    "image": "lib/assets/guacamole.jpg",
    "ingredients": [
      "3 ripe avocados",
      "1/2 cup chopped cilantro",
      "1 small onion, finely diced",
      "1 medium tomato, diced",
      "1 jalapeño, finely chopped",
      "1 lime, juiced",
      "Salt to taste"
    ],
    "instructions": [
      "1. Cut the avocados in half, remove the pit, and scoop out the flesh into a bowl.",
      "2. Mash the avocado to your desired consistency (chunky or smooth).",
      "3. Add cilantro, onion, tomato, jalapeño, lime juice, and salt.",
      "4. Mix well and adjust seasoning as needed. Serve with tortilla chips."
    ]
  },
  "Enchiladas Verdes": {
    "description": "Corn tortillas filled with chicken, topped with tangy green salsa and melted cheese.",
    "image": "lib/assets/enchiladas_verdes.jpg",
    "ingredients": [
      "12 corn tortillas",
      "2 cups shredded cooked chicken",
      "2 cups salsa verde",
      "1 cup shredded Monterey Jack cheese",
      "1/2 cup sour cream",
      "1/4 cup chopped cilantro",
      "1/4 cup chopped onion"
    ],
    "instructions": [
      "1. Preheat oven to 350°F (175°C).",
      "2. Lightly fry tortillas in oil to soften them, then set aside on paper towels.",
      "3. Spread a thin layer of salsa verde on the bottom of a baking dish.",
      "4. Fill each tortilla with chicken, roll it up, and place it seam-side down in the dish.",
      "5. Pour remaining salsa verde over the enchiladas and sprinkle cheese on top.",
      "6. Bake for 20 minutes until the cheese is melted and bubbly.",
      "7. Serve with sour cream, cilantro, and chopped onion."
    ]
  },
  "Pozole Rojo": {
    "description": "Hearty Mexican soup made with hominy and pork in a flavorful red chili broth.",
    "image": "lib/assets/pozole_rojo.jpg",
    "ingredients": [
      "2 lbs pork shoulder, cubed",
      "6 cups water",
      "1 onion, halved",
    ],  "instructions": [
      "1. Boil pork with water, onion, and garlic in a large pot until tender, about 1.5 hours. Skim off any foam that forms.",
      "2. Meanwhile, rehydrate the chiles in hot water, then blend them with a little of the soaking liquid to form a smooth paste.",
      "3. Strain the chile paste and add it to the pot along with the hominy.",
      "4. Simmer for another 30 minutes. Add salt to taste.",
      "5. Serve the pozole in bowls and garnish with shredded cabbage, radishes, lime, and cilantro."
    ] 
  }
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final recipeInfo = recipeDetails[recipe];

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (recipeInfo != null && recipeInfo["image"] != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  recipeInfo["image"]!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            SizedBox(height: 20.0),
            Text(
              recipeInfo != null ? recipeInfo["description"] ?? "No details available." : "Recipe not found.",
              style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18.0, height: 1.5),
            ),
            SizedBox(height: 20.0),
            Divider(color: Colors.grey[600]),
            if (recipeInfo != null && recipeInfo["ingredients"] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ingredients:",
                    style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 10.0),
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var ingredient in recipeInfo["ingredients"] as List<String>)
                            Text(
                              "- $ingredient",
                              style: TextStyle(fontSize: 16.0, height: 1.4),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 20.0),
            Divider(color: Colors.grey[600]),
            if (recipeInfo != null && recipeInfo["instructions"] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Instructions:",
                    style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 10.0),
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var step in recipeInfo["instructions"] as List<String>)
                            Text(
                              "• $step",
                              style: TextStyle(fontSize: 16.0, height: 1.4),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
