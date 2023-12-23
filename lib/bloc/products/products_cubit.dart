import 'package:flutter_bloc/flutter_bloc.dart';

// Define the events for your Cubit
abstract class ProductEvent {}

class LoadProductsEvent extends ProductEvent {}

// Define the state for your Cubit
class ProductState {
  final List<String> products;

  ProductState(this.products);
}

// Create your Cubit
class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState([]));

  void loadProducts() {
    List<String> dummyProducts = [
      "Product 1",
      "Product 2",
      "Product 3",
    ];
    emit(ProductState(dummyProducts));
  }
}
