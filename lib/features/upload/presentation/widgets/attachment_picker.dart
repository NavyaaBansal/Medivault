import 'package:flutter/material.dart';

class AttachmentPicker extends StatelessWidget {
  final String? filePath;
  final VoidCallback onPressed;

  const AttachmentPicker({
    super.key,
    required this.filePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attachment',
          style: Theme.of(context).textTheme.titleMedium,
        ),

        const SizedBox(height: 8),

        OutlinedButton.icon(
          onPressed: onPressed,
          icon: const Icon(Icons.attach_file),
          label: Text(
            filePath == null
                ? 'Choose PDF / Image'
                : filePath!.split('/').last,
          ),
        ),
      ],
    );
  }
}