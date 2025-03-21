import 'package:coffee_shop/model/coffee.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.coffee,
    required this.onTap,
    this.icon = const Icon(Icons.add),
  });

  final Coffee coffee;
  final VoidCallback onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final wt = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => _showCoffeeDialog(context, coffee),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(45, 155, 141, 133)),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: ListTile(
          title: Text(coffee.name,
              style: TextStyle(
                  fontSize: wt * 0.05,
                  fontWeight: FontWeight.w900,
                  color: Colors.black54)),
          subtitle: Text(coffee.price,
              style: TextStyle(
                  fontSize: wt * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500])),
          leading: Image.asset(
            matchTextDirection: true,
            width: wt * 0.15,
            coffee.imagePath,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
          trailing: IconButton(
            onPressed: onTap,
            icon: icon,
            color: Colors.brown[400],
          ),
        ),
      ),
    );
  }

  void _showCoffeeDialog(BuildContext context, Coffee coffee) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8, // 80% screen width
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBCD),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  coffee.imagePath,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 15),
                Text(
                  coffee.name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  coffee.price,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                  ),
                  child: const Text("Close",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
