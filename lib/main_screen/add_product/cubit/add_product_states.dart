abstract class AddProductState {}

class AddProductIntialState extends AddProductState {}

class SuccessfulPickImage extends AddProductState {}

class FailPickImage extends AddProductState {}

class SuccessfulAddProductsCollection extends AddProductState {}

class LoadingAddProductsCollection extends AddProductState {}

class FailAddProductsCollection extends AddProductState {}

class LoadingInnerCollection extends AddProductState {}

class SuccessfulInnerCollection extends AddProductState {}

class FailInnerCollection extends AddProductState {}

class SelectedCollection extends AddProductState {}

class UploadIamgeRunning extends AddProductState {}

class UploadIamgePaused extends AddProductState {}

class UploadIamgeCanceled extends AddProductState {}

class UploadIamgeError extends AddProductState {}

class UploadIamgeSuccess extends AddProductState {}
