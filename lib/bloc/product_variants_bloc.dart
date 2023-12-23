import 'package:flutter_bloc/flutter_bloc.dart';

// Define the events for your Cubit
abstract class ProductEvent {}

class AddOptionEvent extends ProductEvent {
  final String optionName;
  final List<String> optionValues;

  AddOptionEvent(this.optionName, this.optionValues);
}

class GenerateVariantsEvent extends ProductEvent {}

// Define the state for your Cubit
class ProductState {
  final List<Map<String, String>> options;
  final List<String> variants;

  ProductState(this.options, this.variants);
}

// Create your Cubit
class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState([], []));

  void addOption(String optionName, List<String> optionValues) {
    List<Map<String, String>> newOptions = List.from(state.options);
    newOptions.add({optionName: optionValues.join(', ')});
    emit(ProductState(newOptions, state.variants));
  }

  void generateVariants() {
    // Logic to generate variants based on options
    // For this example, let's assume a simple combination of options
    List<String> variants = [];

    for (final option in state.options) {
      option.forEach((key, value) {
        variants.add("$key: $value");
      });
    }

    emit(ProductState(state.options, variants));
  }
}
