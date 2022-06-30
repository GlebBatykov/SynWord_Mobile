import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/dialog/account/cubit/account_dialog_cubit.dart';

class AccountDialog extends StatelessWidget {
  const AccountDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: 235,
        height: 139,
        padding: const EdgeInsets.only(top: 26, bottom: 26),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Colors.black.withOpacity(0.6),
                  blurRadius: 15)
            ]),
        child: BlocBuilder<AccountDialogCubit, AccountDialogState>(
            builder: (context, state) {
          if (state is AccountDialogShow) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            );
          } else {
            return Container();
          }
        }),
      ),
    );
  }
}
