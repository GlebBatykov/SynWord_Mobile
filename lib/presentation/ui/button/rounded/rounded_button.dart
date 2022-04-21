import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Widget? icon;

  final IconData? iconData;

  final void Function()? onTap;

  RoundedButton({Key? key, this.icon, this.iconData, this.onTap})
      : super(key: key) {
    if (icon != null && iconData != null) {
      throw Exception(
          'Parameters icon and iconData cannot be set at the same time.');
    }
  }

  Widget _buildIcon() {
    if (icon != null) {
      return icon!;
    } else if (iconData != null) {
      return Icon(iconData!, color: Colors.black, size: 25);
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            offset: const Offset(0, 4),
            color: Colors.black.withOpacity(0.7),
            blurRadius: 3)
      ]),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20)),
            child: Material(
                borderRadius: BorderRadius.circular(20),
                child: InkWell(onTap: onTap, child: _buildIcon())),
          )),
    );
  }
}
