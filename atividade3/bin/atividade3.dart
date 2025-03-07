import 'package:atividade3/atividade3.dart' as atividade3;

import 'dart:io';

void main() {
  Funcionario fun1 = Funcionario(1, "Michelle", "Santiago");
  fun1.setSalario = 300.00;

  Funcionario fun2 = Funcionario(2, "Salma", "Cardoso");
  fun2.setSalario = 500.00;

  Empresa.adicionarFuncionario(fun1);
  Empresa.adicionarFuncionario(fun2);

  fun1.aumentarSalario(20);

  Empresa.listarFuncionarios();
  Empresa.removerFuncionario(2);
  Empresa.listarFuncionarios();

}

class Funcionario {

  double? _salario;
  
  final int id;
  final String nome ;
  final String cargo ;

  Funcionario (this.id, this.nome,this.cargo);
  
  get getsalario => _salario;
  set setsalario(double novosalario) {
    _salario = novosalario;

  }



  void aumentarsalario(double percentual) {

    if (_salario == null || _salario! < 0) {
      print("Esse salário é inválido");
    } else {
      _salario = _salario! + (_salario! * percentual / 100);
      print("Esse é o salário atualizado: $_salario");

    }

  }



  void exibirInformacoes() {
    print("ID: $id | Nome: $nome | Cargo: $cargo | Salário: $_salario");  }
   
   @override

  String toString() {
    return 'ID: $id | Nome: $nome | Cargo: $cargo | Salário:$_salario';
 }
}



class Empresa{
  static List<Funcionario> _funcionarios = [];

  static void adicionarFuncionario(Funcionario funcionario) {
    _funcionarios.add(funcionario);
    print("${funcionario.nome} foi adicionado com suceeso!");
}


  static void removerFuncionario(int id) {

    _funcionarios.removeWhere((func) => func.id == id);

    print("O ID: $id foi removido com suceeso!");
}

 static void listarFuncionarios() {
    print("\nLista dos Funcionários:");
    for (var funcionario in _funcionarios) {
      print(funcionario);
    }
  }


}