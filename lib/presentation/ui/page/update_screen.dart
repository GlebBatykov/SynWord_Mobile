import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:synword_flutter_cubit_application/presentation/cubit/update_screen_cubit/update_screen_cubit.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#301B28'),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: 285,
            height: 187,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 25, top: 17, right: 35, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Image.asset('assets/images/logo2.png',
                                width: 30.03, height: 30)),
                        const Text('Update Synword',
                            style: TextStyle(
                                fontSize: 15, fontFamily: 'Araboto-Medium'))
                      ],
                    ),
                    const Text(
                        'Synword recommends that you update to the last version.',
                        style: TextStyle(fontSize: 12, fontFamily: 'Cabrion')),
                    BlocBuilder<UpdateScreenCubit, UpdateScreenState>(
                        builder: (context, state) {
                      if (state is UpdateScreenUnforced) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('NOT NOW',
                                  style: TextStyle(
                                      color: HexColor('#2D974D'),
                                      fontSize: 14,
                                      fontFamily: 'Roves-Sans-Reg-Rough')),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.zero),
                                  fixedSize: MaterialStateProperty.all(
                                      const Size(88, 26)),
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent)),
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: const Text('UPDATE',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Roves-Sans-Reg-Rough')),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      HexColor('#2D974D'),
                                    ),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.5),
                                    )),
                                    fixedSize: MaterialStateProperty.all(
                                        const Size(88, 26)),
                                    elevation: MaterialStateProperty.all(0)))
                          ],
                        );
                      } else if (state is UpdateScreenForced) {
                        return ElevatedButton(
                            onPressed: () {},
                            child: const Text('UPDATE',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Roves-Sans-Reg-Rough')),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  HexColor('#2D974D'),
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2.5),
                                )),
                                fixedSize: MaterialStateProperty.all(
                                    const Size(88, 26)),
                                elevation: MaterialStateProperty.all(0)));
                      } else {
                        return Container();
                      }
                    }),
                  ],
                )),
          ),
        ));
  }
}
