import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:flutter_precisava/models/comentario.dart';
import 'package:flutter_precisava/models/deputado.dart';
import 'package:flutter_precisava/models/despesa.dart';
import 'package:flutter_precisava/models/user.dart';
import 'package:flutter_precisava/models/reacao.dart';
import 'package:flutter_precisava/models/total_reacoes.dart';

const baseUrl = 'http://132.255.99.34/api/';

Future<User> registerUser(String email, String password,
    String password_confirmation, String nome, String data_nasc) async {
  print("${baseUrl}register");
  final response = await http.post("${baseUrl}register", body: {
    "email": email,
    "password": password,
    "password_confirmation": password_confirmation,
    "nome": nome,
    "data_nasc": data_nasc
  });

  if (response.statusCode == 201) {
    return User.fromJson(json.decode(response.body));
  } else {
    print("${response.statusCode}");
  }
}

Future<User> getUser(String email, String password) async {
  final response = await http
      .post("${baseUrl}login", body: {"email": email, "password": password});

  if (response.statusCode == 200) {
    return User.fromJson(json.decode(response.body));
  } else {
    print("${response.statusCode}");
  }
}

Future<List<Deputado>> getDeputados(String token) async {
  final response = await http.get("${baseUrl}deputados",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
  List<Deputado> deputados = new List();

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    //print(responseJson);
    for (var deputado in responseJson) {
      Deputado dep = Deputado.fromJson(deputado);
      deputados.add(dep);
    }
    return deputados;
  } else {
    print("${response.statusCode}");
    return deputados;
  }
}

Future<List<Despesa>> getDespesas(
    int deputado_id, String token, int indexPage) async {
  final response = await http.get(
      "${baseUrl}deputados/$deputado_id/despesas?page=$indexPage",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  List<Despesa> despesas = new List();

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    for (var despesa in responseJson['data']) {
      Despesa des = Despesa.fromJson(despesa);
      despesas.add(des);
    }
    return despesas;
  } else {
    print("${response.statusCode}");
    return despesas;
  }
}

Future<Despesa> getDespesa(
    int deputado_id, String token, int despesa_id) async {
  final response = await http.get(
      "${baseUrl}deputados/$deputado_id/despesas/$despesa_id",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  Despesa despesa = new Despesa();

  if (response.statusCode == 200) {
    despesa = Despesa.fromJson(json.decode(response.body));
    
    return despesa;
  } else {
    print("${response.statusCode}");
    return despesa;
  }
}

Future<List<Comentario>> getComentarios(
    int deputado_id, int despesa_id, String token) async {
  final response = await http.get(
      "${baseUrl}deputados/$deputado_id/despesas/$despesa_id/comentarios",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  List<Comentario> comentarios = new List();
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    for (var comentario in responseJson['data']) {
      Comentario comm = Comentario.fromJson(comentario);
      comentarios.add(comm);
    }
  } else {
    print("${response.statusCode}");
  }
  //comentarios = comentarios.reversed.toList();
  return comentarios;
}

Future<Comentario> sendComment(
    int deputado_id, int despesa_id, String descricao, String token) async {
  final response = await http.post(
      "${baseUrl}deputados/$deputado_id/despesas/$despesa_id/comentario",
      body: {"descricao": descricao},
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  if (response.statusCode == 200) {
    return Comentario.fromJson(json.decode(response.body));
  } else {
    print(response.body.toString());
    print("teste ${response.statusCode}");
  }
}

Future<Reacao> sendReaction(
    int reacao, int deputado_id, int despesa_id, String token) async {
  final response = await http.post(
      "${baseUrl}deputados/$deputado_id/despesas/$despesa_id/reacao",
      body: {"reacao": reacao.toString()},
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  if (response.statusCode == 200) {
    return Reacao.fromJson(json.decode(response.body));
  } else {
    print("${response.statusCode}");
  }
}

Future<List<TotalReacoes>> getTotalReacoes(String token) async {
  final response = await http.get("${baseUrl}reacoes",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
  List<TotalReacoes> totalReacoes = new List();

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    for (var totReact in responseJson) {
      totalReacoes.add(TotalReacoes.fromJson(totReact));
    }
    return totalReacoes;
  } else {
    print("${response.statusCode}");
  }
}

Future<List<Deputado>> getDeptReacoes(String token) async {
  final response = await http.get("${baseUrl}deputados",
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
  List<Deputado> deputados = new List();

  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);
    //print(responseJson);
    List<TotalReacoes> totalReacoes = await getTotalReacoes(token);
    for (var deputado in responseJson) {
      Deputado dep = Deputado.fromJson(deputado);
      for (var react in totalReacoes) {
        if (dep.id == react.deputado_id) {

          dep.total_reacoes_negativas = react.reacoes_negativas;
          dep.total_reacoes_positivas = react.reacoes_positivas;
        }
      }
      deputados.add(dep);
    }
    return deputados;
  } else {
    print("${response.statusCode}");
    return deputados;
  }
}
