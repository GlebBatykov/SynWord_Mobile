import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UploadFileDialog extends StatelessWidget {
  const UploadFileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 235,
        height: 273,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Material(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 53.29,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(7),
                margin: const EdgeInsets.only(top: 29.9),
                width: 145,
                height: 59,
                decoration: BoxDecoration(
                    color: HexColor('#C4C4C4').withOpacity(0.25),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Supported file formats:',
                        style: TextStyle(fontSize: 11, fontFamily: 'Cabrion')),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                          padding: const EdgeInsets.only(right: 11),
                          child: Image.asset(
                              'assets/images/icons/docx-file.png',
                              width: 20,
                              height: 20)),
                      Image.asset('assets/images/icons/pdf.png',
                          width: 20, height: 20)
                    ])
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
