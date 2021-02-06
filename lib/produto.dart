class Produto {
  int id;
  String nome;

  Produto({this.id, this.nome});

  Produto.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nome = json['Nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Nome'] = this.nome;
    return data;
  }
}
