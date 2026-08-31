import 'dart:io';

void main(){
  cadastrarFuncionario({required String nome, String? cargo}){
    print("Digite o nome do funcionário:");
    nome = stdin.readLineSync() ?? "Nome não informado";

    print("Digite o cargo do funcionário:");
    cargo = stdin.readLineSync();

    return () => print("Boas Vindas $nome " + (cargo ?? "Cargo não informado"));
  }

  cadastrarFuncionario(nome: "", cargo: "")();
}