import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/products.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  void addItem(Product product) {
    final currentState = List<Product>.from(state.cartItems);
    currentState.add(product);
    emit(CartState(currentState));
  }

  void removeItem(Product product) {
    final currentState = List<Product>.from(state.cartItems);
    currentState.remove(product);
    emit(CartState(currentState));
  }
}
