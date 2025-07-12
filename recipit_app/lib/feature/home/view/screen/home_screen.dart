import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:recipit_app/feature/home/model/recipit_model.dart';
import 'package:recipit_app/feature/home/view_model/recipit_cubit.dart';
import 'package:recipit_app/feature/home/view_model/recipit_state.dart';

// Main Recipe Screen
class RecipeScreen extends StatefulWidget {
  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen>
    with TickerProviderStateMixin {
  late AnimationController _loadingController;
  late AnimationController _listController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _loadingController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _listController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _listController, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _listController, curve: Curves.easeOut));

    // Start loading animation
    _loadingController.repeat();
  }

  @override
  void dispose() {
    _loadingController.dispose();
    _listController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF667eea), Color(0xFF764ba2)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: BlocConsumer<RecipitCubit, RecipitState>(
                  listener: (context, state) {
                    if (state is RecipitLoaded) {
                      _loadingController.stop();
                      _listController.forward();
                    }
                  },
                  builder: (context, state) {
                    if (state is RecipitLoading) {
                      return _buildLoadingView();
                    } else if (state is RecipitLoaded) {
                      return _buildRecipeList(state.recipeListModel.recipes);
                    } else if (state is RecipitError) {
                      return _buildErrorView(state.errorMessage);
                    }
                    return _buildInitialView();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 800),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, -50 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    'Recipe Haven',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Discover amazing recipes from around the world',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadingView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCookingAnimation(),
          SizedBox(height: 30),
          TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 1000),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Text(
                  'Cooking up something special...',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCookingAnimation() {
    return Container(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Pot
          Positioned(
            bottom: 40,
            child: Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF444444), Color(0xFF666666)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
            ),
          ),
          // Lid
          AnimatedBuilder(
            animation: _loadingController,
            builder: (context, child) {
              return Positioned(
                bottom: 110 + (5 * (_loadingController.value * 2 - 1).abs()),
                child: Container(
                  width: 140,
                  height: 20,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF555555), Color(0xFF777777)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              );
            },
          ),
          // Steam
          ...List.generate(4, (index) {
            return AnimatedBuilder(
              animation: _loadingController,
              builder: (context, child) {
                double delay = index * 0.2;
                double animationValue =
                    (_loadingController.value + delay) % 1.0;
                return Positioned(
                  bottom: 130 + (30 * animationValue),
                  left: 85 + (index * 10.0),
                  child: Opacity(
                    opacity: 1 - animationValue,
                    child: Container(
                      width: 4,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Recipe? _selectedRecipe;

  Widget _buildRecipeList(List<Recipe> recipes) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          padding: EdgeInsets.all(20),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
              childAspectRatio: 0.75,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return TweenAnimationBuilder<double>(
                duration: Duration(milliseconds: 600 + (index * 100)),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedRecipe = recipes[index];
                      });
                      Future.delayed(Duration(milliseconds: 600), () {
                        _showRecipeDetails(recipes[index]);
                        setState(() {
                          _selectedRecipe = null;
                        });
                      });
                    },
                    child: Transform.translate(
                      offset: Offset(0, 50 * (1 - value)),
                      child: Opacity(
                        opacity: value,
                        child: _buildRecipeCard(recipes[index]),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeCard(Recipe recipe) {
    final isSelected = _selectedRecipe == recipe;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRecipe = recipe;
        });
        Future.delayed(const Duration(milliseconds: 600), () {
          _showRecipeDetails(recipe);
          setState(() {
            _selectedRecipe = null;
          });
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: isSelected ? 500 : 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? Color(0xFF764ba2).withOpacity(0.25)
                  : Colors.black.withOpacity(0.08),
              blurRadius: isSelected ? 24 : 12,
              offset: Offset(0, isSelected ? 12 : 6),
            ),
          ],
        ),
        child: Stack(
          children: [
            Hero(
              tag: recipe.image + recipe.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: AnimatedScale(
                  scale: isSelected ? 1.05 : 1.0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeOutBack,
                  child: CachedNetworkImage(
                    imageUrl: recipe.image,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.restaurant,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.restaurant,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Gradient overlay (shown on tap)
            AnimatedOpacity(
              opacity: isSelected ? 1.0 : 0.0,
              duration: Duration(milliseconds: 400),
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF667eea).withOpacity(0.85),
                      Color(0xFF764ba2).withOpacity(0.85),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 400),
                        style: TextStyle(
                          fontSize: isSelected ? 28 : 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Text(recipe.name, textAlign: TextAlign.center),
                      ),
                      SizedBox(height: 10),
                      AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 400),
                        style: TextStyle(
                          fontSize: isSelected ? 18 : 16,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        child: Text(recipe.cuisine),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Info at bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Color(0xFF764ba2).withOpacity(0.95)
                      : Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(24),
                  ),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16),
                        SizedBox(width: 4),
                        Text(
                          recipe.rating.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.white
                                : Color(0xFF333333),
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          '(${recipe.reviewCount})',
                          style: TextStyle(
                            fontSize: 12,
                            color: isSelected
                                ? Colors.white70
                                : Color(0xFF666666),
                          ),
                        ),
                      ],
                    ),
                    _buildInfoChip(
                      Icons.access_time,
                      '${recipe.prepTimeMinutes + recipe.cookTimeMinutes} min',
                    ),
                    _buildInfoChip(
                      Icons.local_fire_department,
                      '${recipe.caloriesPerServing} cal',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRecipeDetails(Recipe recipe) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RecipeDetailScreen(recipe: recipe),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  Widget _buildInitialView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant_menu,
            size: 80,
            color: Colors.white.withOpacity(0.8),
          ),
          SizedBox(height: 20),
          Text(
            'Ready to explore delicious recipes?',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => context.read<RecipitCubit>().getRecipts(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF667eea),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 5,
            ),
            child: Text(
              'Load Recipes',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorView(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 80,
            color: Colors.white.withOpacity(0.8),
          ),
          SizedBox(height: 20),
          Text(
            'Oops! Something went wrong',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            error,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => context.read<RecipitCubit>().getRecipts(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Color(0xFF667eea),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 5,
            ),
            child: Text(
              'Try Again',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for info chip
  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Color(0xFF666666)),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF666666),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

// Recipe Detail Screen
class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;

  RecipeDetailScreen({required this.recipe});

  @override
  _RecipeDetailScreenState createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                backgroundColor: Color(0xFF667eea),
                flexibleSpace: FlexibleSpaceBar(
                  background: CachedNetworkImage(
                    imageUrl: widget.recipe.image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.restaurant,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey[300],
                      child: Icon(
                        Icons.restaurant,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRecipeHeader(),
                      SizedBox(height: 30),
                      _buildRecipeStats(),
                      SizedBox(height: 30),
                      _buildTags(),
                      SizedBox(height: 30),
                      _buildIngredients(),
                      SizedBox(height: 30),
                      _buildInstructions(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecipeHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.recipe.name,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        SizedBox(height: 8),
        Text(
          widget.recipe.cuisine,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF666666),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 20),
            SizedBox(width: 4),
            Text(
              widget.recipe.rating.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            SizedBox(width: 4),
            Text(
              '(${widget.recipe.reviewCount} reviews)',
              style: TextStyle(fontSize: 14, color: Color(0xFF666666)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecipeStats() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            Icons.access_time,
            'Prep Time',
            '${widget.recipe.prepTimeMinutes} min',
          ),
          _buildStatItem(
            Icons.local_fire_department,
            'Cook Time',
            '${widget.recipe.cookTimeMinutes} min',
          ),
          _buildStatItem(Icons.people, 'Servings', '${widget.recipe.servings}'),
          _buildStatItem(Icons.speed, 'Difficulty', widget.recipe.difficulty),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Color(0xFF667eea)),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, color: Color(0xFF666666))),
      ],
    );
  }

  Widget _buildTags() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tags',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: widget.recipe.tags.map((tag) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Color(0xFF667eea).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFF667eea).withOpacity(0.3)),
              ),
              child: Text(
                tag,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF667eea),
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildIngredients() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        SizedBox(height: 15),
        ...widget.recipe.ingredients.asMap().entries.map((entry) {
          int index = entry.key;
          String ingredient = entry.value;
          return TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 400 + (index * 100)),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(-50 * (1 - value), 0),
                child: Opacity(
                  opacity: value,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 8),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFFE0E0E0)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: Color(0xFF667eea),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            ingredient,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ],
    );
  }

  Widget _buildInstructions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instructions',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        SizedBox(height: 15),
        ...widget.recipe.instructions.asMap().entries.map((entry) {
          int index = entry.key;
          String instruction = entry.value;
          return TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 400 + (index * 100)),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(50 * (1 - value), 0),
                child: Opacity(
                  opacity: value,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Color(0xFF667eea),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            instruction,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF333333),
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ],
    );
  }
}
