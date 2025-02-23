import 'package:flutter/material.dart';
import 'package:maid/providers/model.dart';
import 'package:llama_cpp_dart/llama_cpp_dart.dart';
import 'package:provider/provider.dart';

class FormatDropdown extends StatelessWidget {
  const FormatDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(builder: (context, model, child) {
      return ListTile(
          title: Row(
        children: [
          const Expanded(
            child: Text("Prompt Format"),
          ),
          DropdownMenu<PromptFormatType>(
            dropdownMenuEntries: const [
              DropdownMenuEntry<PromptFormatType>(
                value: PromptFormatType.raw,
                label: "Raw",
              ),
              DropdownMenuEntry<PromptFormatType>(
                value: PromptFormatType.chatml,
                label: "ChatML",
              ),
              DropdownMenuEntry<PromptFormatType>(
                value: PromptFormatType.alpaca,
                label: "Alpaca",
              )
            ],
            onSelected: (PromptFormatType? value) {
              if (value != null) {
                model.setPromptFormat(value);
              }
            },
            initialSelection: model.format,
            width: 200,
          )
        ],
      ));
    });
  }
}
