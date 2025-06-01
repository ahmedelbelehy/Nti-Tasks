import 'package:flutter/material.dart';
import 'package:ui/component/theme.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = appColorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: const [
              SizedBox(height: 24),
              _HeaderText(),
              SizedBox(height: 24),
              _FilterRow(),
              SizedBox(height: 24),
              _TopCollectionSection(),
              SizedBox(height: 24),
              _BestArtistSection(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorScheme.surface,
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.save_alt_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: ''),
        ],
      ),
    );
  }
}

class _HeaderText extends StatelessWidget {
  const _HeaderText();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          fontFamily: 'SpaceGrotesk',
          color: Colors.black,
        ),
        children: [
          TextSpan(text: 'Selling the '),
          TextSpan(text: 'MOST POPULAR\n', style: TextStyle(color: Colors.green)),
          TextSpan(text: 'NFT is only here'),
        ],
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow();

  @override
  Widget build(BuildContext context) {
    final colorScheme = appColorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _FilterButton(text: 'Trending', background: colorScheme.primary),
        const _FilterButton(text: 'By Artist'),
        const _FilterButton(text: 'ETH'),
        const _FilterButton(text: 'BTC'),
      ],
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String text;
  final Color? background;

  const _FilterButton({required this.text, this.background});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 32,
      decoration: BoxDecoration(
        color: background ?? Colors.grey.shade200,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: background != null ? Colors.white : Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontFamily: 'SpaceGrotesk',
          ),
        ),
      ),
    );
  }
}

class _TopCollectionSection extends StatelessWidget {
  const _TopCollectionSection();

  @override
  Widget build(BuildContext context) {
    final colorScheme = appColorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Top Collection 🔥',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                fontFamily: 'SpaceGrotesk',
              ),
            ),
            Icon(Icons.more_horiz_outlined, color: Colors.grey[600]),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                child: Image.asset(
                  'assets/images/Type=Default, State=Product, Library=Image5.png',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hypebest Apes G',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: 'SpaceGrotesk',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(Icons.access_time, size: 14),
                        SizedBox(width: 4),
                        Text('1h 23m 32s', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 8),
                    Text(
                      'Highest Bid Today',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/Dark Ethereum Logo.png',
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              '2.23 ETH',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          ),
                          icon: Icon(Icons.gavel, color: colorScheme.surface, size: 16),
                          label: Text(
                            'Place Bid',
                            style: TextStyle(
                              color: colorScheme.surface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BestArtistSection extends StatelessWidget {
  const _BestArtistSection();

  @override
  Widget build(BuildContext context) {
    final colorScheme = appColorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Best Artist',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'SpaceGrotesk',
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Image[1].png'),
                  radius: 24,
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Darlene Robertson', style: TextStyle(fontWeight: FontWeight.w600)),
                    Text('125k Followers', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: Text(
                'Follow',
                style: TextStyle(color: colorScheme.surface),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
