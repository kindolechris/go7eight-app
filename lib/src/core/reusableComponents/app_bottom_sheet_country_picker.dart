import 'package:flutter/material.dart';
import 'package:go7eight/src/core/app_export.dart';

class CountryCodeBottomSheetPicker extends StatefulWidget {
  final Function(Map<String, String>) onCountrySelected;

  const CountryCodeBottomSheetPicker({
    Key? key,
    required this.onCountrySelected,
  }) : super(key: key);

  @override
  State<CountryCodeBottomSheetPicker> createState() => _CountryCodeBottomSheetPickerState();
}

class _CountryCodeBottomSheetPickerState extends State<CountryCodeBottomSheetPicker> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, String>> _countries = [
    {"name": "Afghanistan", "code": "+93", "flag": "🇦🇫", "mask": "### ### ####"},
    {"name": "Albania", "code": "+355", "flag": "🇦🇱", "mask": "### ### ####"},
    {"name": "Algeria", "code": "+213", "flag": "🇩🇿", "mask": "### ### ####"},
    {"name": "Andorra", "code": "+376", "flag": "🇦🇩", "mask": "### ###"},
    {"name": "Angola", "code": "+244", "flag": "🇦🇴", "mask": "### ### ###"},
    {"name": "Argentina", "code": "+54", "flag": "🇦🇷", "mask": "### ### ####"},
    {"name": "Australia", "code": "+61", "flag": "🇦🇺", "mask": "#### ### ###"},
    {"name": "Austria", "code": "+43", "flag": "🇦🇹", "mask": "#### ### ####"},
    {"name": "Bangladesh", "code": "+880", "flag": "🇧🇩", "mask": "### ### ####"},
    {"name": "Belgium", "code": "+32", "flag": "🇧🇪", "mask": "### ### ###"},
    {"name": "Brazil", "code": "+55", "flag": "🇧🇷", "mask": "(##) #####-####"},
    {"name": "Canada", "code": "+1", "flag": "🇨🇦", "mask": "(###) ###-####"},
    {"name": "China", "code": "+86", "flag": "🇨🇳", "mask": "### #### ####"},
    {"name": "Egypt", "code": "+20", "flag": "🇪🇬", "mask": "### ### ####"},
    {"name": "France", "code": "+33", "flag": "🇫🇷", "mask": "## ## ## ## ##"},
    {"name": "Germany", "code": "+49", "flag": "🇩🇪", "mask": "#### #######"},
    {"name": "India", "code": "+91", "flag": "🇮🇳", "mask": "#####-#####"},
    {"name": "Italy", "code": "+39", "flag": "🇮🇹", "mask": "### #######"},
    {"name": "Japan", "code": "+81", "flag": "🇯🇵", "mask": "### #### ####"},
    {"name": "Kenya", "code": "+254", "flag": "🇰🇪", "mask": "### ### ###"},
    {"name": "Mexico", "code": "+52", "flag": "🇲🇽", "mask": "### ### ####"},
    {"name": "Nigeria", "code": "+234", "flag": "🇳🇬", "mask": "### ### ####"},
    {"name": "Pakistan", "code": "+92", "flag": "🇵🇰", "mask": "### #######"},
    {"name": "Russia", "code": "+7", "flag": "🇷🇺", "mask": "### ###-##-##"},
    {"name": "South Africa", "code": "+27", "flag": "🇿🇦", "mask": "### ### ####"},
    {"name": "South Korea", "code": "+82", "flag": "🇰🇷", "mask": "### #### ####"},
    {"name": "Spain", "code": "+34", "flag": "🇪🇸", "mask": "### ### ###"},
    {"name": "Tanzania", "code": "+255", "flag": "🇹🇿", "mask": "### ### ###"},
    {"name": "Turkey", "code": "+90", "flag": "🇹🇷", "mask": "### ### ####"},
    {"name": "Uganda", "code": "+256", "flag": "🇺🇬", "mask": "### ### ###"},
    {"name": "United Kingdom", "code": "+44", "flag": "🇬🇧", "mask": "#### #######"},
    {"name": "United States", "code": "+1", "flag": "🇺🇸", "mask": "(###) ###-####"},
    {"name": "Vietnam", "code": "+84", "flag": "🇻🇳", "mask": "### #### ####"},
    {"name": "Zimbabwe", "code": "+263", "flag": "🇿🇼", "mask": "### ### ###"},
  ];

  List<Map<String, String>> _filteredCountries = [];

  @override
  void initState() {
    super.initState();
    _filteredCountries = List.from(_countries);
    _searchController.addListener(_filterCountries);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCountries() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCountries = _countries.where((country) {
        return country["name"]!.toLowerCase().contains(query) ||
            country["code"]!.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Select Country',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              // Search field
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search country or code...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Colors.grey[50],
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              // Country list
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredCountries.length,
                  itemBuilder: (context, index) {
                    final country = _filteredCountries[index];
                    return InkWell(
                      onTap: () {
                        widget.onCountrySelected(country);
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            Text(
                              country["flag"]!,
                              style: const TextStyle(fontSize: 24),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                country["name"]!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              country["code"]!,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}