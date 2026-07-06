import 'package:flutter/material.dart';
import '../../backend/models.dart';
import '../../providers/db_provider.dart';

class SavedRecipesViewModel extends ChangeNotifier {
  final DbProvider _dbProvider;
  List<SavedRecipeModel> _filteredRecipes = [];
  String _searchQuery = '';

  SavedRecipesViewModel(this._dbProvider) {
    _filterRecipes();
    _dbProvider.addListener(_onDbChanged);
  }

  @override
  void dispose() {
    _dbProvider.removeListener(_onDbChanged);
    super.dispose();
  }

  void _onDbChanged() {
    _filterRecipes();
    notifyListeners();
  }

  List<SavedRecipeModel> get savedRecipes => _filteredRecipes;
  String get searchQuery => _searchQuery;

  void search(String query) {
    _searchQuery = query;
    _filterRecipes();
    notifyListeners();
  }

  void _filterRecipes() {
    final allRecipes = _dbProvider.savedRecipes;
    if (_searchQuery.trim().isEmpty) {
      _filteredRecipes = List.from(allRecipes);
    } else {
      final query = _searchQuery.toLowerCase();
      _filteredRecipes = allRecipes.where((recipe) {
        return recipe.title.toLowerCase().contains(query) ||
            recipe.ingredients.any((ing) => ing.toLowerCase().contains(query));
      }).toList();
    }
  }

  Future<void> deleteRecipe(String id) async {
    await _dbProvider.deleteRecipe(id);
  }

  bool isRecipeSaved(String id) {
    return _dbProvider.isRecipeSaved(id);
  }
}
