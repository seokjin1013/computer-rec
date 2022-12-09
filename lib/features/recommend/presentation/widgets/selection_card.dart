import 'package:flutter/material.dart';

class SelectionCard extends StatefulWidget {
  final void Function() onTap;
  final Image? image;
  final Text? text;
  const SelectionCard({required this.onTap, this.image, this.text, super.key});

  @override
  State<SelectionCard> createState() => _SelectionCardState();
}

class _SelectionCardState extends State<SelectionCard> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isOn
          ? Theme.of(context).colorScheme.onPrimary
          : Theme.of(context).cardColor,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.image != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: widget.image,
                    ),
                  ),
                if (widget.text != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.text,
                  ),
              ],
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  widget.onTap();
                  setState(() {
                    isOn = !isOn;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
