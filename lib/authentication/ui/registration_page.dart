import 'package:flutter/material.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productIdController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();

  final List<String> categories = [
    'Electronics',
    'Clothing',
    'Books',
    'Home',
    'Beauty'
  ];
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextFieldWithIcon(
                controller: productNameController,
                labelText: 'Product Name',
                icon: Icons.shopping_bag,
              ),
              const SizedBox(height: 20),
              _buildTextFieldWithIcon(
                controller: productIdController,
                labelText: 'Product ID',
                icon: Icons.qr_code,
              ),
              const SizedBox(height: 20),
              _buildTextFieldWithIcon(
                controller: productPriceController,
                labelText: 'Product Price',
                icon: Icons.attach_money,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Select Category',
                  prefixIcon: Icon(Icons.category),
                  border: OutlineInputBorder(),
                ),
                value: selectedCategory,
                items: categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCategory = newValue;
                  });
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  final String name = productNameController.text;
                  final String id = productIdController.text;
                  final String price = productPriceController.text;
                  final String? category = selectedCategory;

                  if (name.isEmpty ||
                      id.isEmpty ||
                      price.isEmpty ||
                      category == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please fill in all fields.')),
                    );
                    return;
                  }

                  // TODO: Handle form submission (e.g., upload to Firebase or backend)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            'Product "$name" added to $category category.')),
                  );
                },
                child: const Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: 'Enter $labelText',
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
