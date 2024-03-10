abstract class AddProductState {}

class AddProductIntialState extends AddProductState {}

class SuccessfulPickImage extends AddProductState {}

class FailPickImage extends AddProductState {}

class SuccessfulAddProductCollection extends AddProductState {}

class LoadingAddProductCollection extends AddProductState {}

class FailAddProductCollection extends AddProductState {}

class SelectedCollection extends AddProductState {}

class UploadIamgeRunning extends AddProductState {}

class UploadIamgePaused extends AddProductState {}

class UploadIamgeCanceled extends AddProductState {}

class UploadIamgeError extends AddProductState {}

class UploadIamgeSuccess extends AddProductState {}

class AddedNewTextFormField extends AddProductState {}

class RemoveLastTextFormField extends AddProductState {}
