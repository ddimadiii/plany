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
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = Theme.of(context).dividerColor;

    return Card(
      color: cardColor ?? Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: borderColor),
      ),
      elevation: 2,
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade300,
          child: Text(
            leadingText,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            decoration: done ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (description != null && description!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  description!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            Text(
              category,
              style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
            ),
          ],
        ),
        trailing: IconButton(
          onPressed: onCheck,
          icon: Icon(
            done ? Icons.check_circle : Icons.check_circle_outline,
            color: done ? Colors.green : Colors.black54,
          ),
          tooltip: done ? 'Sudah selesai' : 'Tandai selesai',
        ),
      ),
    );
  }
}
