import 'package:flutter/material.dart';
import '../models/book.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/booker.dart';
import '../models/bookshelf.dart';
import '../widgets/zoom_menu.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ZoomMenu(),
        backgroundColor: Colors.blueGrey,
        title: Text("Books"),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: MasonryGridView.count(
              itemCount: bookshelf.length,
              itemBuilder: (context, index) {
                return Booker(books: bookshelf[index]);
              },
              crossAxisCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<Book> searchResults = [
    Book(
      name: "A Complete Guide to Programming in C++",
      publisher: "Ulla Kirch-Prinz",
      image: "assets/images/book2.jpg",
      like: false,
    ),
    Book(
      name: "Introduction to Machine Learning with Python",
      publisher: "C. Muller & Sarah",
      image: "assets/images/book3.jpg",
      like: false,
    ),
    Book(
      name: "Java: The Complete Reference (11th Edition)",
      publisher: "Herbert Schildt",
      image: "assets/images/book4.jpg",
      like: false,
    ),
    Book(
      name: "Data Structures and Algorithms in Java",
      publisher: "Robert Lafore",
      image: "assets/images/book5.jpg",
      like: false,
    ),
    Book(
      name: "Data Structures and Algorithms in Python",
      publisher: "John Canning, Alan Broder, Robert Lafore",
      image: "assets/images/book6.jpg",
      like: false,
    ),
    Book(
      name: " A Practitioner’s Guide to Software Test Design",
      publisher: "Lee Copeland",
      image: "assets/images/book7.jpg",
      like: false,
    ),
    Book(
      name: "Software Testing",
      publisher: "Ron Patton",
      image: "assets/images/book8.jpg",
      like: false,
    ),
    Book(
      name: "Elements of Graphic Designing",
      publisher: "Alex White",
      image: "assets/images/book9.jpg",
      like: false,
    ),
    Book(
      name: "PHP Objects, Patterns, and Practice",
      publisher: "Matt Zandstra",
      image: "assets/images/book10.jpg",
      like: false,
    ),
    Book(
      name: "Introduction to MySql",
      publisher: "Ben Forta",
      image: "assets/images/book11.jpg",
      like: false,
    ),
    Book(
      name: "Kyle Simpson’s You Don’t Know JS",
      publisher: "Kyle Simpson",
      image: "assets/images/book12.jpg",
      like: false,
    ),
    Book(
        name: "Modern Full-Stack Developer",
        publisher: "Frank Zammetti",
        image: "assets/images/book14.jpg",
        like: false),
    Book(
        name: "Pro Angular 9",
        publisher: "Adam Freeman",
        image: "assets/images/book15.jpg",
        like: false),
    Book(
        name: "Network Programmability & Automation",
        publisher: "jason Edelman",
        image: "assets/images/book16.jpg",
        like: false)
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: Icon(Icons.clear))
      ];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Book> suggestions = searchResults.where((searchResult) {
      final result = searchResult.name;
      final input = query.toLowerCase();

      return result.contains(input.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: Image.asset(
              suggestion.image,
              fit: BoxFit.cover,
              width: 60,
              height: 60,
            ),
            title: Text(suggestion.name),
            onTap: () {
              query = suggestion.name;
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Card(
          elevation: 8,
          shadowColor: Colors.blue,
          margin: EdgeInsets.all(20),
          child: Container(
            height: 120,
            width: 400,
            child: ListTile(
                /*title: Text(
                "Title\t\t\t\t\t\t:$Book.name" + " ",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),*/
                leading: Text(
                  query,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BookPage()));
                }),
          ),
        ),
      );
}
