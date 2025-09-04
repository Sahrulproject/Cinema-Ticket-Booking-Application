import 'package:flutter/material.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF0F1B2B),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const MovieHomeScreen(),
    );
  }
}

class MovieHomeScreen extends StatelessWidget {
  const MovieHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Profile Section
              _buildProfileSection(),
              const SizedBox(height: 24),
              // Search Bar
              _buildSearchBar(),
              const SizedBox(height: 32),
              // Playing Now Section
              _buildSectionTitle('Playing Now'),
              const SizedBox(height: 16),
              // Featured Movie Card
              _buildFeaturedMovie(),
              const SizedBox(height: 32),
              // Promo Section
              _buildSectionTitle('Promo'),
              const SizedBox(height: 16),
              // Promo Card
              _buildPromoCard(),
              const SizedBox(height: 32),
              // Now Showing Section
              _buildSectionTitle('Now Showing'),
              const SizedBox(height: 16),
              // Now Showing Movies
              _buildMovieList(
                movies: [
                  {
                    'image': 'assets/images/spider-man.png',
                    'title': 'SPIDER-MAN',
                  },
                  {'image': 'assets/images/avengers.png', 'title': 'AVENGERS'},
                  {
                    'image': 'assets/images/blackpanther.png',
                    'title': 'BLACK PANTHER',
                  },
                  {
                    'image': 'assets/images/deadpool3.png',
                    'title': 'DEADPOOL 3',
                  },
                  {
                    'image': 'assets/images/final_destination_bloodlines.png',
                    'title': 'FINAL DESTINATION',
                  },
                  {
                    'image': 'assets/images/the_death_of_snow_white.png',
                    'title': 'SNOW WHITE',
                  },
                  {
                    'image': 'assets/images/theconjuring.png',
                    'title': 'THE CONJURING',
                  },
                ],
              ),
              const SizedBox(height: 32),
              // Coming Soon Section
              _buildSectionTitle('Coming Soon'),
              const SizedBox(height: 16),
              // Coming Soon Movies
              _buildMovieList(
                movies: [
                  {
                    'image': 'assets/images/avengers-doomsday.webp',
                    'title': 'AVENGERS: DOOMSDAY',
                  },
                  {
                    'image': 'assets/images/Now_You_See_Me.png',
                    'title': 'NOW YOU SEE ME',
                  },
                  {
                    'image': 'assets/images/Spider_Man_Brand_New_Day.png',
                    'title': 'SPIDER-MAN: NEW DAY',
                  },
                  {
                    'image': 'assets/images/the_conjuring_last_rites.png',
                    'title': 'CONJURING: LAST RITES',
                  },
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk section title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Widget untuk profile section
  Widget _buildProfileSection() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blue,
          child: Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello Sahrul',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.orange, size: 16),
                const SizedBox(width: 4),
                Text(
                  'Jakarta City',
                  style: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(
            Icons.notifications_none,
            color: Colors.white,
            size: 28,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  // Widget untuk search bar
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A283C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Movie',
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk featured movie
  Widget _buildFeaturedMovie() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.blueGrey[800],
        image: const DecorationImage(
          image: AssetImage('assets/images/spiderman.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TATAPOJAN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'PG-13',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Icon(Icons.star, color: Colors.orange, size: 16),
                const SizedBox(width: 4),
                const Text(
                  '4.8/5',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk promo card
  Widget _buildPromoCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF2A3B55),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Buy 1\nGet 1 Free',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Every Monday',
                style: TextStyle(color: Colors.grey[400], fontSize: 14),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Claim Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.orange[300],
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.local_offer, color: Colors.white, size: 40),
          ),
        ],
      ),
    );
  }

  // Widget untuk movie list
  Widget _buildMovieList({required List<Map<String, String>> movies}) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: EdgeInsets.only(right: index < movies.length - 1 ? 16 : 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blueGrey[800],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      color: Colors.grey[700],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.movie,
                        color: Colors.grey[400],
                        size: 40,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movies[index]['title']!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
