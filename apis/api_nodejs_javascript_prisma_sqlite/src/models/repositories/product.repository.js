// src\models\repositories\product.repository.js
import { BaseRepository } from './base.repository.js'

export class ProductRepository extends BaseRepository {

    constructor() {
        super('product')
    }
}