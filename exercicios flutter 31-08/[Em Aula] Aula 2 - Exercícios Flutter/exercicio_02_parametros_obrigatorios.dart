/* 
 * EXERCÍCIO 2: Parâmetros Nomeados Obrigatórios
 * Muitas vezes no Flutter precisamos garantir que um parâmetro nomeado seja 
 * obrigatoriamente enviado. Usamos uma palavra reservada antes do tipo.
 * Complete o construtor da função 'cadastrarUsuario'.
 */

// 1. Torne o parâmetro nomeado 'nome' obrigatório usando a palavra-chave correta
void cadastrarUsuario({required String nome, int? idade}) {
  print("Usuário cadastrado: $nome");
}

void main() {
  cadastrarUsuario(nome: "Carlos"); // Deve compilar normalmente
}
