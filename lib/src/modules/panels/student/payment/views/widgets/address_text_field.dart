import 'package:go7eight/src/core/app_export.dart';

class AddressTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;

  const AddressTextField(
      {super.key, required this.textEditingController, required this.hint});
  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: hint.tr,
      controller: textEditingController,
      showLabel: false,
      shadowOpacity: 0,
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColor.textFieldBackground
          : AppColor.black,
      showBoarder: true,
      boarderColor: AppColor.boarderBlueGrey,
    );
  }
}
