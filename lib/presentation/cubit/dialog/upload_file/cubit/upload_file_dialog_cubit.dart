import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:poseidon/poseidon.dart';

import '../../../../../domain/repository/remote/text_from_docx_remote_repository.dart';
import '../../../body/body_cubit.dart';

part 'upload_file_dialog_state.dart';

class UploadFileDialogCubit extends Cubit<UploadFileDialogState> {
  UploadFileDialogCubit() : super(UploadFileDialogInitial()) {
    _initialize();
  }

  void _initialize() {
    emit(UploadFileDialogShow(_onTap));
  }

  void _onTap() async {
    var pickerResult = await FilePicker.platform.pickFiles(
        dialogTitle: 'Select the docx file',
        type: FileType.custom,
        allowedExtensions: ['docx'],
        withReadStream: true);

    if (pickerResult != null) {
      var platformFile = pickerResult.files.first;

      var text = await _getText(platformFile);

      _setText(text);
    }
  }

  Future<String> _getText(PlatformFile platformFile) async {
    var file = MultipartFile(platformFile.readStream!, platformFile.size,
        filename: platformFile.name);

    var text = await GetIt.instance<TextFromDocxRemoteRepository>()
        .getTextFromDocx(file);

    return text;
  }

  void _setText(String text) {
    var bodyCubit = GetIt.instance<BodyCubit>();

    if (bodyCubit.isOperationLayersNotShow) {
      bodyCubit.pasteText(text);

      Poseidon.instance.pop();
    }
  }
}
