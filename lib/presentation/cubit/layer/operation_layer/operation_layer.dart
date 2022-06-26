import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:synword/domain/repository/remote/check_remote_repository.dart';
import 'package:synword/domain/repository/remote/rephrase_remote_repository.dart';
import 'package:synword/domain/use_case/clipboard_copy/clipboard_copy_use_case.dart';
import 'package:synword/presentation/cubit/body/body_cubit.dart';
import 'package:synword/presentation/cubit/rephrased_text/rephrased_text_cubit.dart';
import 'package:synword/presentation/model/layer/operation_layer/rephrase/rephrase_layer_body_preparation_data.dart';

import '../../../../domain/model/rephrase/rephrased_word.dart';
import '../../../model/layer/body/layer_body_content_data.dart';
import '../../../model/layer/body/layer_body_preparation_data.dart';
import '../../../model/layer/operation_layer/animation_end_details.dart';
import '../../../model/layer/operation_layer/check/check_layer_body_content_data.dart';
import '../../../model/layer/operation_layer/check/second_check_layer_body_content_data.dart';
import '../../../model/layer/operation_layer/rephrase/rephrase_layer_body_content_data.dart';
import '../../../../domain/model/check/check_result_link.dart';
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
