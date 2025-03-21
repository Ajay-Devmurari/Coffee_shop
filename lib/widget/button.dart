import 'package:flutter/material.dart';

class PaymentButton extends StatefulWidget {
  const PaymentButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  State<PaymentButton> createState() => _PaymentButtonState();
}

class _PaymentButtonState extends State<PaymentButton> {
  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    final wt = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: ht * 0.08,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.brown),
        child: Center(
            child: Text(
          'Pay now',
          style: TextStyle(fontSize: wt * 0.05, color: Colors.white),
        )),
      ),
    );
  }
}
