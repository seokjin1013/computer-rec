import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.image,
    this.onTap,
    this.child,
  }) : super(key: key);

  final GestureTapCallback? onTap;
  final ImageProvider image;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Ink.image(
        image: image,
        fit: BoxFit.fitWidth,
        child: InkWell(
          onTap: onTap,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: double.infinity,
              color: const Color.fromARGB(150, 0, 0, 0),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
