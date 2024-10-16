import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> _allItems = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Eggplant',
    'Fig',
    'Grapes',
    'Honeydew',
  ];

  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    final _filteredItems = _allItems
        .where((item) =>
        item.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

    return Scaffold(
       backgroundColor: Color(0xffe7e0d8),
      appBar: AppBar(
        title: Text('Search Page',style: GoogleFonts.adamina(textStyle: TextStyle(color:Color(0xFF550507),fontSize: 30,fontWeight: FontWeight.bold))),
        centerTitle: true,
        backgroundColor: Color(0xffe7e0d8) ,
        iconTheme:IconThemeData(color: Color((0xFF550507))),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: 'Search',labelStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.search,color:  Color(0xFF550507),size: 20,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13.0),
                  borderSide: BorderSide(color: Color(0xFF550507)), // Default border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Color(0xFF550507), width: 2.0), // When focused
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Color(0xFF550507), width: 1.5), // When not focused
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
            ),

            SizedBox(height: 20),
            Expanded(
              child: _filteredItems.isNotEmpty
                  ? ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredItems[index]),
                  );
                },
              )
                  : Center(
                child: Text('No results found'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
