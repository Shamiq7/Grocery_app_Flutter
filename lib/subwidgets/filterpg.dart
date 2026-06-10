import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/detailspg.dart';
import 'package:grocery_app_flutter/provider/homepgprovider.dart';
import 'package:provider/provider.dart';

class Filterpg extends StatelessWidget {
  const Filterpg({super.key});

  @override
  Widget build(BuildContext context) {
    // final provider2 = context.read<homepgprovider>();
    final provider = context.watch<homepgprovider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Search Results',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            itemCount: provider.filterProduct.length,
            itemBuilder: (context, index) {
              final item = provider.filterProduct[index];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detailspg(product: item),
                    ),
                  );
                },
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    leading: SizedBox(height: 60, width: 60, child: item.img),
                    title: Text(item.desc),
                    subtitle: Text(item.weight),
                    trailing: Text(
                      item.price,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
