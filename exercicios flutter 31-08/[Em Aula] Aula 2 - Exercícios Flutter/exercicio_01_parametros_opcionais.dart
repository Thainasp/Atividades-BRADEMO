/* 
 * EXERCÍCIO 1: Parâmetros Nomeados Opcionais
 * Em Dart, parâmetros entre chaves {} são nomeados e, por padrão, opcionais.
 * Complete o código da função 'saudar' para aceitar um parâmetro nomeado 
 * 'mensagem' do tipo String que aceita valores nulos (opcional).
 */

// 1. Complete a assinatura da função com o parâmetro nomeado opcional
void saudar({String? mensagem}) {
  if (mensagem != null) {
    print("Mensagem: $mensagem");
  } else {
    print("Sem mensagem registrada.");
  }
}

void main() {
  saudar(mensagem: "Bem-vindo ao IFSP!");
  saudar(); // Deve funcionar sem passar parâmetros
}
