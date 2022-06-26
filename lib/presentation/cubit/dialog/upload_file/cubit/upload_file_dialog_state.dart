part of 'upload_file_dialog_cubit.dart';

@immutable
abstract class UploadFileDialogState {}

class UploadFileDialogInitial extends UploadFileDialogState {}

class UploadFileDialogShow extends UploadFileDialogState {
  final void Function() onTap;

  UploadFileDialogShow(this.onTap);
}
