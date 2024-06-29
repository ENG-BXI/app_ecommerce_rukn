class productModel {
  late String title;
  late double price;
  late String description;
  late String category;
  late String image;
  late ratingProduct rating;

  productModel.fromJson(Map<String, dynamic> json) {
    this.title = json["title"];
    this.price = json["price"];
    this.description = json["description"];
    this.category = json["category"];
    this.image = json["image"];
    this.rating = ratingProduct.fromJson(json["rating"]);
  }
}

class ratingProduct {
  late double rate;
  late int count;
  ratingProduct.fromJson(Map<String, dynamic> json) {
    this.rate = json["rate"];
    this.count = json["count"];
  }
}

/*
 {
        "id": 1,
        "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
        "price": 109.95,
        "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
        "category": "men's clothing",
        "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
        "rating": {
            "rate": 3.9,
            "count": 120
        }
    },
*/