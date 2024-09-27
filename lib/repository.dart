import 'package:flutter_application_api_java/aluno.dart';

class AlunoRepository{
  List<Aluno> _listaAL = [];

  AlunoRepository();

  get listaAL => this._listaAL;

  set listaAL(value) => this._listaAL;
}