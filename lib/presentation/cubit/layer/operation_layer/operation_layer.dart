import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword/domain/model/contraints_list/contraints_list.dart';

import '../../../../domain/model/price_list/price_list.dart';
import '../../../../domain/model/result/check/check_result.dart';
import '../../../../domain/repository/remote/coins_remote_repository.dart';
import '../../../../domain/repository/remote/check_remote_repository.dart';
import '../../../../domain/repository/remote/price_list_remote_repository.dart';
import '../../../../domain/repository/remote/rephrase_remote_repository.dart';
import '../../../../domain/use_case/clipboard_copy/clipboard_copy_use_case.dart';
import '../../../cubit/body/body_cubit.dart';
import '../../../model/layer/operation_layer/rephrase/rephrase_layer_body_preparation_data.dart';
import '../../../cubit/rephrased_text/rephrased_text_cubit.dart';
import '../../../model/layer/body/layer_body_content_data.dart';
import '../../../model/layer/body/layer_body_preparation_data.dart';
import '../../../model/layer/operation_layer/animation_end_details.dart';
import '../../../model/layer/operation_layer/check/check_layer_body_content_data.dart';
import '../../../model/layer/operation_layer/check/second_check_layer_body_content_data.dart';
import '../../../model/layer/operation_layer/rephrase/content_data/rephrase_layer_body_content_data.dart';
import '../../../ui/layer/operation_layer/check_layer_body.dart';
import '../../../ui/layer/operation_layer/rephrase/rephrase_layer_body.dart';
import '../../../ui/layer/operation_layer/rephrase/rephrase_layer_cubit_copy_button.dart';
import '../../../ui/layer/operation_layer/rephrase/preparation/rephrase_layer_preparation.dart';
import '../../../ui/layer/operation_layer/second_check_layer_body.dart';

part 'body/operation_layer_body_cubit.dart';
part 'body/operation_layer_body_state.dart';

part 'header/operation_layer_header_cubit.dart';
part 'header/operation_layer_header_state.dart';

part 'operation_layer_cubit.dart';
part 'operation_layer_state.dart';

part 'check_layer_cubit.dart';
part 'second_check_layer_cubit.dart';

part 'rephrase_layer_cubit.dart';
