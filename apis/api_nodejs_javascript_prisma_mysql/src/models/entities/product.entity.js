// src\models\entities\product.entity.js
export class Product {

    constructor(id, name, price, categoryid) {
        this.id = id
        this.name = name
        this.price = price
        this.categoryid = categoryid
    }
}
