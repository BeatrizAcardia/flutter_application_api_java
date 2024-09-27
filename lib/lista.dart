import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_api_java/aluno.dart';
import 'package:flutter_application_api_java/repository.dart';
import 'package:http/http.dart' as http;

class Minhalista extends StatefulWidget {
  const Minhalista({super.key});

  @override
  State<Minhalista> createState() => _MinhalistaState();
}

class _MinhalistaState extends State<Minhalista> {

  Aluno al = Aluno();
  AlunoRepository alRepo = AlunoRepository();

  Future<void> fazerRequisicao() async{
    var url = Uri.parse('http://localhost:8080/apiAluno/todos');
    http.Response response = await http.get(url);
    if(response.statusCode==200){
      List listaAL = jsonDecode(response.body) as List;
      alRepo.listaAL = listaAL.map(
        (listaAL) => Aluno.fromJson(listaAL)).toList();
      setState(() {
        
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, 
        title: Text("Lista de Alunos", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Playwrite'),), 
        backgroundColor: Colors.pink[700]
      ),
      body: ListView.builder(
        itemCount: alRepo.listaAL.length,
        itemBuilder: (context, inex){
          return ListTile(
            title: Text(alRepo.listaAL[inex].nome.toString()),
            subtitle: Text(alRepo.listaAL[inex].ra.toString()),
          );
        }  
        ),
    ); 
  }
}