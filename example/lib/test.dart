import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:search/search.dart';

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  State<Test1> createState() => _Test1State();
}

class _Test1State extends State<Test1> {
  _onChanged(value) {
    if (kDebugMode) {
      if (value == "yes") {
        setState(() {
          widgetsList.add(
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: Colors.yellow,
            ),
          );
          widgetsList.add(
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: Colors.purple,
            ),
          );
        });
      }
    }
  }

  _onApply() {
    if (kDebugMode) {
      for (int i = 0; i < filtersList.length; i++) {
        print(filtersList[i].valueChoose);
      }
      setState(() {});
    }
  }

  TextEditingController searchBarController = TextEditingController();

  List<Filters> filtersList = [
    Filters(
      fieldName: 'Trier par',
      type: FiltersType.dropdown,
      defaultValue: 'Choisir votre',
      values: ['Choisir votre', 'Prix', 'Récent', 'Couleur'],
    ),
    Filters(
      fieldName: 'Catégorie',
      type: FiltersType.dropdown,
      defaultValue: 'Aucun',
      values: ['Aucun', 'Smartphone', 'Ordinateur', 'Tatouage'],
    ),
    // Filters(
    //   fieldName: 'Date de début',
    //   type: FiltersType.dropdown,
    //   shrink: true,
    //   defaultValue: 'Choisir une date',
    //   values: ['Choisir une date'],
    // ),
    Filters(
      fieldName: 'Date de début',
      type: FiltersType.datepicker,
      shrink: true,
      defaultValue: 'Choisir une date',
      values: ['Choisir une date'],
    ),
    Filters(
      fieldName: 'Date de fin',
      type: FiltersType.datepicker,
      shrink: true,
      defaultValue: 'Choisir une date',
      values: ['Choisir une date'],
    ),
    Filters(
      fieldName: 'Prix',
      type: FiltersType.dropdown,
      defaultValue: 'Aucun',
      values: ['Aucun'],
    ),
    Filters(
      fieldName: 'Date de aaaa',
      type: FiltersType.datepicker,
      shrink: true,
      defaultValue: 'Choisir une date',
      values: ['Choisir une date'],
    ),
    Filters(
      fieldName: 'Date de bbbbb',
      type: FiltersType.datepicker,
      shrink: true,
      defaultValue: 'Choisir une date',
      values: ['Choisir une date'],
    ),
    Filters(
      fieldName: 'Couleur',
      type: FiltersType.dropdown,
      defaultValue: 'Aucun',
      values: ['Aucun'],
    ),
  ];

  List<Widget> widgetsList = [];

  @override
  Widget build(BuildContext context) {
    return SearchPage(
      // searchBarSettingsIconSize: Size(50, 50),
      // searchBarPrefixIconSize: Size(50, 50),
      modalFiltersList: filtersList,
      searchBarController: searchBarController,
      onChanged: _onChanged,
      result: widgetsList.isNotEmpty,
      child: ListView(children: widgetsList),
      onApply: _onApply(),
      onPop: () {},
    );
  }
}
