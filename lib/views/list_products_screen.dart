
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cart_cubit.dart';
import '../models/products.dart';
import 'details_screen.dart';
import 'cart_screen.dart';

class ListProductsScreen extends StatefulWidget {
  @override
  _ListProductsScreenState createState() => _ListProductsScreenState();
}

class _ListProductsScreenState extends State<ListProductsScreen> {
  List<Product> cleaningProducts = [
    Product(
      name: 'Detergente',
      marca: 'Marca A',
      descripcion: 'Detergente para ropa.',
      uso: 'Ideal para lavar la ropa sucia.',
      price: 100.0,
      stock: 10,
    ),
    Product(
      name: 'Desinfectante',
      marca: 'Marca B',
      descripcion: 'Desinfectante multiusos.',
      uso: 'Para desinfectar superficies y objetos.',
      price: 150.0,
      stock: 5,
    ),
    Product(
      name: 'Jabón para manos',
      marca: 'Marca C',
      descripcion: 'Jabón líquido antibacterial.',
      uso: 'Limpieza y protección de las manos.',
      price: 50.0,
      stock: 20,
    ),
    Product(
      name: 'Limpiavidrios',
      marca: 'Marca D',
      descripcion: 'Limpiador para ventanas y espejos.',
      uso: 'Para obtener superficies limpias y brillantes.',
      price: 120.0,
      stock: 8,
    ),
    Product(
      name: 'Toallas desinfectantes',
      marca: 'Marca E',
      descripcion: 'Toallas húmedas desechables.',
      uso: 'Limpieza rápida de superficies.',
      price: 60.0,
      stock: 15,
    ),
    Product(
      name: 'Esponja abrasiva',
      marca: 'Marca F',
      descripcion: 'Esponja para limpieza de utensilios.',
      uso: 'Eliminar suciedad adherida en utensilios de cocina.',
      price: 30.0,
      stock: 25,
    ),
    Product(
      name: 'Escoba',
      marca: 'Marca G',
      descripcion: 'Escoba de cerdas resistentes.',
      uso: 'Limpieza de pisos y áreas amplias.',
      price: 90.0,
      stock: 7,
    ),
    Product(
      name: 'Trapo de microfibra',
      marca: 'Marca H',
      descripcion: 'Trapo absorbente de microfibra.',
      uso: 'Para limpieza de superficies delicadas.',
      price: 40.0,
      stock: 18,
    ),
    Product(
      name: 'Limpiador multiusos',
      marca: 'Marca I',
      descripcion: 'Limpiador concentrado.',
      uso: 'Para limpieza de superficies delicadas.',
      price: 80.0,
      stock: 12,
    ),
  ];

  List<Product> availableProducts = [];

  @override
  void initState() {
    super.initState();
    availableProducts =
        cleaningProducts.where((product) => product.stock > 0).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Productos'),
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state.cartItems.isNotEmpty) {
                return IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: CartScreen(),
                        );
                      },
                    );
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: availableProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(availableProducts[index].name),
            subtitle: Text('Stock: ${availableProducts[index].stock}'),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                context.read<CartCubit>().addItem(availableProducts[index]);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        '${availableProducts[index].name} añadido al carrito'),
                  ),
                );
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(product: availableProducts[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
