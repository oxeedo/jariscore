import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'create_account_screen.dart';
import 'sign_in_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFF0F2E24),
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xFFFFF8EC),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  void _handleGetStarted() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
    );
  }

  void _handleSignIn() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8EC),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildHeroBanner(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(28, 36, 28, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeadline(),
                    const SizedBox(height: 18),
                    _buildSubtitle(),
                    const SizedBox(height: 28),
                    _buildFeatureList(),
                    const SizedBox(height: 44),
                    _buildGetStartedButton(),
                    const SizedBox(height: 22),
                    _buildSignInRow(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFF0F2E24),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28, 30, 28, 22),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 9,
                        height: 9,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE8B04A),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        'THE MOVEMENT',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.5,
                          color: Color(0xFFE8B04A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '2027',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      height: 0.95,
                      color: Colors.white,
                      letterSpacing: -2,
                      fontFamily: 'Serif',
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        height: 1.05,
                        letterSpacing: -0.5,
                        fontFamily: 'Serif',
                      ),
                      children: [
                        TextSpan(
                          text: 'JariScore',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: ' for ',
                          style: TextStyle(
                            color: Color(0xFFE8B04A),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: 'Nigeria',
                          style: TextStyle(
                            color: Color(0xFFE8B04A),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 110),
              child: CustomPaint(
                size: const Size(78, 78),
                painter: _EmblemPainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadline() {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w800,
          height: 1.2,
          color: Color(0xFF0F2E24),
          fontFamily: 'Serif',
        ),
        children: [
          const TextSpan(text: 'Build the '),
          TextSpan(
            text: 'Nigeria',
            style: TextStyle(
              color: const Color(0xFF0F2E24),
              shadows: [
                Shadow(
                  color: const Color(0xFFE8B04A).withOpacity(0.85),
                  offset: const Offset(0, 6),
                  blurRadius: 0,
                ),
              ],
              decoration: TextDecoration.underline,
              decorationColor: const Color(0xFFE8B04A),
              decorationThickness: 4,
            ),
          ),
          const TextSpan(text: ' we deserve.'),
        ],
      ),
    );
  }

  Widget _buildSubtitle() {
    return const Text(
      'Join a nationwide movement of citizens organizing for real change — together.',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Color(0xFF7A6A52),
        height: 1.45,
      ),
    );
  }

  Widget _buildFeatureList() {
    const items = [
      (
        number: '01',
        title: 'Be part of the change',
        body:
            'Join thousands of Nigerians already making a difference in their communities.',
      ),
      (
        number: '02',
        title: 'Take action',
        body:
            'Your voice, your power — turn conviction into action on the issues that matter.',
      ),
      // (
      //   number: '03',
      //   title: 'Build the Nigeria we deserve',
      //   body: 'A new Nigeria is possible — and it starts with all of us, together.',
      // ),
    ];

    return Column(
      children: [
        for (int i = 0; i < items.length; i++) ...[
          _buildFeatureItem(items[i]),
          if (i < items.length - 1)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 22),
              height: 1.5,
              color: const Color(0xFFD9C9A8).withOpacity(0.6),
            ),
        ],
      ],
    );
  }

  Widget _buildFeatureItem(({String number, String title, String body}) item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: const Color(0xFF0F2E24),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Text(
            item.number,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Color(0xFFE8B04A),
              fontFamily: 'Serif',
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0F2E24),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.body,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7A6A52),
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGetStartedButton() {
    return SizedBox(
      width: double.infinity,
      height: 72,
      child: ElevatedButton(
        onPressed: _handleGetStarted,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0F2E24),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          elevation: 0,
        ).copyWith(
          elevation: WidgetStateProperty.all(16),
          shadowColor:
              WidgetStateProperty.all(const Color(0xFF0F2E24).withOpacity(0.35)),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Get started',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.2,
              ),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.arrow_forward,
              size: 26,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInRow() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Have an account? ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xFF8A7A5C),
            ),
          ),
          GestureDetector(
            onTap: _handleSignIn,
            child: const Text(
              'Sign in',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F2E24),
                decoration: TextDecoration.underline,
                decorationColor: Color(0xFFE8B04A),
                decorationThickness: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmblemPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final outerR = size.width / 2 * 0.92;
    const sides = 7;
    const startAngle = -math.pi / 2;

    final outerPath = Path();
    for (int i = 0; i <= sides; i++) {
      final angle = startAngle + (i * 2 * math.pi / sides);
      final x = cx + outerR * math.cos(angle);
      final y = cy + outerR * math.sin(angle);
      if (i == 0) {
        outerPath.moveTo(x, y);
      } else {
        outerPath.lineTo(x, y);
      }
    }
    outerPath.close();

    final outerStroke = Paint()
      ..color = const Color(0xFFE8B04A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4;
    canvas.drawPath(outerPath, outerStroke);

    final centerDot = Paint()
      ..color = const Color(0xFFE8B04A)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(cx, cy), 5.5, centerDot);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
