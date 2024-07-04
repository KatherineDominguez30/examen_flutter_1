import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/products.dart';
// Asegúrate de tener esta importación

class ListProductsScreen extends StatefulWidget {
  @override
  _ListProductsScreenState createState() => _ListProductsScreenState();
}

class _ListProductsScreenState extends State<ListProductsScreen> {
  List<Product> cleaningProducts = [
 Product(
      name: 'Detergente',
      stock: 5,
      marca: 'Marca A',
      descripcion: 'Detergente para ropa.',
      uso: 'Ideal para lavar la ropa sucia.',
      imageUrl: 'https://supermercadosnacional.com/media/catalog/product/cache/fde49a4ea9a339628caa0bc56aea00ff/2/2/2200271-1.jpg', // URL de ejemplo
    ),
    Product(
      name: 'Desinfectante',
      stock: 7,
      marca: 'Marca B',
      descripcion: 'Desinfectante multiusos.',
      uso: 'Para desinfectar superficies y objetos.',
         imageUrl:
          'https://supermercadosnacional.com/media/catalog/product/cache/fde49a4ea9a339628caa0bc56aea00ff/2/2/2200271-1.jpg', // URL de ejemplo
    ),
    Product(
      name: 'Jabón para manos',
      stock: 3,
      marca: 'Marca C',
      descripcion: 'Jabón líquido antibacterial.',
      uso: 'Limpieza y protección de las manos.',
         imageUrl:
          'https://supermercadosnacional.com/media/catalog/product/cache/fde49a4ea9a339628caa0bc56aea00ff/2/2/2200271-1.jpg', // URL de ejemplo
    ),
    Product(
      name: 'Limpiavidrios',
      stock: 8,
      marca: 'Marca D',
      descripcion: 'Limpiador para ventanas y espejos.',
      uso: 'Para obtener superficies limpias y brillantes.',
         imageUrl:
          'https://supermercadosnacional.com/media/catalog/product/cache/fde49a4ea9a339628caa0bc56aea00ff/2/2/2200271-1.jpg', // URL de ejemplo
    ),
    Product(
      name: 'Toallas desinfectantes',
      stock: 0,
      marca: 'Marca E',
      descripcion: 'Toallas húmedas desechables.',
      uso: 'Limpieza rápida de superficies.',
         imageUrl:
          'https://supermercadosnacional.com/media/catalog/product/cache/fde49a4ea9a339628caa0bc56aea00ff/2/2/2200271-1.jpg', // URL de ejemplo
    ),
    Product(
      name: 'Esponja abrasiva',
      stock: 6,
      marca: 'Marca F',
      descripcion: 'Esponja para limpieza de utensilios.',
      uso: 'Eliminar suciedad adherida en utensilios de cocina.',
         imageUrl:
          'https://supermercadosnacional.com/media/catalog/product/cache/fde49a4ea9a339628caa0bc56aea00ff/2/2/2200271-1.jpg', // URL de ejemplo
    ),
    Product(
      name: 'Escoba',
      stock: 2,
      marca: 'Marca G',
      descripcion: 'Escoba de cerdas resistentes.',
      uso: 'Limpieza de pisos y áreas amplias.',
         imageUrl:
          'https://supermercadosnacional.com/media/catalog/product/cache/fde49a4ea9a339628caa0bc56aea00ff/2/2/2200271-1.jpg', // URL de ejemplo
    ),
    Product(
      name: 'Trapo de microfibra',
      stock: 4,
      marca: 'Marca H',
      descripcion: 'Trapo absorbente de microfibra.',
      uso: 'Para limpieza de superficies delicadas.',
         imageUrl:
          'https://supermercadosnacional.com/media/catalog/product/cache/fde49a4ea9a339628caa0bc56aea00ff/2/2/2200271-1.jpg', // URL de ejemplo
    ),
    Product(
      name: 'Limpiador multiusos',
      stock: 10,
      marca: 'Marca I',
      descripcion: 'Limpiador concentrado.',
        uso: 'Para limpieza de superficies delicadas.',
           imageUrl: 'https://supermercadosnacional.com/media/catalog/product/cache/fde49a4ea9a339628caa0bc56aea00ff/2/2/2200271-1.jpg', // URL de ejemplo
           )
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
        title: Text('Listado de Productos de Limpieza'),
      ),
      body: ListView.builder(
        itemCount: availableProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(availableProducts[index].name),
            subtitle: Text('Stock: ${availableProducts[index].stock}'),
            onTap: () {
              // Navegar a la pantalla de detalles del producto
              Navigator.pushNamed(
                context,
                '/details',
                arguments: availableProducts[index],
              );
            },
          );
        },
      ),
    );
  }
}
