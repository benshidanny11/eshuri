import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import '../providers/Products.dart';
import '../widgets/product_item.dart';
import '../widgets/search.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool _isInit = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<ProductsProvider>(context, listen: false)
          .fetchProducs()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      }).catchError((onError) {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
    _isInit = false;
    if (Provider.of<ProductsProvider>(context).products.isNotEmpty) {
      setState(() {});
    }
    super.didChangeDependencies();
  }

  // @override
  // void initState() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<ProductsProvider>(context,listen: false).fetchProducs().then((_) {
  //       print("Hello");
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }).catchError((onError) {
  //       if (mounted) {
  //         setState(() {
  //           _isLoading = false;
  //         });
  //       }
  //     });
  //   }
  //   _isInit = false;
  //   if (Provider.of<ProductsProvider>(context).products.isNotEmpty) {
  //     setState(() {});
  //   }
  //   super.initState();
  // }
  void onChange(value) {
    Provider.of<ProductsProvider>(context,listen: false).searchProduct(value);
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context).products;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Search(
            onChange: onChange,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  axisDirection: AxisDirection.down,
                  children: products
                      .map((product) => ProductItem(
                            product: product,
                          ))
                      .toList()),
            ),
          ),
        ],
      ),
    );
  }
}
