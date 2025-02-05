import 'package:flutter/material.dart';

import '../app_export.dart';

class CountryCodePicker extends StatefulWidget {

  final Function(String countryCode)? onCountryCodeSelected; // Callback to return selected country code

  const CountryCodePicker({Key? key, this.onCountryCodeSelected}) : super(key: key);


  @override
  _CountryCodePickerState createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  final FocusNode _focusNode = FocusNode();
  String _selectedCountryCode = "+255"; // Default country code
  String _selectedCountryName = "Tanzania"; // Default country name
  String _selectedCountryFlag = "🇹🇿"; // Default flag
  bool isSelected = false;

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

  List<Map<String, String>> _filteredCountries = []; // Filtered list for search

  @override
  void initState() {
    super.initState();
    _filteredCountries = List.from(_countries); // Initialize with all countries

    // Add listeners to manage active/inactive border color
    _focusNode.addListener(() {
      setState(() {}); // Update the UI when the focus changes
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _showCountryPicker() {
    // Request focus when the picker is shown
    _focusNode.requestFocus();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
              return Container(
                padding: const EdgeInsets.only(top: 50,left: 16,right: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                              Icons.arrow_back,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            _focusNode.unfocus(); // Remove focus when the picker is closed
                          },
                        ),
                        SizedBox(width: 20,),
                        Text(
                          "Select your country",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Search for a country",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (query) {
                          // Update the filtered list based on the search query
                          setModalState(() {
                            _filteredCountries = _countries
                                .where((country) => country["name"]!
                                .toLowerCase()
                                .contains(query.toLowerCase()))
                                .toList();
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: _filteredCountries.length,
                          itemBuilder: (context, index) {
                            final country = _filteredCountries[index];
                            return ListTile(
                              leading: Text(
                                country["flag"] ?? "",
                                style: const TextStyle(fontSize: 24),
                              ),
                              title: Text(country["name"] ?? "",style: TextStyle(
                                fontSize: 16
                              ),),
                              trailing: Text(country["code"] ?? "",style: TextStyle(
                                fontSize: 16
                              ),),
                              onTap: () {
                                setState(() {
                                  _selectedCountryCode = country["code"]!;
                                  _selectedCountryName = country["name"]!;
                                  _selectedCountryFlag = country["flag"]!;
                                });
                                isSelected = true;
                                setState(() {});
                                widget.onCountryCodeSelected!(country["code"]!);
                                Navigator.pop(context);
                                _filteredCountries.addAll(_countries); // Reset the filtered list
                                _focusNode.unfocus(); // Remove focus when a country is selected
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Manually handle focus
        if (!_focusNode.hasFocus) {
          _focusNode.requestFocus();
        }
        _showCountryPicker();
      },
      child: AppContainerWidget(
        disableDefaultVPadding: true,
        disableDefaultHPadding: true,
        shadowOpacity: 0.07,
        child: Material(
          color: Colors.white,
          elevation: 0,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(
                color: _focusNode.hasFocus ? AppColor.primary : AppColor.white,
                width: 1.5,
              ),
            ),
            child: Row(
              children: [
                Text(
                  _selectedCountryFlag,
                  style: const TextStyle(fontSize: 23),
                ),
                const SizedBox(width: 8),
                Text(
                  "$_selectedCountryCode",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
