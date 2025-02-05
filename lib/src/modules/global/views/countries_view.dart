import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/app_export.dart';
import '../controllers/global_controller.dart';

class CountryPickerView extends GetView<GlobalController> {
  const CountryPickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColor.offWhite
            : AppColor.blackShade,
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        _buildSliverAppBar(context),
        _buildCountryList(),
      ],
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      expandedHeight: 100.0,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: AppColor.offWhite,
      elevation: 0,
      surfaceTintColor: AppColor.offWhite,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Hero(
          tag: "countries_tag",
          child: Text(
            "Countries",
            style: TextStyleX.header3(context),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () => _showSearch(context),
        ),
      ],
    );
  }

  Widget _buildCountryList() {
    return Obx(() {
      if (controller.countryModels.isEmpty) {
        return const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      return SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) => _buildCountryItem(context, index),
          childCount: controller.countryModels.length,
        ),
      );
    });
  }

  Widget _buildCountryItem(BuildContext context, int index) {
    final country = controller.countryModels[index];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ListTile(
            leading: Text(
              country.flag!,
              style: const TextStyle(fontSize: 25),
            ),
            title: Text(
              country.name!,
              style: const TextStyle(fontSize: 18),
            ),
            onTap: () => Get.back(result: country),
          ),
          Divider(
            height: 1.0,
            color: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }

  Future<void> _showSearch(BuildContext context) async {
    final result = await showSearch(
      context: context,
      delegate: CountrySearchDelegate(),
    );

    if (result != null) {
      Get.back(result: result);
    }
  }
}

class CountrySearchDelegate extends SearchDelegate<dynamic> {
  final GlobalController controller = Get.find();

  @override
  String get searchFieldLabel => 'Search a country';

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
    fontSize: 18,
    color: Colors.grey,
  );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    final List filteredList = query.isEmpty
        ? controller.countryModels
        : controller.countryModels.where((country) =>
        country.name!.toLowerCase().contains(query.toLowerCase())).toList();

    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          final country = filteredList[index];
          return ListTile(
            leading: Text(
              country.flag!,
              style: const TextStyle(fontSize: 25),
            ),
            title: Text(country.name!),
            onTap: () => close(context, country),
          );
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
      appBarTheme: super.appBarTheme(context).appBarTheme.copyWith(
        elevation: 0.5,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}