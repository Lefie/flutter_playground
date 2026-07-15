import 'package:flutter/material.dart';

class PracticeScreen extends StatefulWidget {
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
  int _selectedOption = 0;

  static const _pageBackground = Color(0xFFFFEBD9);
  static const _contentBackground = Color(0xFFF8F4FF);
  static const _navBorder = Color(0xFFE4DFF0);
  static const _navMuted = Color(0xFFB9AFD3);
  static const _navActive = Color(0xFF7A67E8);
  static const _textPrimary = Color(0xFF171A2F);
  static const _textSecondary = Color(0xFF343851);
  static const _selectedPurple = Color(0xFF7B68FF);
  static const _selectedFill = Color(0xFFF2EEFF);
  static const _tryButton = Color(0xFFFF7459);

  final List<_PracticeOption> _options = const [
    _PracticeOption(
        letter: 'A', text: 'Ask "Can I play?" 😊', color: Color(0xFF8475EE)),
    _PracticeOption(
        letter: 'B', text: 'Watch first 👀', color: Color(0xFFFFA970)),
    _PracticeOption(
        letter: 'C', text: 'Find a grown-up 🧑‍🏫', color: Color(0xFF79D9B6)),
    _PracticeOption(
        letter: 'D', text: 'Play on my own 🎨', color: Color(0xFFE999BE)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _contentBackground,
      body: Column(
        children: [
          Container(
            color: _pageBackground,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 18, 30, 16),
                child: _buildHeader(),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(30, 16, 30, 18),
              children: [
                _buildLessonCard(),
                const SizedBox(height: 16),
                _buildEncouragementCard(),
                const SizedBox(height: 24),
                Text(
                  'What would you do? 🤔',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: _textSecondary,
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 12),
                for (var index = 0; index < _options.length; index++) ...[
                  _buildOptionTile(index),
                  if (index != _options.length - 1) const SizedBox(height: 12),
                ],
                const SizedBox(height: 28),
                SizedBox(
                  height: 56,
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      backgroundColor: _tryButton,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Try it!',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward_rounded, size: 22),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHeader() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: const [
            Text(
              'PRACTICE',
              style: TextStyle(
                color: Color(0xFFFF7558),
                fontSize: 10,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 3),
            Text(
              'What would you do?',
              style: TextStyle(
                color: _textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: _roundIconButton(Icons.arrow_back_ios_new_rounded),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: _roundIconButton(Icons.info_rounded, iconColor: _navActive),
        ),
      ],
    );
  }

  Widget _roundIconButton(IconData icon, {Color iconColor = _textSecondary}) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: iconColor, size: 19),
    );
  }

  Widget _buildLessonCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        height: 230,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/practice_recess.png',
              fit: BoxFit.cover,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.06),
                    _selectedPurple.withValues(alpha: 0.58),
                  ],
                  stops: const [0.42, 0.65, 1],
                ),
              ),
            ),
            Positioned(
              left: 14,
              top: 12,
              child: _badge(
                icon: '⚽',
                label: 'RECESS',
                background: Colors.white,
                foreground: _textPrimary,
              ),
            ),
            Positioned(
              right: 14,
              top: 12,
              child: _badge(
                icon: '⚡',
                label: '+20 XP',
                background: Colors.white.withValues(alpha: 0.45),
                foreground: Colors.white,
              ),
            ),
            const Positioned(
              left: 14,
              right: 14,
              bottom: 14,
              child: Text(
                'Want to join the game? ⚽',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  height: 1.08,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge({
    required String icon,
    required String label,
    required Color background,
    required Color foreground,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: foreground,
              fontSize: 11,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEncouragementCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFCF6E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.88),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: const Text('🦊', style: TextStyle(fontSize: 26)),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'No wrong answer! 🧡',
              style: TextStyle(
                color: Color(0xFF473514),
                fontSize: 14,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionTile(int index) {
    final option = _options[index];
    final isSelected = index == _selectedOption;

    return Material(
      color: isSelected ? _selectedFill : Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          setState(() {
            _selectedOption = index;
          });
        },
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? _selectedPurple : Colors.transparent,
              width: 2,
            ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 14),
            leading: CircleAvatar(
              radius: 18,
              backgroundColor: option.color,
              child: Text(
                option.letter,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            title: Text(
              option.text,
              style: const TextStyle(
                color: _textPrimary,
                fontSize: 15.5,
                fontWeight: FontWeight.w900,
              ),
            ),
            trailing: isSelected
                ? const CircleAvatar(
                    radius: 10,
                    backgroundColor: _selectedPurple,
                    child: Icon(Icons.check_rounded,
                        color: Colors.white, size: 15),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    const items = [
      _NavItem(icon: Icons.home_rounded, label: 'Home'),
      _NavItem(icon: Icons.menu_book_rounded, label: 'Library'),
      _NavItem(icon: Icons.extension_rounded, label: 'Practice'),
      _NavItem(icon: Icons.show_chart_rounded, label: 'Growth'),
      _NavItem(icon: Icons.person_rounded, label: 'Profile'),
    ];

    return Container(
      height: 86,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: _navBorder)),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (final item in items)
              _BottomNavItem(
                item: item,
                isSelected: item.label == 'Practice',
              ),
          ],
        ),
      ),
    );
  }
}

class _PracticeOption {
  const _PracticeOption({
    required this.letter,
    required this.text,
    required this.color,
  });

  final String letter;
  final String text;
  final Color color;
}

class _NavItem {
  const _NavItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.item,
    required this.isSelected,
  });

  final _NavItem item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? _PracticeScreenState._navActive
        : _PracticeScreenState._navMuted;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, color: color, size: 26),
          const SizedBox(height: 3),
          Text(
            item.label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
