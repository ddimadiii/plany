import 'package:flutter/material.dart';

class CardItemTile extends StatelessWidget {
  final String leadingText;
  final String title;
  final String category;
  final String? description;
  final bool done;
  final VoidCallback? onCheck;
  final VoidCallback? onTap;
  final Color? cardColor;
  final Widget? trailing; 
  const CardItemTile({
    super.key,
    required this.leadingText,
    required this.title,
    required this.category,
    this.description,
    this.done = false,
    this.onCheck,
    this.onTap,
    this.cardColor,
    this.trailing, 
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = Theme.of(context).dividerColor.withOpacity(0.35);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        leading: Text(
          leadingText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        title: Text(
          title,
          style: TextStyle(
            decoration: done ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (description != null && description!.isNotEmpty)
              Text(description!,
                  maxLines: 2, overflow: TextOverflow.ellipsis),
            Text(category),
          ],
        ),
        trailing: trailing ?? 
            IconButton(
              onPressed: onCheck,
              icon: Icon(
                done ? Icons.check_circle : Icons.circle_outlined,
                color: done ? Colors.green : Colors.grey,
              ),
            ),
      ),
    );
  }
}
