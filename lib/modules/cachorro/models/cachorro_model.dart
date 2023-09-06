class Cachorro {
  int? id;
  String? nome;
  String? descricao;
  int? idade;

  Cachorro({
    this.id,
    this.nome,
    this.descricao,
    this.idade,
  });

  @override
  String toString() {
    return "Cachorro => Id: $id, Nome: $nome, Descrição: $descricao, Idade: $idade";
  }

}