import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/products.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  void addItem(Product product) {
    final updatedCart = List<Product>.from(state.cartItems)..add(product);
    emit(CartState(updatedCart));
  }

  void removeItem(Product product) {
    final updatedCart = List<Product>.from(state.cartItems)..remove(product);
    emit(CartState(updatedCart));
  }
}

