import 'dart:async';
import 'package:flutter/material.dart';
import '../profile/profile_screen.dart';

class JariscoreHomeColors {
  JariscoreHomeColors._();

  static const Color darkGreen = Color(0xFF0F2E24);
  static const Color mediumGreen = Color(0xFF1A3A2F);
  static const Color gold = Color(0xFFE8B04A);
  static const Color goldDark = Color(0xFFC77A1A);
  static const Color goldSoft = Color(0xFFFFF1CC);
  static const Color cream = Color(0xFFFFF8EC);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF0F2E24);
  static const Color textMuted = Color(0xFF7A6A52);
  static const Color borderSoft = Color(0xFFE8DFCC);
  static const Color avatarBg = Color(0xFF0F2E24);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _showLevelCard = true;
  late Timer _countdownTimer;
  Duration _remaining = const Duration(days: 147, hours: 17, minutes: 33, seconds: 31);

  @override
  void initState() {
    super.initState();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remaining.inSeconds > 0) {
          _remaining = _remaining - const Duration(seconds: 1);
        }
      });
    });
  }

  @override
  void dispose() {
    _countdownTimer.cancel();
    super.dispose();
  }

  void _openProfile() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  String _pad(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JariscoreHomeColors.cream,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    if (_showLevelCard) _buildLevelCard(),
                    if (_showLevelCard) const SizedBox(height: 16),
                    _buildBriefingCard(),
                    const SizedBox(height: 20),
                    _buildCountdownBanner(),
                    const SizedBox(height: 22),
                    _buildActionButtons(),
                    const SizedBox(height: 22),
                    _buildLocationCard(),
                    const SizedBox(height: 30),
                    _buildLatestNewsHeader(),
                    const SizedBox(height: 18),
                    _buildNewsCard(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildAppBar() {
    return Container(
      color: JariscoreHomeColors.cream,
      padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
      child: Row(
        children: [
          _buildAppLogo(),
          const SizedBox(width: 10),
          Flexible(
            child: RichText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'JARISCORE',
                    style: TextStyle(
                      color: JariscoreHomeColors.darkGreen,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.4,
                    ),
                  ),
                  TextSpan(
                    text: 'NOW',
                    style: TextStyle(
                      color: JariscoreHomeColors.gold,
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          _buildAppBarIcon(Icons.search),
          const SizedBox(width: 2),
          _buildAppBarIcon(Icons.chat_bubble_outline_rounded),
          const SizedBox(width: 2),
          _buildAppBarIcon(Icons.notifications_none_rounded),
          const SizedBox(width: 6),
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: JariscoreHomeColors.avatarBg,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text(
              'JA',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppLogo() {
    return GestureDetector(
      onTap: _openProfile,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: JariscoreHomeColors.darkGreen,
          borderRadius: BorderRadius.circular(14),
        ),
        alignment: Alignment.center,
        child: const Icon(
          Icons.menu_rounded,
          color: JariscoreHomeColors.gold,
          size: 26,
        ),
      ),
    );
  }

  Widget _buildAppBarIcon(IconData icon) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Icon(
        icon,
        color: JariscoreHomeColors.darkGreen,
        size: 26,
      ),
    );
  }

  Widget _buildLevelCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: JariscoreHomeColors.cardWhite,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: JariscoreHomeColors.borderSoft, width: 1.2),
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: JariscoreHomeColors.gold,
                  borderRadius: BorderRadius.circular(18),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.star_rounded,
                  color: Colors.white,
                  size: 34,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Level 1 · Seedling',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: JariscoreHomeColors.textDark,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "You've taken the first step",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: JariscoreHomeColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        Positioned(
          top: 6,
          right: 8,
          child: GestureDetector(
            onTap: () => setState(() => _showLevelCard = false),
            behavior: HitTestBehavior.opaque,
            child: const SizedBox(
              width: 34,
              height: 34,
              child: Icon(
                Icons.close,
                color: JariscoreHomeColors.textMuted,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBriefingCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: JariscoreHomeColors.cardWhite,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: JariscoreHomeColors.borderSoft, width: 1.2),
      ),
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: JariscoreHomeColors.darkGreen,
              borderRadius: BorderRadius.circular(18),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.menu_book_rounded,
              color: JariscoreHomeColors.gold,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's briefing",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: JariscoreHomeColors.textDark,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '0 key points',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: JariscoreHomeColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: JariscoreHomeColors.textDark,
            size: 28,
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownBanner() {
    final days = _remaining.inDays;
    final hours = _remaining.inHours.remainder(24);
    final minutes = _remaining.inMinutes.remainder(60);
    final seconds = _remaining.inSeconds.remainder(60);

    return Container(
      width: double.infinity,
      height: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: JariscoreHomeColors.darkGreen.withOpacity(0.22),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1542362567-b07e54358753?auto=format&fit=crop&w=1200&q=80',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      JariscoreHomeColors.mediumGreen,
                      JariscoreHomeColors.darkGreen,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    JariscoreHomeColors.darkGreen.withOpacity(0.82),
                    JariscoreHomeColors.darkGreen.withOpacity(0.45),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    JariscoreHomeColors.darkGreen.withOpacity(0.82),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 22,
            top: 20,
            right: 22,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2027',
                        style: TextStyle(
                          fontSize: 46,
                          fontWeight: FontWeight.w900,
                          color: Colors.white.withOpacity(0.98),
                          height: 1,
                          letterSpacing: -1,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.45),
                              offset: const Offset(2, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "IT'S  JARISCORE  O'CLOCK",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0.4,
                              color: JariscoreHomeColors.gold.withOpacity(0.98),
                              height: 1,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.4),
                                  offset: const Offset(2, 2),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 36,
                  height: 36,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.crop_square_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 22,
            top: 82,
            right: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SENATORIAL ELECTION',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 3.2,
                    color: JariscoreHomeColors.goldSoft,
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Expanded(
                      child: _buildCountdownOverlayCell(
                        days.toString(),
                        'DAYS',
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      ':',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: JariscoreHomeColors.gold,
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: _buildCountdownOverlayCell(
                        _pad(hours),
                        'HOURS',
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      ':',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: JariscoreHomeColors.gold,
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: _buildCountdownOverlayCell(
                        _pad(minutes),
                        'MINS',
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      ':',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: JariscoreHomeColors.gold,
                        height: 1,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: _buildCountdownOverlayCell(
                        _pad(seconds),
                        'SECS',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownOverlayCell(String value, String label) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 54,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1,
              letterSpacing: -1,
            ),
          ),
        ),
        const SizedBox(height: 6),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.8,
              color: Colors.white.withOpacity(0.85),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _buildActionChip(
            icon: Icons.person_outline_rounded,
            label: 'Volunteer',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 3,
          child: _buildActionChip(
            icon: Icons.people_alt_outlined,
            label: 'Coordinators',
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: JariscoreHomeColors.cardWhite,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: JariscoreHomeColors.borderSoft, width: 1.2),
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.favorite_border_rounded,
            color: JariscoreHomeColors.textDark,
            size: 26,
          ),
        ),
      ],
    );
  }

  Widget _buildActionChip({
    required IconData icon,
    required String label,
  }) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        color: JariscoreHomeColors.cardWhite,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: JariscoreHomeColors.borderSoft, width: 1.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: JariscoreHomeColors.textDark,
            size: 26,
          ),
          const SizedBox(width: 5),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: JariscoreHomeColors.textDark,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: JariscoreHomeColors.cream,
        borderRadius: BorderRadius.circular(24),
        border: const DashedGoldBorder(),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: JariscoreHomeColors.darkGreen,
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.location_on_rounded,
                color: JariscoreHomeColors.gold,
                size: 22,
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              'Add your state or share your location to see supporters near you.',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: JariscoreHomeColors.textDark,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLatestNewsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Latest News',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: JariscoreHomeColors.textDark,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'View more',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: JariscoreHomeColors.goldDark,
              ),
            ),
            SizedBox(width: 2),
            Icon(
              Icons.chevron_right,
              color: JariscoreHomeColors.goldDark,
              size: 22,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNewsCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: JariscoreHomeColors.cardWhite,
        border: Border.all(
          color: JariscoreHomeColors.borderSoft,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: JariscoreHomeColors.darkGreen.withOpacity(0.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 280,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=1200&q=80',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                JariscoreHomeColors.mediumGreen,
                                JariscoreHomeColors.darkGreen,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            colors: [
                              JariscoreHomeColors.darkGreen.withOpacity(0.55),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              JariscoreHomeColors.darkGreen.withOpacity(0.65),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Center(
                    //   child: Container(
                    //     width: 240,
                    //     height: 240,
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       gradient: LinearGradient(
                    //         begin: Alignment.topLeft,
                    //         end: Alignment.bottomRight,
                    //         colors: [
                    //           JariscoreHomeColors.mediumGreen.withOpacity(0.95),
                    //           JariscoreHomeColors.darkGreen.withOpacity(0.95),
                    //         ],
                    //       ),
                    //       border: Border.all(
                    //         color: JariscoreHomeColors.gold,
                    //         width: 4,
                    //       ),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: JariscoreHomeColors.darkGreen
                    //               .withOpacity(0.28),
                    //           blurRadius: 30,
                    //           offset: const Offset(0, 12),
                    //         ),
                    //       ],
                    //     ),
                    //     alignment: Alignment.center,
                    //     child: const Icon(
                    //       Icons.person_rounded,
                    //       color: Colors.white,
                    //       size: 150,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          decoration: BoxDecoration(
                            color: JariscoreHomeColors.cream,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Text(
                            'General',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: JariscoreHomeColors.textMuted,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 6),
                          child: const Text(
                            'Featured',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: JariscoreHomeColors.goldDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.only(right: 70),
                      child: Text(
                        'Jariscore to speak at NBA 66th annual conference',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: JariscoreHomeColors.textDark,
                          height: 1.25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 16,
            bottom: 58,
            child: Container(
              width: 68,
              height: 68,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: JariscoreHomeColors.gold,
                boxShadow: [
                  BoxShadow(
                    color: JariscoreHomeColors.gold.withOpacity(0.35),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: const Icon(
                Icons.auto_awesome_rounded,
                color: JariscoreHomeColors.darkGreen,
                size: 32,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    const items = <({IconData icon, IconData activeIcon, String label})>[
      (
        icon: Icons.house_outlined,
        activeIcon: Icons.house_rounded,
        label: 'Home',
      ),
      (
        icon: Icons.newspaper_outlined,
        activeIcon: Icons.newspaper_rounded,
        label: 'News',
      ),
      (
        icon: Icons.location_on_outlined,
        activeIcon: Icons.location_on_rounded,
        label: 'Community',
      ),
      (
        icon: Icons.favorite_border_rounded,
        activeIcon: Icons.volunteer_activism_rounded,
        label: 'Donate',
      ),
      (
        icon: Icons.person_outline_rounded,
        activeIcon: Icons.person_rounded,
        label: 'Profile',
      ),
    ];
    final bottomInset = MediaQuery.of(context).viewPadding.bottom;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: JariscoreHomeColors.borderSoft,
            width: 0.8,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10 + bottomInset),
        child: Row(
          children: List.generate(items.length, (i) {
            final item = items[i];
            final active = _currentIndex == i;
            final color =
                active ? JariscoreHomeColors.darkGreen : JariscoreHomeColors.textMuted;
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  if (i == 4) {
                    _openProfile();
                  } else {
                    setState(() => _currentIndex = i);
                  }
                },
                behavior: HitTestBehavior.opaque,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      active ? item.activeIcon : item.icon,
                      color: color,
                      size: 30,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: active ? FontWeight.w800 : FontWeight.w600,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (active)
                      Container(
                        width: 22,
                        height: 4,
                        decoration: BoxDecoration(
                          color: JariscoreHomeColors.darkGreen,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      )
                    else
                      const SizedBox(height: 4),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class DashedGoldBorder extends BoxBorder {
  const DashedGoldBorder();

  @override
  BorderSide get top => const BorderSide(
        color: JariscoreHomeColors.gold,
        width: 1.5,
      );

  @override
  BorderSide get bottom => const BorderSide(
        color: JariscoreHomeColors.gold,
        width: 1.5,
      );

  @override
  EdgeInsetsGeometry get dimensions => const EdgeInsets.all(1.5);

  @override
  bool get isUniform => true;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    const dash = 7.0;
    const gap = 5.0;
    final color = JariscoreHomeColors.gold.withOpacity(0.85);
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final rrect = borderRadius != null
        ? RRect.fromRectAndCorners(
            rect,
            topLeft: borderRadius.topLeft,
            topRight: borderRadius.topRight,
            bottomLeft: borderRadius.bottomLeft,
            bottomRight: borderRadius.bottomRight,
          )
        : RRect.fromRectAndRadius(rect, const Radius.circular(24));

    final path = Path()..addRRect(rrect);
    _drawDashedPath(canvas, path, paint, dash, gap);
  }

  void _drawDashedPath(
    Canvas canvas,
    Path source,
    Paint paint,
    double dash,
    double gap,
  ) {
    final metrics = source.computeMetrics().toList();
    for (final metric in metrics) {
      double distance = 0;
      while (distance < metric.length) {
        final len = (distance + dash) > metric.length
            ? metric.length - distance
            : dash;
        final extracted = metric.extractPath(distance, distance + len);
        canvas.drawPath(extracted, paint);
        distance += dash + gap;
      }
    }
  }

  @override
  ShapeBorder scale(double t) => this;
}
