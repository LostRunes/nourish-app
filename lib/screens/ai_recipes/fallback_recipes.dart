import 'ai_recipes_model.dart';

List<Recipe> getFallbackRecipes(String mainIng, List<String> ingredientNames, String mealType, String cookingStyle) {
  final list = <Recipe>[];
  final mainLower = mainIng.toLowerCase();
  const timestamp = 'static';

  if (mainLower.contains('maggi')) {
    list.add(Recipe(
      id: 'maggi_stirfry_1_$timestamp',
      title: "Classic Street Style Masala Maggi",
      duration: "10 mins",
      ingredients: ["Maggi Noodles 1 pack", "Tastemaker 1 pack", "Onion 1/2 (chopped)", "Tomato 1/2 (chopped)", "Green Peas 20g", "Butter 10g"],
      instructions: [
        "Heat butter in a pan. Sauté chopped onions and green chilies for 2 minutes.",
        "Add chopped tomatoes, green peas, and tastemaker. Cook for 1 minute.",
        "Pour in 1.5 cups of water and bring to a boil. Break Maggi noodles and add to the pan.",
        "Cook on medium-high heat for 3-4 minutes until water is absorbed and noodles are soft. Serve hot."
      ],
      calories: 320, protein: 8.0, carbs: 48.0, fat: 12.0,
    ));
    list.add(Recipe(
      id: 'maggi_baked_$timestamp',
      title: "Cheesy Garlic Baked Maggi",
      duration: "15 mins",
      ingredients: ["Maggi Noodles 1 pack", "Tastemaker 1 pack", "Minced Garlic 4 cloves", "Butter 15g", "Grated Cheese 30g"],
      instructions: [
        "Boil Maggi noodles in plain water for 2 minutes until 80% cooked, then drain.",
        "Sauté minced garlic in melted butter until fragrant. Mix with the drained noodles and tastemaker.",
        "Place the garlic noodles in a baking dish and cover generously with grated cheese.",
        "Bake at 180°C for 6-8 minutes until the cheese is melted, bubbling, and golden brown. Serve hot."
      ],
      calories: 420, protein: 12.0, carbs: 50.0, fat: 18.0,
    ));
    list.add(Recipe(
      id: 'maggi_sauteed_$timestamp',
      title: "Spicy Maggi Egg/Paneer Bhurji Mix",
      duration: "12 mins",
      ingredients: ["Maggi Noodles 1 pack", "Tastemaker 1 pack", "Eggs 2 (or Paneer 100g crumbled)", "Onion 1/2 (chopped)", "Oil 1 tbsp"],
      instructions: [
        "Boil Maggi in 1.5 cups of water with the tastemaker until fully cooked, then set aside.",
        "In another pan, heat oil and sauté chopped onions. Add eggs (or crumbled paneer) and scramble with salt.",
        "Once the scramble (bhurji) is cooked, add the prepared Maggi noodles directly into the pan.",
        "Toss everything together on high heat for 2 minutes to blend the flavors. Garnish with herbs and serve."
      ],
      calories: 380, protein: 15.0, carbs: 44.0, fat: 16.0,
    ));
    list.add(Recipe(
      id: 'maggi_stirfry_2_$timestamp',
      title: "Chinese Chili Garlic Maggi",
      duration: "10 mins",
      ingredients: ["Maggi Noodles 1 pack", "Tastemaker 1/2 pack", "Soy Sauce 1 tsp", "Chili Sauce 1 tsp", "Garlic 4 cloves (sliced)", "Oil 1 tbsp"],
      instructions: [
        "Boil Maggi noodles for 2 minutes, drain, and rinse with cold water to prevent sticking.",
        "Heat oil in a wok. Fry sliced garlic and dry red chilies on high heat for 1 minute.",
        "Add boiled noodles, soy sauce, chili sauce, and half of the tastemaker.",
        "Toss quickly on high heat for 2 minutes. Garnish with spring onion greens and serve hot."
      ],
      calories: 310, protein: 7.5, carbs: 46.0, fat: 11.5,
    ));
    list.add(Recipe(
      id: 'maggi_fried_$timestamp',
      title: "Crispy Fried Maggi Pakoras",
      duration: "18 mins",
      ingredients: ["Maggi Noodles 1 pack", "Tastemaker 1 pack", "Gram Flour (Besan) 3 tbsp", "Onion 1/2 (sliced)", "Oil for deep frying"],
      instructions: [
        "Boil Maggi in water with tastemaker until fully cooked. Let it cool down completely.",
        "Mix the cooled noodles with gram flour, sliced onions, chopped coriander, and a pinch of salt.",
        "Shape the mixture into small bite-sized round pakoras.",
        "Slide them into hot oil and deep fry on medium heat for 4-5 minutes until golden and crispy. Serve with chutney."
      ],
      calories: 360, protein: 9.0, carbs: 52.0, fat: 14.0,
    ));
  } else if (mainLower.contains('paneer')) {
    list.add(Recipe(
      id: 'paneer_stirfry_$timestamp',
      title: "Crispy Paneer Tawa Stir Fry",
      duration: "15 mins",
      ingredients: ["Paneer 150g (cubes)", "Onion 1 (sliced)", "Capsicum 1/2 (sliced)", "Soy Sauce 1 tsp", "Butter 10g"],
      instructions: [
        "Slice paneer, onion, and capsicum. Heat butter in a flat frying pan.",
        "Toss in paneer cubes and sauté for 3 minutes until lightly golden. Set aside.",
        "Sauté onions and capsicum on high heat in the same pan for 3 minutes.",
        "Return paneer to the pan, add soy sauce, salt, and pepper. Toss for 2 minutes."
      ],
      calories: 290, protein: 17.0, carbs: 5.5, fat: 22.0,
    ));
    list.add(Recipe(
      id: 'paneer_curry_$timestamp',
      title: "Dhaba Style Paneer Masala Curry",
      duration: "25 mins",
      ingredients: ["Paneer 150g (cubes)", "Onions 2 (chopped)", "Tomatoes 2 (puréed)", "Ginger-Garlic Paste 1 tsp", "Garam Masala 1/2 tsp"],
      instructions: [
        "Heat oil, sauté chopped onions until golden. Add ginger-garlic paste.",
        "Pour in tomatoes, turmeric, salt, and chili powder. Cook until oil separates.",
        "Add paneer cubes and half a cup of warm water. Simmer covered for 8 minutes.",
        "Sprinkle garam masala, garnish with fresh coriander, and serve hot."
      ],
      calories: 360, protein: 16.5, carbs: 12.0, fat: 26.0,
    ));
    list.add(Recipe(
      id: 'paneer_baked_$timestamp',
      title: "Tandoori Grilled Paneer Tikka",
      duration: "20 mins",
      ingredients: ["Paneer 150g (cubes)", "Yogurt 3 tbsp", "Ginger-Garlic Paste 1 tsp", "Lemon Juice 1 tsp"],
      instructions: [
        "Mix yogurt, ginger-garlic paste, spices, and lemon juice to make a marinade.",
        "Coat paneer cubes in the marinade and let rest for 10 minutes.",
        "Arrange paneer on a baking tray lined with greaseproof paper.",
        "Bake at 200°C for 12 minutes until charred on the edges. Serve hot."
      ],
      calories: 280, protein: 18.0, carbs: 6.5, fat: 19.0,
    ));
    list.add(Recipe(
      id: 'paneer_sauteed_$timestamp',
      title: "Spiced Paneer Bhurji Toast",
      duration: "10 mins",
      ingredients: ["Paneer 100g (crumbled)", "Bread 2 slices", "Onion 1/2 (chopped)", "Turmeric 1/4 tsp", "Butter 10g"],
      instructions: [
        "Melt butter in a pan. Sauté chopped onions and green chili until soft.",
        "Add turmeric powder, salt, and crumbled paneer. Cook for 3 minutes.",
        "Toast the bread slices in a toaster or on a pan until golden brown.",
        "Spread the hot paneer bhurji evenly over the toasted bread and serve."
      ],
      calories: 220, protein: 14.5, carbs: 6.0, fat: 16.0,
    ));
    list.add(Recipe(
      id: 'paneer_fried_$timestamp',
      title: "Golden Fried Paneer Pakoras",
      duration: "18 mins",
      ingredients: ["Paneer 150g (sliced)", "Gram Flour (Besan) 4 tbsp", "Turmeric 1/4 tsp", "Oil for frying"],
      instructions: [
        "Mix gram flour, salt, turmeric, and water to make a smooth thick batter.",
        "Dip paneer slices in the batter, coating them fully.",
        "Slide into hot oil and fry on medium heat for 4-5 minutes.",
        "Remove when crispy and golden brown, drain excess oil and serve."
      ],
      calories: 340, protein: 15.0, carbs: 18.0, fat: 22.0,
    ));
  } else if (mainLower.contains('egg')) {
    list.add(Recipe(
      id: 'egg_sauteed_$timestamp',
      title: "Spicy Street Style Egg Bhurji",
      duration: "10 mins",
      ingredients: ["Eggs 3", "Onions 2 (chopped)", "Tomato 1 (chopped)", "Green Chili 2 (chopped)", "Butter 15g"],
      instructions: [
        "Melt butter in a pan. Sauté onions and green chilies until soft.",
        "Add chopped tomatoes and spices. Cook for 2 minutes.",
        "Whisk eggs, pour into the pan, and scramble on medium heat.",
        "Cook for 3-4 minutes until cooked through. Garnish with coriander."
      ],
      calories: 240, protein: 18.0, carbs: 6.0, fat: 16.0,
    ));
    list.add(Recipe(
      id: 'egg_curry_$timestamp',
      title: "Classic Egg Curry",
      duration: "25 mins",
      ingredients: ["Boiled Eggs 4", "Onions 2 (pureed)", "Tomatoes 2 (pureed)", "Garlic paste 1 tsp", "Oil 2 tbsp"],
      instructions: [
        "Prick boiled eggs with a fork and fry lightly in oil. Set aside.",
        "Sauté onion paste, garlic, and ginger in the same oil.",
        "Add tomato puree and spices. Cook until oil separates.",
        "Add water, bring to a simmer, add eggs, and cook for 10 minutes."
      ],
      calories: 310, protein: 20.0, carbs: 10.0, fat: 22.0,
    ));
    list.add(Recipe(
      id: 'egg_baked_$timestamp',
      title: "Fluffy Cheese Omelette",
      duration: "10 mins",
      ingredients: ["Eggs 3", "Cheddar Cheese 30g", "Milk 2 tbsp", "Butter 10g"],
      instructions: [
        "Whisk eggs with milk, salt, and pepper until light.",
        "Melt butter in a pan. Pour egg mixture and cook on low heat.",
        "When edges are cooked, sprinkle cheese on one half.",
        "Fold the omelette in half and cook until cheese is melted."
      ],
      calories: 280, protein: 22.0, carbs: 2.0, fat: 20.0,
    ));
  } else if (mainLower.contains('chicken')) {
    list.add(Recipe(
      id: 'chicken_curry_$timestamp',
      title: "Homestyle Chicken Curry",
      duration: "35 mins",
      ingredients: ["Chicken 300g", "Onion 2 (sliced)", "Tomato 2 (chopped)", "Ginger-Garlic Paste 1 tbsp", "Oil 2 tbsp"],
      instructions: [
        "Heat oil in a heavy pot. Sauté onions until golden brown.",
        "Add ginger-garlic paste and chicken pieces. Brown for 5 minutes.",
        "Add tomatoes, curry spices, and salt. Cook until tomatoes are mushy.",
        "Pour 1 cup of warm water. Simmer covered for 20 minutes until cooked."
      ],
      calories: 420, protein: 35.0, carbs: 8.0, fat: 26.0,
    ));
  } else if (mainLower.contains('potato')) {
    list.add(Recipe(
      id: 'potato_stirfry_$timestamp',
      title: "Crispy Jeera Aloo",
      duration: "15 mins",
      ingredients: ["Potatoes 3 (boiled & cubed)", "Cumin seeds 1.5 tsp", "Green Chili 2", "Oil 1.5 tbsp"],
      instructions: [
        "Heat oil in a pan. Add cumin seeds and let them splutter.",
        "Add green chilies and boiled potato cubes. Toss gently.",
        "Add turmeric, red chili powder, salt, and mango powder.",
        "Sauté on medium-high heat for 8 minutes until crispy."
      ],
      calories: 180, protein: 3.0, carbs: 32.0, fat: 5.0,
    ));
  } else {
    // Default fallback recipes
    list.add(Recipe(
      id: 'veggie_stirfry_$timestamp',
      title: "Quick Seasoned Veggie Stir Fry",
      duration: "12 mins",
      ingredients: ["Mixed Vegetables 250g", "Soy Sauce 1 tsp", "Garlic 2 cloves", "Butter 10g"],
      instructions: [
        "Heat butter in a wok. Add minced garlic and sauté for 1 minute.",
        "Toss in sliced vegetables (capsicum, carrots, beans, onions).",
        "Stir fry on high heat for 5 minutes until crisp-tender.",
        "Add soy sauce, black pepper, and salt. Toss for another minute."
      ],
      calories: 140, protein: 4.0, carbs: 18.0, fat: 6.0,
    ));
    list.add(Recipe(
      id: 'veggie_curry_$timestamp',
      title: "Mixed Vegetable Curry",
      duration: "22 mins",
      ingredients: ["Mixed Vegetables 250g", "Onion 1", "Tomato 2", "Curry Powder 1 tsp", "Oil 1 tbsp"],
      instructions: [
        "Sauté onions and garlic in oil. Add chopped tomatoes and cook.",
        "Add mixed vegetables and toss with curry powder and salt.",
        "Add half a cup of water, cover, and simmer for 15 minutes."
      ],
      calories: 170, protein: 5.0, carbs: 22.0, fat: 7.0,
    ));
  }

  return list;
}
