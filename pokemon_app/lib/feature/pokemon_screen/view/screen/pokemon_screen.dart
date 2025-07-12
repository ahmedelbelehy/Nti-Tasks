import 'package:advice_app/feature/pokemon_screen/model/parts_model/ability_element.dart';
import 'package:advice_app/feature/pokemon_screen/model/parts_model/game_index.dart';
import 'package:advice_app/feature/pokemon_screen/model/parts_model/held_item.dart';
import 'package:advice_app/feature/pokemon_screen/model/pokemon_model.dart';
import 'package:advice_app/feature/pokemon_screen/view_model/pokemon_cubit.dart';
import 'package:advice_app/feature/pokemon_screen/view_model/pokemon_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// --- [Dependencies] ---
// Make sure to import your model and state management files.
// For example:
// import 'view_model/pokemon_cubit.dart';
// import 'view_model/pokemon_state.dart';
// import 'model/pokemon_model.dart';


class PokemonScreen extends StatelessWidget {
  const PokemonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // The Cubit is responsible for fetching the Pokémon data.
      create: (_) => PokemonCubit()..getPokemon(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1A1A2E),
                Color(0xFF16213E),
                Color(0xFF0F3460),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: BlocBuilder<PokemonCubit, PokemonState>(
                    builder: (context, state) {
                      if (state is PokemonLoading) {
                        return _buildLoadingState();
                      } else if (state is PokemonLoaded) {
                        return _buildPokemonContent(state.pokemonModel);
                      } else if (state is PokemonError) {
                        return _buildErrorState(state.message, context);
                      }
                      // Initial state before any data is loaded
                      return _buildInitialState(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the main header for the Pokédex screen.
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: const Icon(
              Icons.catching_pokemon,
              color: Colors.yellowAccent,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pokédex',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Discover amazing Pokémon',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// UI shown while data is being fetched.
  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: const CircularProgressIndicator(
              color: Colors.yellowAccent,
              strokeWidth: 3,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Searching for Pokémon...',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  /// The main scrollable view with all Pokémon details.
  Widget _buildPokemonContent(PokemonModel pokemon) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _EnhancedPokemonCard(pokemon: pokemon),
          const SizedBox(height: 24),
          _buildStatsSection(pokemon),
          const SizedBox(height: 24),
          _buildAbilitiesSection(pokemon),
          const SizedBox(height: 24),
          _buildMovesSection(pokemon),
          const SizedBox(height: 24),
          _buildMiscDetailsSection(pokemon),
          const SizedBox(height: 24),
          _buildSpriteGallery(pokemon),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  /// Builds the section for Base Stats.
  Widget _buildStatsSection(PokemonModel pokemon) {
    return _InfoCard(
      title: 'Base Stats',
      child: Column(
        children: pokemon.stats.map((stat) => _buildStatBar(stat)).toList(),
      ),
    );
  }

  /// Builds the section for Abilities.
  Widget _buildAbilitiesSection(PokemonModel pokemon) {
    return _InfoCard(
      title: 'Abilities',
      child: Wrap(
        spacing: 12,
        runSpacing: 8,
        children:
            pokemon.abilities.map((ability) => _buildAbilityChip(ability)).toList(),
      ),
    );
  }

  /// Builds the collapsible section for the list of moves.
  Widget _buildMovesSection(PokemonModel pokemon) {
    return _InfoCard(
      isCollapsible: true,
      title: 'Moveset (${pokemon.moves.length})',
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pokemon.moves.length,
        separatorBuilder: (_, __) =>
            Divider(color: Colors.white.withOpacity(0.1)),
        itemBuilder: (context, index) {
          final move = pokemon.moves[index];
          final level = move.versionGroupDetails.isNotEmpty
              ? move.versionGroupDetails.first.levelLearnedAt
              : 0;
          return ListTile(
            dense: true,
            title: Text(_capitalize(move.move.name),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600)),
            trailing: Text(
              level > 0 ? 'Lvl $level' : 'TM/Tutor',
              style: const TextStyle(color: Colors.yellowAccent, fontSize: 12),
            ),
          );
        },
      ),
    );
  }

  /// Builds the collapsible section for other data like held items and game appearances.
  Widget _buildMiscDetailsSection(PokemonModel pokemon) {
    return _InfoCard(
      isCollapsible: true,
      title: 'Other Details',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (pokemon.heldItems.isNotEmpty)
            ..._buildHeldItems(pokemon.heldItems),
          if (pokemon.gameIndices.isNotEmpty)
            ..._buildGameIndices(pokemon.gameIndices),
        ],
      ),
    );
  }

  /// Helper to build the list of held items.
  List<Widget> _buildHeldItems(List<HeldItem> items) {
    return [
      const Text('Held Items',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      ...items.map((item) => ListTile(
            leading: const Icon(Icons.inventory_2_outlined, color: Colors.white70),
            title: Text(_capitalize(item.item.name),
                style: const TextStyle(color: Colors.white)),
            subtitle: Text(
                'Rarity: ${item.versionDetails.first.rarity}% in ${_capitalize(item.versionDetails.first.version.name)}',
                style: const TextStyle(color: Colors.white60)),
          )),
      const SizedBox(height: 16),
    ];
  }

  /// Helper to build the list of game appearances.
  List<Widget> _buildGameIndices(List<GameIndex> indices) {
    return [
      const Text('Game Appearances',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      Wrap(
        spacing: 8,
        runSpacing: 4,
        // Use toSet().toList() to show each game version only once.
        children: indices
            .map((index) => Chip(
                  label: Text(_capitalize(index.version.name)),
                  backgroundColor: Colors.white.withOpacity(0.2),
                  labelStyle: const TextStyle(color: Colors.white),
                ))
            .toSet()
            .toList(),
      )
    ];
  }

  /// Builds a gallery to show all available sprites.
  Widget _buildSpriteGallery(PokemonModel pokemon) {
    // Flatten all available sprite URLs into a single list, filtering out nulls
    final spriteUrls = [
      pokemon.sprites.frontDefault,
      pokemon.sprites.backDefault,
      pokemon.sprites.frontShiny,
      pokemon.sprites.backShiny,
      pokemon.sprites.frontFemale,
      pokemon.sprites.backFemale,
      pokemon.sprites.frontShinyFemale,
      pokemon.sprites.backShinyFemale,
    ].where((url) => url != null && url.isNotEmpty).cast<String>().toList();

    return _InfoCard(
      title: 'Sprite Gallery',
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: spriteUrls.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              spriteUrls[index],
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.broken_image, color: Colors.white30),
            ),
          );
        },
      ),
    );
  }

  /// Builds a single stat bar with its name, value, and a progress indicator.
  Widget _buildStatBar(StatElement stat) {
    final statName = _capitalize(stat.stat.name.replaceAll('-', ' '));
    final statValue = stat.baseStat;
    final progress = (statValue / 150).clamp(0.0, 1.0);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                statName,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              Text(
                '$statValue',
                style: const TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white.withOpacity(0.1),
            valueColor: AlwaysStoppedAnimation<Color>(
              _getStatColor(progress),
            ),
            minHeight: 6,
            borderRadius: BorderRadius.circular(3),
          ),
        ],
      ),
    );
  }

  /// Builds a styled chip for displaying a Pokémon's ability.
  Widget _buildAbilityChip(AbilityElement ability) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6C5CE7), Color(0xFFA29BFE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            ability.isHidden ? Icons.visibility_off : Icons.flash_on,
            color: Colors.white,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            _capitalize(ability.ability.name),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// UI for handling and displaying errors.
  Widget _buildErrorState(String message, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.red.withOpacity(0.3)),
              ),
              child: const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 48,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Oops! Something went wrong',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                context.read<PokemonCubit>().getPokemon();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellowAccent,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text(
                'Try Again',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// UI shown before the first data load.
  Widget _buildInitialState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: const Icon(
              Icons.catching_pokemon,
              color: Colors.yellowAccent,
              size: 64,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Ready to discover Pokémon?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Tap the button below to start your adventure!',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              context.read<PokemonCubit>().getPokemon();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellowAccent,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
            ),
            child: const Text(
              'Find Pokémon',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Helper function to determine stat bar color.
  Color _getStatColor(double progress) {
    if (progress < 0.3) return Colors.red;
    if (progress < 0.6) return Colors.orange;
    if (progress < 0.8) return Colors.yellow;
    return Colors.green;
  }
}

/// A custom, animated card for displaying the main Pokémon details.
class _EnhancedPokemonCard extends StatefulWidget {
  final PokemonModel pokemon;
  const _EnhancedPokemonCard({required this.pokemon});

  @override
  State<_EnhancedPokemonCard> createState() => _EnhancedPokemonCardState();
}

class _EnhancedPokemonCardState extends State<_EnhancedPokemonCard>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _floatingController;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _floatingAnimation;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.2, 0.8, curve: Curves.easeOutBack),
    ));

    _rotationAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),
    ));

    _floatingAnimation = Tween<double>(
      begin: -10,
      end: 10,
    ).animate(CurvedAnimation(
      parent: _floatingController,
      curve: Curves.easeInOut,
    ));

    _mainController.forward();
    _floatingController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _mainController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = widget.pokemon;
    final primaryType =
        pokemon.types.isNotEmpty ? pokemon.types.first.type.name : 'normal';

    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _getTypeGradient(primaryType),
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                color: _getTypeColor(primaryType).withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            children: [
              _buildBackgroundPattern(),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    _buildPokemonImage(pokemon),
                    const SizedBox(height: 24),
                    _buildPokemonInfo(pokemon),
                    const SizedBox(height: 24),
                    _buildActionButtons(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackgroundPattern() {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Stack(
          children: [
            Positioned(
              top: -50,
              right: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              bottom: -30,
              left: -30,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.03),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokemonImage(PokemonModel pokemon) {
    return AnimatedBuilder(
      animation: _floatingController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatingAnimation.value),
          child: AnimatedBuilder(
            animation: _rotationAnimation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationAnimation.value * 0.1,
                child: Container(
                  width: 180,
                  height: 180,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.network(
                      pokemon.sprites.other.officialArtwork.frontDefault ??
                          pokemon.sprites.frontDefault,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.catching_pokemon,
                          color: Colors.white,
                          size: 80,
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildPokemonInfo(PokemonModel pokemon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '#${pokemon.id.toString().padLeft(3, '0')}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          _capitalize(pokemon.name),
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildTypeChips(pokemon.types),
        const SizedBox(height: 16),
        _buildPhysicalStats(pokemon),
      ],
    );
  }

  Widget _buildTypeChips(List<TypeElement> types) {
    return Wrap(
      spacing: 8,
      children: types.map((type) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: Text(
            _capitalize(type.type.name),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPhysicalStats(PokemonModel pokemon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem(
            'Height', '${(pokemon.height / 10).toStringAsFixed(1)}m', Icons.height),
        _buildStatItem('Weight',
            '${(pokemon.weight / 10).toStringAsFixed(1)}kg', Icons.fitness_center),
        _buildStatItem('XP', '${pokemon.baseExperience}', Icons.star),
      ],
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white.withOpacity(0.8),
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              context.read<PokemonCubit>().getPokemon();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
              elevation: 8,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh, size: 20),
                SizedBox(width: 8),
                Text(
                  'Find Another',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            onPressed: () {
              // TODO: Implement favorite functionality
            },
            icon: const Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }

  List<Color> _getTypeGradient(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return [const Color(0xFFFF6B6B), const Color(0xFFFF8E53)];
      case 'water':
        return [const Color(0xFF4ECDC4), const Color(0xFF44A08D)];
      case 'grass':
        return [const Color(0xFF56CCF2), const Color(0xFF2F80ED)];
      case 'electric':
        return [const Color(0xFFFFD93D), const Color(0xFF6BCF7F)];
      case 'psychic':
        return [const Color(0xFFFF8A80), const Color(0xFFFF80AB)];
      case 'ice':
        return [const Color(0xFF81ECEC), const Color(0xFF6C5CE7)];
      case 'dragon':
        return [const Color(0xFFD63031), const Color(0xFF74B9FF)];
      case 'dark':
        return [const Color(0xFF2D3436), const Color(0xFF636E72)];
      case 'fairy':
        return [const Color(0xFFFD79A8), const Color(0xFFE17055)];
      default:
        return [const Color(0xFF6C5CE7), const Color(0xFFA29BFE)];
    }
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return const Color(0xFFFF6B6B);
      case 'water':
        return const Color(0xFF4ECDC4);
      case 'grass':
        return const Color(0xFF56CCF2);
      case 'electric':
        return const Color(0xFFFFD93D);
      case 'psychic':
        return const Color(0xFFFF8A80);
      default:
        return const Color(0xFF6C5CE7);
    }
  }
}

/// A custom reusable card for displaying sections of information.
class _InfoCard extends StatelessWidget {
  final String title;
  final Widget child;
  final bool isCollapsible;

  const _InfoCard({
    required this.title,
    required this.child,
    this.isCollapsible = false,
  });

  @override
  Widget build(BuildContext context) {
    final cardContent = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: isCollapsible
          ? ExpansionTile(
              title: Text(title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              iconColor: Colors.white,
              collapsedIconColor: Colors.white70,
              childrenPadding: const EdgeInsets.all(16).copyWith(top: 0),
              children: [child],
            )
          : Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  child,
                ],
              ),
            ),
    );

    return cardContent;
  }
}

/// Utility function to capitalize the first letter of a string.
String _capitalize(String s) =>
    s.isNotEmpty ? s[0].toUpperCase() + s.substring(1) : s;