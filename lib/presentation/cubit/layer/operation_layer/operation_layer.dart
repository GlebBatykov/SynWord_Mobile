import 'dart:async';
import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../model/layer/body/layer_body_content_data.dart';
import '../../../model/layer/operation_layer/check/check_layer_body_content_data.dart';
import '../../../model/layer/operation_layer/check/second_check_layer_body_content_data.dart';
import '../../../model/layer/operation_layer/rephrase/rephrase_layer_body_content_data.dart';
import '../../../model/page/history/result/check/check_result_link.dart';
import '../../../ui/layer/operation_layer/check/check_layer_body.dart';
import '../../../ui/layer/operation_layer/check/second_check_layer_body.dart';
import '../../../ui/layer/operation_layer/rephrase/rephrase_layer_body.dart';
import '../../../ui/layer/operation_layer/rephrase/rephrase_layer_cubit_copy_button.dart';

part 'body/operation_layer_body_cubit.dart';
part 'body/operation_layer_body_state.dart';

part 'header/operation_layer_header_cubit.dart';
part 'header/operation_layer_header_state.dart';

part 'layer_cubit.dart';
part 'layer_state.dart';

part 'check_layer_cubit.dart';
part 'second_check_layer_cubit.dart';

part 'rephrase_layer_cubit.dart';
