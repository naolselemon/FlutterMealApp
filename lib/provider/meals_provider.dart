import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:meal_app/data/dummy_dart.dart";

final mealsProvider = Provider((ref) => dummyMeals);
