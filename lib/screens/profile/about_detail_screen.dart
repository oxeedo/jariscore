import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutDetailScreen extends StatefulWidget {
  const AboutDetailScreen({super.key});

  @override
  State<AboutDetailScreen> createState() => _AboutDetailScreenState();
}

class _AboutDetailScreenState extends State<AboutDetailScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              children: [
                _buildAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeroBanner(),
                        _buildBody(),
                        _buildMentorshipParagraph(),
                        const SizedBox(height: 24),
                        _buildBulletSection(
                          title: 'Founded the African Action Congress (AAC)',
                          subtitle: '(2018, at age 47) Sowore founded the African Action Congress (AAC), a political party built around principles of accountability, social justice, equality, and people-centered governance, offering an alternative vision for Nigerian politics.',
                        ),
                        const SizedBox(height: 20),
                        _buildBulletSection(
                          title: 'Long-Distance Runner',
                          subtitle: 'Beyond politics and activism, Sowore is an accomplished long-distance runner. His dedication to endurance sports reflects discipline, resilience, perseverance, and a commitment to maintaining physical fitness—qualities he also brings to his public life.',
                        ),
                        const SizedBox(height: 34),
                        _buildFullStoryCard(),
                        const SizedBox(height: 30),
                        _buildBiographyButton(),
                        const SizedBox(height: 36),
                        _buildSocialChips(),
                        const SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 18,
              bottom: 30,
              child: GestureDetector(
                onTap: _scrollToTop,
                behavior: HitTestBehavior.opaque,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F2E24),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF0F2E24).withOpacity(0.35),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.north_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(8, 10, 16, 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Color(0xFF0F2E24),
                size: 30,
              ),
            ),
          ),
          const Expanded(
            child: Text(
              'About Jariscore',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F2E24),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              child: const Icon(
                Icons.share_outlined,
                color: Color(0xFF0F2E24),
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      width: double.infinity,
      height: 320,
      decoration: const BoxDecoration(
        color: Color(0xFF0F2E24),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF0F2E24),
                    const Color(0xFF1A3A2F).withOpacity(0.7),
                    const Color(0xFF0F2E24),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: -20,
            top: 20,
            child: Opacity(
              opacity: 0.85,
              child: Container(
                width: 180,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFFE8B04A).withOpacity(0.35),
                    width: 2,
                  ),
                  color: const Color(0xFF1A3A2F).withOpacity(0.55),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        color: const Color(0xFF0F2E24),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.directions_run_rounded,
                          color: Colors.white,
                          size: 72,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(14),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.25),
                              width: 1.2,
                            ),
                          ),
                          child: const Icon(
                            Icons.pan_tool_alt_outlined,
                            color: Color(0xFFE8B04A),
                            size: 38,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            top: 24,
            child: Transform.rotate(
              angle: -0.04,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ABOUT',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                  Text(
                    'JARISCORE',
                    style: TextStyle(
                      fontSize: 78,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.5,
                      color: const Color(0xFFE8B04A),
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(2, 3),
                          blurRadius: 6,
                        ),
                      ],
                      height: 0.92,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 22,
            bottom: 22,
            right: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTimelineBadge(
                  'UNILAG SUA President in 1992 at 21 years',
                ),
                const SizedBox(height: 10),
                _buildTimelineBadge(
                  'Fought the military from 1988 to 1999 at 18 years',
                ),
                const SizedBox(height: 10),
                _buildTimelineBadge(
                  'Founded the Sahara Foundation in 2004 at 33 years',
                ),
                const SizedBox(height: 10),
                _buildTimelineBadge(
                  'Founded and built Sahara Reporters in 2006 at 35 years',
                ),
                const SizedBox(height: 10),
                _buildTimelineBadge(
                  'A lecturer at 2 universities in the US including an Ivy (Ife Post-Colonial African History)',
                ),
                const SizedBox(height: 10),
                _buildTimelineBadge(
                  'Founded the Take It Back movement/TIB in 2007 at 36 years',
                ),
                const SizedBox(height: 10),
                _buildTimelineBadge(
                  'Founded civic media lab for free training of Journalists in 2007 at 36 years',
                ),
                const SizedBox(height: 10),
                _buildTimelineBadge(
                  'Presided and built the only ideological party in Nigeria African Action Congress AAC in 2008 at 47 years',
                ),
                const SizedBox(height: 10),
                _buildTimelineBadge(
                  'Long distance runner',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineBadge(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.only(top: 1),
          decoration: BoxDecoration(
            color: const Color(0xFFE8B04A),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: const Icon(
            Icons.circle,
            color: Color(0xFF0F2E24),
            size: 9,
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.9),
                height: 1.25,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'About Jariscore',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.4,
              color: Color(0xFF0F2E24),
              height: 1.05,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Activist, journalist, and presidential candidate for 2027.',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Color(0xFF7A6A52),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 24),
          _buildPhotoGalleryCard(),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Senator Jarigbe Agom Jarigbe: A Profile in Leadership',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.2,
                color: Color(0xFF7A6A52),
              ),
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            'Senator Jarigbe Agom Jarigbe, a Distinguished Senator of the Federal Republic of Nigeria, epitomizes integrity, dedication, and service. Born on December 9, 1970, Senator Jarigbe hails from Cross River State, where he passionately represents the Cross River North Senatorial District.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0F2E24),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoGalleryCard() {
    return Container(
      width: double.infinity,
      height: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xFFFFF8EC),
        border: Border.all(
          color: const Color(0xFFE8DFCC),
          width: 1.2,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _galleryTile(
                        bg: const Color(0xFF1A3A2F),
                        accent: const Color(0xFFE8B04A),
                        layout: 'couple',
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      flex: 3,
                      child: _galleryTile(
                        bg: const Color(0xFFE8DFCC),
                        accent: const Color(0xFF0F2E24),
                        layout: 'group',
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      flex: 2,
                      child: _galleryTile(
                        bg: const Color(0xFFD9C9A8),
                        accent: const Color(0xFF0F2E24),
                        layout: 'event',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _galleryTile(
                        bg: const Color(0xFFFFF1CC),
                        accent: const Color(0xFFC77A1A),
                        layout: 'family',
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      flex: 4,
                      child: _galleryTile(
                        bg: const Color(0xFF0F2E24),
                        accent: const Color(0xFFE8B04A),
                        layout: 'centerpiece',
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      flex: 2,
                      child: _galleryTile(
                        bg: const Color(0xFFE8DFCC),
                        accent: const Color(0xFF0F2E24),
                        layout: 'family2',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: _galleryTile(
                        bg: const Color(0xFF1A3A2F),
                        accent: const Color(0xFFE8B04A),
                        layout: 'gathering',
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      flex: 3,
                      child: _galleryTile(
                        bg: const Color(0xFFD9C9A8),
                        accent: const Color(0xFF0F2E24),
                        layout: 'couple2',
                      ),
                    ),
                    const SizedBox(width: 2),
                    Expanded(
                      flex: 2,
                      child: _galleryTile(
                        bg: const Color(0xFFFFF1CC),
                        accent: const Color(0xFFC77A1A),
                        layout: 'group2',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'A Great ❤',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic,
                        letterSpacing: -0.5,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Color(0xAA0F2E24),
                            offset: Offset(1, 2),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'FATHER',
                      style: TextStyle(
                        fontSize: 78,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1,
                        color: const Color(0xFFE8B04A),
                        height: 0.95,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.35),
                            offset: const Offset(2, 3),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 3,
                      width: 120,
                      color: Colors.white,
                      margin: const EdgeInsets.only(top: 2, bottom: 2),
                    ),
                    const Text(
                      'and',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -4),
                      child: Text(
                        'HUSBAND',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -0.5,
                          color: Colors.white,
                          height: 0.95,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.35),
                              offset: const Offset(2, 3),
                              blurRadius: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _galleryTile({
    required Color bg,
    required Color accent,
    required String layout,
  }) {
    IconData icon;
    double? size;
    switch (layout) {
      case 'couple':
        icon = Icons.people_alt_outlined;
        size = 38;
        break;
      case 'group':
        icon = Icons.groups_2_outlined;
        size = 52;
        break;
      case 'event':
        icon = Icons.celebration_outlined;
        size = 36;
        break;
      case 'family':
        icon = Icons.family_restroom_outlined;
        size = 38;
        break;
      case 'centerpiece':
        icon = Icons.auto_awesome;
        size = 44;
        break;
      case 'family2':
        icon = Icons.escalator_warning_outlined;
        size = 38;
        break;
      case 'gathering':
        icon = Icons.diversity_3_outlined;
        size = 36;
        break;
      case 'couple2':
        icon = Icons.wc_outlined;
        size = 44;
        break;
      case 'group2':
      default:
        icon = Icons.diversity_1_outlined;
        size = 36;
    }
    return Container(
      color: bg,
      alignment: Alignment.center,
      child: Icon(
        icon,
        color: accent.withOpacity(0.9),
        size: size,
      ),
    );
  }

  Widget _buildMentorshipParagraph() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 28, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Education',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.3,
              color: Color(0xFF0F2E24),
              height: 1.1,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Educationally astute, Senator Jarigbe holds Bachelor's degrees in Chemistry and Law. He also bagged a Master's degree in Criminal Law and Enforcement. This is a testament to his commitment to continuous learning and multifaceted expertise.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0F2E24),
              height: 1.55,
            ),
          ),
          SizedBox(height: 18),
          Text(
            'Politics',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.3,
              color: Color(0xFF0F2E24),
              height: 1.1,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'His political journey began as a member of the House of Representatives, where he served diligently from 2015 to 2021, earning the respect and admiration of his constituents for his unwavering advocacy and legislative acumen. In a remarkable turn of events, Senator Jarigbe transitioned to the Red Chamber of the Senate in 2021, triumphantly winning a By-Election against the Candidate of the then Governor.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0F2E24),
              height: 1.55,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Senator Jarigbe's re-election to the Senate in 2023 against an incumbent Governor of Cross River State, underscores the unwavering trust and confidence placed in him by the people he represents.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0F2E24),
              height: 1.55,
            ),
          ),
          Text(
            'In the Senate, he holds the esteemed position of Chairman of the Senate Committee on Petroleum Resources (Gas), where his strategic leadership and deep understanding of critical issues drive meaningful policy initiatives.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0F2E24),
              height: 1.55,
            ),
          ),
          Text(
            'A stalwart of the All Progressives Congress (APC), Senator Jarigbe stands as a beacon of progressive values and tireless advocacy for the betterment of his constituents and Nigeria at large.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0F2E24),
              height: 1.55,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'A GREAT HUSBAND AND FATHER',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.3,
              color: Color(0xFF0F2E24),
              height: 1.1,
            ),
          ),
          Text(
            'Beyond the political arena, Senator Jarigbe is a devoted family man, blessed with a loving spouse and four children who undoubtedly serve as a source of inspiration in his relentless pursuit of service to the nation.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0F2E24),
              height: 1.55,
            ),
          ),
          Text(
            "Senator Jarigbe's commitment to philanthropy and community development further solidifies his legacy as a compassionate leader dedicated to uplifting the lives of those he serves. His exemplary leadership, coupled with his unwavering dedication to the betterment of Nigeria, continues to inspire hope and confidence in the hearts of his constituents and citizens across the nation.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0F2E24),
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletSection({
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            margin: const EdgeInsets.only(top: 3),
            decoration: BoxDecoration(
              color: const Color(0xFFE8B04A),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: const Icon(
              Icons.check_circle_rounded,
              color: Color(0xFF0F2E24),
              size: 18,
            ),
          ),
          const SizedBox(width: 14),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F2E24),
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7A6A52),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFullStoryCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F2E24),
              Color(0xFF1A3A2F),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F2E24).withOpacity(0.22),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8B04A),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.menu_book_rounded,
                      color: Color(0xFF0F2E24),
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Read the Full Story',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Text(
                'Dive deeper into the extraordinary journey of a man who has spent his entire life fighting for a better Nigeria. From student activism at UNILAG to presidential candidate—every chapter of resilience, sacrifice, and hope.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFE8DFCC),
                  height: 1.55,
                ),
              ),
              const SizedBox(height: 22),
              Container(
                height: 66,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8B04A),
                  borderRadius: BorderRadius.circular(33),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(33),
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 14),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Read Full Biography',
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0F2E24),
                                letterSpacing: 0.2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: Color(0xFF0F2E24),
                          size: 22,
                        ),
                        SizedBox(width: 14),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBiographyButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 66,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(33),
          border: Border.all(
            color: const Color(0xFFE8DFCC),
            width: 1.5,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(33),
            onTap: () {},
            child: Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8EC),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.picture_as_pdf_outlined,
                    color: Color(0xFF0F2E24),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 14),
                const Flexible(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Download PDF Biography',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF0F2E24),
                        letterSpacing: 0.1,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.download_rounded,
                  color: Color(0xFFE8B04A),
                  size: 24,
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialChips() {
    final socials = [
      _SocialModel(icon: Icons.facebook_rounded, label: 'Facebook', color: const Color(0xFF1877F2)),
      _SocialModel(icon: Icons.alternate_email_rounded, label: 'Twitter/X', color: const Color(0xFF0F2E24)),
      _SocialModel(icon: Icons.camera_alt_rounded, label: 'Instagram', color: const Color(0xFFE1306C)),
      _SocialModel(icon: Icons.smart_display_rounded, label: 'YouTube', color: const Color(0xFFFF0000)),
      _SocialModel(icon: Icons.music_note_rounded, label: 'TikTok', color: const Color(0xFF0F2E24)),
      _SocialModel(icon: Icons.work_rounded, label: 'LinkedIn', color: const Color(0xFF0A66C2)),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Connect on Social Media',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: Color(0xFF0F2E24),
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: socials
                .map(
                  (s) => _socialChip(s.icon, s.label, s.color),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _socialChip(IconData icon, String label, Color color) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFE8DFCC),
            width: 1.3,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F2E24).withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color,
              size: 22,
            ),
            const SizedBox(width: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F2E24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialModel {
  final IconData icon;
  final String label;
  final Color color;
  _SocialModel({
    required this.icon,
    required this.label,
    required this.color,
  });
}
