class RestApi {
  String result;
  List<Products> products;

  RestApi({this.result, this.products});

  RestApi.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  String name;
  String img;
  String price;
  String description;
  int number;
  String time;

  Products(
      {this.id,
      this.name,
      this.img,
      this.price,
      this.description,
      this.number,
      this.time});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    price = json['price'];
    description = json['description'];
    number = json['number'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['price'] = this.price;
    data['description'] = this.description;
    data['number'] = this.number;
    data['time'] = this.time;
    return data;
  }
}
