import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    super.key,
    required this.text,
    required this.isSeleted,
    required this.icon,
    required this.onTap,
    required this.seletedIcon,
  });

  final String text;
  final bool isSeleted;
  final IconData icon;
  final IconData seletedIcon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        behavior: HitTestBehavior.translucent,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: isSeleted ? 1 : 0.4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                isSeleted ? seletedIcon : icon,
                color: Colors.white,
              ),
              Gaps.v5,
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
