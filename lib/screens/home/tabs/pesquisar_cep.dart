import 'package:flutter/material.dart';
import 'package:flutter_cep_lookup/models/cep.dart';
import 'package:flutter_cep_lookup/models/cep_back4app.dart';
import 'package:flutter_cep_lookup/repositories/cep_back4app.dart';
import 'package:flutter_cep_lookup/service/viacep.dart';
import 'package:flutter_cep_lookup/utils/formatters/cep.dart';
import 'package:flutter_cep_lookup/widgets/cep_info.dart';
import 'package:flutter_cep_lookup/widgets/cep_salvo_dialog.dart';

class PesquisarCEPTab extends StatefulWidget {
  const PesquisarCEPTab({super.key});

  @override
  State<PesquisarCEPTab> createState() => _PesquisarCEPTabState();
}

class _PesquisarCEPTabState extends State<PesquisarCEPTab> {
  final ViaCEPService _viacep = ViaCEPService();
  final CEPBack4AppRepository _repository = CEPBack4AppRepository();

  bool _loading = false;
  CEPModel _cepInfo = CEPModel();
  String? _inputError;

  _validarCampo(String value) {
    _inputError = value.length == 8 ? null : "O input deve ter 8 digitos";
    setState(() {});
  }

  Future<void> _getCEP(String value) async {
    _validarCampo(value);
    if (value.length == 8) {
      _loading = true;
      _cepInfo = CEPModel();
      setState(() {});

      _cepInfo = await _viacep.getData(value);

      _loading = false;
      setState(() {});
    }
  }

  Future<void> _salvarCEP() async {
    _loading = true;
    setState(() {});

    await _repository.adicionar(CEPBack4AppModel.fromCEPModel(_cepInfo));

    _loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: _loading
                ? const CircularProgressIndicator()
                : CEPInfo(_cepInfo),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
          child: Column(
            children: [
              TextField(
                textInputAction: TextInputAction.search,
                inputFormatters: [CEPInputFormatter()],
                decoration:
                    InputDecoration(labelText: "CEP", errorText: _inputError),
                keyboardType: TextInputType.number,
                onSubmitted: (value) {
                  String v = value.replaceAll("-", "");
                  _getCEP(v);
                },
                onChanged: (value) {
                  String v = value.replaceAll("-", "");
                  if (_cepInfo.cep != "") {
                    _cepInfo = CEPModel();
                    setState(() {});
                  }
                  if (v.length >= 8) {
                    _validarCampo(v);
                  }
                },
              ),
              if (!_cepInfo.erro && _cepInfo.cep.isNotEmpty)
                Column(
                  children: [
                    const SizedBox(height: 4),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _salvarCEP().then((value) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return CEPSalvoDialog(_cepInfo.cep);
                              },
                            );
                          });
                        },
                        child: const Text("Salvar"),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
