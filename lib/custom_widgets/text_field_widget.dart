import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final String? errorText;
  final String title;
  final void Function(String) onChanged;
  final TextEditingController tecController;

  final TextInputType? keyboardType;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  const TextFieldWidget(
      {super.key,
      this.errorText,
      required this.title,
      required this.onChanged,
      required this.tecController,
      this.keyboardType,
      this.maxLength,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              errorText != null || errorText?.isEmpty == true
                  ? Expanded(
                      child: Text(
                        "  $errorText",
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          maxLength: maxLength,
          onTapOutside: (e10vent) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          onChanged: onChanged,
          style: const TextStyle(
            color: Colors.black,
          ),
          cursorColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.16),
          controller: tecController,
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: const InputDecoration(
            filled: true,
            isDense: true,
            focusColor: Colors.transparent,
            fillColor: Color.fromARGB(255, 239, 238, 238),
            errorBorder: InputBorder.none,
          ),
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}
