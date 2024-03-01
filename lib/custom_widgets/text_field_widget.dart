import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String? errorText;
  final String title;
  final void Function(String) onChanged;
  final TextEditingController tecController;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? keyboardType;
  final int? maxLength;

  const TextFieldWidget(
      {super.key,
      this.errorText,
      required this.title,
      required this.onChanged,
      required this.tecController,
      this.onFieldSubmitted,
      this.keyboardType,
      this.maxLength});

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
          style: const TextStyle(color: Colors.white),
          cursorColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(0.16),
          controller: tecController,
          onFieldSubmitted: onFieldSubmitted,
          keyboardType: keyboardType ?? TextInputType.text,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: 7,
            ),
            // enabledBorder: InputBorder.none,
            // focusedBorder: InputBorder.none,
            filled: true,
            isDense: true,
            focusColor: Colors.transparent,
            fillColor: Colors.grey,
            errorBorder: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
