import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../../domain/repository/remote/text_from_docx_remote_repository.dart';

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
        allowedExtensions: ['docx']);

    if (pickerResult != null) {
      var file = pickerResult.files.first;

      if (file.bytes != null) {
        var text = await GetIt.instance<TextFromDocxRemoteRepository>()
            .getTextFromDocx(file.bytes!);

        //TODO Текст вставить в слой
      }
    }
  }
}
