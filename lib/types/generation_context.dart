import 'package:flutter/material.dart';
import 'package:maid/providers/character.dart';
import 'package:maid/providers/model.dart';
import 'package:maid/providers/session.dart';
import 'package:maid/static/logger.dart';
import 'package:provider/provider.dart';

class GenerationContext {
  late List<Map<String, dynamic>> _messages;
  late String? _remoteUrl;
  late String? _remoteModel;
  late String? _path;
  late String _prePrompt;
  late String _userAlias;
  late String _responseAlias;
  late int _nKeep;
  late int _seed;
  late int _nPredict;
  late int _topK;
  late double _topP;
  late double _tfsZ;
  late double _typicalP;
  late int _penaltyLastN;
  late double _temperature;
  late double _penaltyRepeat;
  late double _penaltyPresent;
  late double _penaltyFreq;
  late int _mirostat;
  late double _mirostatTau;
  late double _mirostatEta;
  late int _penalizeNewline;
  late int _instruct;
  late int _interactive;
  late int _memoryF16;
  late int _nCtx;
  late int _nBatch;
  late int _nThread;

  List<Map<String, dynamic>> get messages => _messages;
  String? get remoteUrl => _remoteUrl;
  String? get remoteModel => _remoteModel;
  String? get path => _path;
  String get prePrompt => _prePrompt;
  String get userAlias => _userAlias;
  String get responseAlias => _responseAlias;
  int get nKeep => _nKeep;
  int get seed => _seed;
  int get nPredict => _nPredict;
  int get topK => _topK;
  double get topP => _topP;
  double get tfsZ => _tfsZ;
  double get typicalP => _typicalP;
  int get penaltyLastN => _penaltyLastN;
  double get temperature => _temperature;
  double get penaltyRepeat => _penaltyRepeat;
  double get penaltyPresent => _penaltyPresent;
  double get penaltyFreq => _penaltyFreq;
  int get mirostat => _mirostat;
  double get mirostatTau => _mirostatTau;
  double get mirostatEta => _mirostatEta;
  int get penalizeNewline => _penalizeNewline;
  int get instruct => _instruct;
  int get interactive => _interactive;
  int get memoryF16 => _memoryF16;
  int get nCtx => _nCtx;
  int get nBatch => _nBatch;
  int get nThread => _nThread;

  GenerationContext({
    required Model model,
    required Character character,
    required Session session,
  }) {
    try {
      Logger.log(model.toMap().toString());
      Logger.log(character.toMap().toString());
      Logger.log(session.toMap().toString());

      _messages = character.examples;
      _messages.addAll(session.getMessages());

      _remoteUrl = model.parameters["remote_url"];
      _remoteModel = model.parameters["remote_model"];
      _path = model.parameters["path"];
      _prePrompt = character.prePrompt;
      _nKeep = model.parameters["n_keep"];
      _seed = model.parameters["random_seed"] ? -1 : model.parameters["seed"];
      _nPredict = model.parameters["n_predict"];
      _topK = model.parameters["top_k"];
      _topP = model.parameters["top_p"];
      _tfsZ = model.parameters["tfs_z"];
      _typicalP = model.parameters["typical_p"];
      _penaltyLastN = model.parameters["penalty_last_n"];
      _temperature = model.parameters["temperature"];
      _penaltyRepeat = model.parameters["penalty_repeat"];
      _penaltyPresent = model.parameters["penalty_present"];
      _penaltyFreq = model.parameters["penalty_freq"];
      _mirostat = model.parameters["mirostat"];
      _mirostatTau = model.parameters["mirostat_tau"];
      _mirostatEta = model.parameters["mirostat_eta"];
      _penalizeNewline = model.parameters["penalize_nl"] ? 1 : 0;
      _instruct = model.parameters["instruct"] ? 1 : 0;
      _interactive = model.parameters["interactive"] ? 1 : 0;
      _memoryF16 = model.parameters["memory_f16"] ? 1 : 0;
      _nCtx = model.parameters["n_ctx"];
      _nBatch = model.parameters["n_batch"];
      _nThread = model.parameters["n_threads"];
    } catch (e) {
      Logger.log(e.toString());
    }
  }
}
