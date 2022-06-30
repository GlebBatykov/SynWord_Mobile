import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/button/account_button/cubit/account_button_cubit.dart';
import 'rounded/rounded_account_button.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountButtonCubit, AccountButtonState>(
        builder: (context, state) {
      if (state is AccountButtonShow) {
        return RoundedAccountButton(onTap: state.onTap);
      } else {
        return Container();
      }
    });
  }
}
