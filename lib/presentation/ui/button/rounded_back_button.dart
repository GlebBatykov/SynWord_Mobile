import 'package:flutter/material.dart';
import 'package:poseidon/poseidon.dart';

class RoundedBackButton extends StatelessWidget {
  const RoundedBackButton({Key? key}) : super(key: key);

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
                child: InkWell(
                    onTap: () {
                      Poseidon.pop();
                    },
                    child: const Icon(Icons.arrow_back,
                        color: Colors.black, size: 25))),
          )),
    );
  }
}
