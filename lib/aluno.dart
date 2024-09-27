class Aluno{
  
  int _ra= 0;
  String _nome = "";

  Aluno();

  Aluno.fromJson (Map <String, dynamic> json)
  :
    _ra = json['ra'],
    _nome = json['nome']
  ;

  get ra => this._ra;

 set ra( value) => this._ra = value;

  get nome => this._nome;

 set nome( value) => this._nome = value;

}