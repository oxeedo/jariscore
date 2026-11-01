import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'about_detail_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFFFFFFF),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFFFFFF),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileHeader(),
                    const SizedBox(height: 16),
                    _buildStoreTile(),
                    const SizedBox(height: 12),
                    _buildSectionDivider(),
                    const SizedBox(height: 20),
                    _buildSectionHeader('ABOUT JARISCORE'),
                    const SizedBox(height: 16),
                    ..._buildAboutTiles(),
                    const SizedBox(height: 24),
                    _buildSectionDivider(),
                    const SizedBox(height: 20),
                    _buildSectionHeader('AAC'),
                    const SizedBox(height: 16),
                    ..._buildAACTiles(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.centerLeft,
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFF0F2E24),
                size: 26,
              ),
            ),
          ),
          const Spacer(),
          const Text(
            'Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F2E24),
            ),
          ),
          const Spacer(),
          const SizedBox(width: 44),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 14, 12, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFE8DFCC),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: const Text(
              'JA',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F2E24),
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Adah',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F2E24),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Jariscore 2027 supporter',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7A6A52),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreTile() {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: const Color(0xFFFFF1CC),
              borderRadius: BorderRadius.circular(16),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xFFC77A1A),
              size: 26,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Store',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F2E24),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Shop official movement merch',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7A6A52),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.open_in_new,
            color: Color(0xFF7A6A52),
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionDivider() {
    return Container(
      height: 1.2,
      color: const Color(0xFFE8DFCC),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0,
          color: const Color(0xFF7A6A52).withOpacity(0.75),
        ),
      ),
    );
  }

  void _openAboutDetail() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AboutDetailScreen()),
    );
  }

  List<Widget> _buildAboutTiles() {
    final tiles = <({IconData icon, String label, bool hasChevron, VoidCallback? onTap})>[
      (icon: Icons.person_outline_rounded, label: 'About JariScore', hasChevron: true, onTap: _openAboutDetail),
      (icon: Icons.menu_book_outlined, label: 'Biography', hasChevron: false, onTap: null),
      (icon: Icons.flag_outlined, label: 'Struggles', hasChevron: false, onTap: null),
      (icon: Icons.track_changes_outlined, label: 'My Plans', hasChevron: false, onTap: null),
      (icon: Icons.description_outlined, label: 'My Manifesto', hasChevron: false, onTap: null),
      (icon: Icons.check_circle_outline_rounded, label: 'Why Vote Jariscore', hasChevron: false, onTap: null),
      (icon: Icons.record_voice_over_outlined, label: 'Speeches, Statements & quotes', hasChevron: true, onTap: null),
      (icon: Icons.info_outline_rounded, label: 'Lies about Jariscore debunked', hasChevron: false, onTap: null),
    ];
    return [
      for (int i = 0; i < tiles.length; i++) ...[
        _buildTile(
          icon: tiles[i].icon,
          label: tiles[i].label,
          hasChevron: tiles[i].hasChevron,
          onTap: tiles[i].onTap,
        ),
        if (i < tiles.length - 1) const SizedBox(height: 4),
      ],
    ];
  }

  List<Widget> _buildAACTiles() {
    const tiles = <({IconData icon, String label, VoidCallback? onTap})>[
      (icon: Icons.person_add_outlined, label: 'Become a Member', onTap: null),
      (icon: Icons.people_outline_rounded, label: 'About the AAC', onTap: null),
    ];
    return [
      for (int i = 0; i < tiles.length; i++) ...[
        _buildTile(
          icon: tiles[i].icon,
          label: tiles[i].label,
          hasChevron: false,
          onTap: tiles[i].onTap,
        ),
        if (i < tiles.length - 1) const SizedBox(height: 4),
      ],
    ];
  }

  Widget _buildTile({
    required IconData icon,
    required String label,
    bool hasChevron = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF0F2E24),
              size: 27,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0F2E24),
                  ),
                ),
              ),
            ),
            if (hasChevron) ...[
              const SizedBox(width: 8),
              Icon(
                Icons.chevron_right,
                color: const Color(0xFF7A6A52),
                size: 24,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
