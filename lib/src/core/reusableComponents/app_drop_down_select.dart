import '../app_export.dart';
import '../constants/colors.dart';
import '../constants/ratio_size.dart';
import 'app_container.dart';
import 'app_text_style.dart';

class AppDropDownField extends StatefulWidget {
  final List<String> items;  // List of items for the dropdown
  final TextEditingController? controller;  // TextEditingController for the dropdown value
  final String labelText;
  final bool showLabel;
  final double labelFontSize;
  final Color? labelColor;
  final Color? borderColor;
  final double borderRadius;
  final double borderWidth;
  final Color? dropdownBackgroundColor;
  final String? Function(String?)? validator;  // Validator function for validation
  final Function(String)? onSelected;  // Callback for selected item
  final Function()? onClick;  // Callback for dropdown click
  final bool showMenu;  // Whether to show dropdown menu or not

  const AppDropDownField({
    super.key,
    required this.items,
    this.controller,
    this.labelText = "Select Item",
    this.showLabel = true,
    this.labelFontSize = 14,
    this.labelColor = AppColor.primary,
    this.borderColor,
    this.borderRadius = 10.0,
    this.borderWidth = 1.0,
    this.dropdownBackgroundColor,
    this.validator,
    this.onSelected,
    this.onClick,
    this.showMenu = true,  // Default to showing the menu
  });

  @override
  _AppDropDownFieldState createState() => _AppDropDownFieldState();
}

class _AppDropDownFieldState extends State<AppDropDownField> {
  String? selectedValue;  // Manage selected value internally
  String? errorMessage;  // Error message for validation
  bool isMenuOpen = false;  // Control to show or hide dropdown menu

  @override
  void initState() {
    super.initState();
    selectedValue = widget.controller?.text;  // Initialize with controller's text if available
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label for the dropdown
        if (widget.showLabel)
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              widget.labelText,
              style: TextStyle(
                fontSize: widget.labelFontSize,
                color: widget.labelColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        const SizedBox(height: 4),

        // DropdownButtonFormField container
        GestureDetector(
          onTap: () {
            // Trigger onClick callback if provided
            if (widget.onClick != null) {
              widget.onClick!();
            }

            // Toggle dropdown menu visibility based on showMenu property
            if (widget.showMenu) {
              setState(() {
                isMenuOpen = !isMenuOpen;  // Toggle dropdown visibility
              });
            }
          },
          child: AppContainerWidget(
            disableDefaultVPadding: true,
            disableDefaultHPadding: true,
            child: Material(
              color: widget.dropdownBackgroundColor ?? AppColor.white,
              borderRadius: BorderRadius.circular(widget.borderRadius),
              elevation: 0,
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField<String>(
                  isExpanded: true,  // Ensure dropdown expands
                  value: selectedValue,  // Use the selected value for the dropdown
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppRatioSize.getRatioWidth() / 32,
                      vertical: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? AppColor.borderColor,
                        width: widget.borderWidth,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      borderSide: BorderSide(
                        color: widget.borderColor ?? AppColor.primary,
                        width: widget.borderWidth,
                      ),
                    ),
                  ),
                  items: widget.showMenu && isMenuOpen
                      ? widget.items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()
                      : [],  // Show empty list if menu is not open
                  onChanged: (value) {
                    // Update the selected value and the controller's text
                    setState(() {
                      selectedValue = value;
                    });

                    if (widget.controller != null && value != null) {
                      widget.controller?.text = value;
                    }

                    // Trigger callback when an item is selected
                    if (widget.onSelected != null && value != null) {
                      widget.onSelected!(value);
                    }
                  },
                  validator: (value) {
                    // Use the custom validator and display the error below
                    final error = widget.validator?.call(value);
                    setState(() {
                      errorMessage = error;
                    });
                    return null;  // Do not show error inside the field
                  },
                  hint: Text(
                    "Select an option",
                    style: TextStyleX.textFieldHint(context).copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        // Display the error message below the dropdown
        if (errorMessage != null && errorMessage!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 4.0, top: 4.0),
            child: Text(
              errorMessage!,
              style: TextStyle(
                fontSize: widget.labelFontSize - 2,
                color: AppColor.red,
              ),
            ),
          ),
      ],
    );
  }
}
