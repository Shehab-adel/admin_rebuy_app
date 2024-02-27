abstract class AddProductState {}

class AddProductIntialState extends AddProductState {}

class SuccessfulPickImage extends AddProductState {}

class FailPickImage extends AddProductState {}

class SuccessfulAddProductsCollection extends AddProductState {}

class FailAddProductsCollection extends AddProductState {}

class SuccessfulInnerCollection extends AddProductState {}

class FailInnerCollection extends AddProductState {}

class SelectedCollection extends AddProductState {}
