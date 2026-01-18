import 'package:flutter/material.dart';

class AnswerTile extends StatelessWidget {
  const AnswerTile({
    super.key,
    required this.label,
    required this.text,
    required this.onTap,
    required this.isLocked,
    required this.isCorrect,
    required this.isSelected,
  });

  final String label;
  final String text;
  final VoidCallback? onTap;
  final bool isLocked;
  final bool isCorrect;
  final bool isSelected;

  Color _backgroundColor(BuildContext context) {
    if (!isLocked) {
      return Theme.of(context).colorScheme.surface;
    }
    if (isCorrect) {
      return Colors.green.shade600;
    }
    if (isSelected) {
      return Colors.red.shade600;
    }
    return Theme.of(context).colorScheme.surfaceVariant;
  }

  Color _foregroundColor(BuildContext context) {
    if (!isLocked) {
      return Theme.of(context).colorScheme.onSurface;
    }
    if (isCorrect || isSelected) {
      return Colors.white;
    }
    return Theme.of(context).colorScheme.onSurfaceVariant;
  }

  @override
  Widget build(BuildContext context) {
    final color = _backgroundColor(context);
    return Semantics(
      button: true,
      enabled: !isLocked,
      child: ElevatedButton(
        onPressed: isLocked ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: _foregroundColor(context),
          minimumSize: const Size.fromHeight(56),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: _foregroundColor(context).withOpacity(0.2),
              child: Text(
                label,
                style: TextStyle(
                  color: _foregroundColor(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
