import 'package:codekameleon/data/languages.dart';
import 'package:codekameleon/model/tutorial_model.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  // These methods are mandatory you cannot skip them.

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            // When pressed here the query will be cleared from the search bar.
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  // TODO: improve logic to navigate to the selected tutorial.

  @override
  Widget buildResults(BuildContext context) {
    final List<TutorialModel> searchResults = query.isEmpty
        ? []
        : allTutorials.where((t) {
            return t.title.toLowerCase().contains(query.toLowerCase()) ||
                t.description.toLowerCase().contains(query.toLowerCase()) ||
                t.content.toLowerCase().contains(query.toLowerCase());
          }).toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].title),
          subtitle: Text(searchResults[index].description),
          onTap: () {
            // Handle the selected search result.
            close(context, searchResults[index].title);
          },
        );
      },
    );
  }

  // TODO: highlight the matching text in the search results.

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<TutorialModel> suggestionList = query.isEmpty
        ? []
        : allTutorials.where((t) {
            return t.title.toLowerCase().contains(query.toLowerCase()) ||
                t.description.toLowerCase().contains(query.toLowerCase()) ||
                t.content.toLowerCase().contains(query.toLowerCase());
          }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].title),
          subtitle: Text(suggestionList[index].description),
          onTap: () {
            query = suggestionList[index].title;
            // Show the search results based on the selected suggestion.
          },
        );
      },
    );
  }
}
