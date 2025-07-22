
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: TextField(decoration: InputDecoration(
        hintText: 'Buscar',
        filled:true,
        fillColor:const Color(0xFFFFFFFF),
        contentPadding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
        suffixIcon: const Icon(Icons.search),
        enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none
        )
      ),),
    );
  }
}