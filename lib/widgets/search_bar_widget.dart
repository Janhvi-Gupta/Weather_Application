import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;  //stores and controls the text entered in the search field
  final VoidCallback onSearch; //stores a function that will run when the user performs a search

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override //replacing parent method
  Widget build(BuildContext context) {  //defines and returns the ui, context: provides information about where this widget is placed in the widget tree
    return Row(  //horizontally structure
      children: [  //contains a list of widgets that will be placed inside the row (search bar and button)
        Expanded(  //makes the TextField take up the remaining available horizontal space inside the row
          child: TextField(
            controller: controller,  //connects the "TextField" to the "TextEditingController"" so the entered text can be controlled
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Enter city name',
              hintStyle: const TextStyle(color: Colors.white54),
              filled: true,
              fillColor: const Color(0xFF2A2A40),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),  //horizontal space between the text field and button
        ElevatedButton(  //creates a clickable search button
          onPressed: onSearch,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4F9DF7),
            foregroundColor: Colors.white,
          ),
          child: const Text('Search'),
        ),
      ],
    );
  }
}
