import 'package:flutter/material.dart';
import 'package:maid/widgets/parameter_widgets/n_predict_parameter.dart';
import 'package:maid/widgets/parameter_widgets/penalty_frequency_parameter.dart';
import 'package:maid/widgets/parameter_widgets/penalty_present_parameter.dart';
import 'package:maid/widgets/parameter_widgets/seed_parameter.dart';
import 'package:maid/widgets/parameter_widgets/string_parameter.dart';
import 'package:maid/widgets/parameter_widgets/temperature_parameter.dart';
import 'package:maid/widgets/parameter_widgets/top_p_parameter.dart';
import 'package:maid/widgets/dropdowns/model_dropdown.dart';

class OpenAiPlatform extends StatelessWidget {
  const OpenAiPlatform({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      StringParameter(title: "API Token", parameter: "api_key"),
      Divider(
        height: 20,
        indent: 10,
        endIndent: 10,
        color: Theme.of(context).colorScheme.primary,
      ),
      StringParameter(title: "Remote URL", parameter: "remote_url"),
      const SizedBox(height: 8.0),
      const ModelDropdown(),
      const SizedBox(height: 20.0),
      const SeedParameter(),
      const TemperatureParameter(),
      const PenaltyFrequencyParameter(),
      const PenaltyPresentParameter(),
      const NPredictParameter(),
      const TopPParameter()
    ]);
  }
}
