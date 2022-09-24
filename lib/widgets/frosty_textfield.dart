import 'package:flutter/material.dart';

class FrostyTextField extends StatelessWidget {
  const FrostyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.2),
      ),
      child: const TextField(
        keyboardType: TextInputType.text,
        style: TextStyle(
            fontFamily: 'Proxima Nova',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(
              fontFamily: 'Proxima Nova',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    );
  }
}
