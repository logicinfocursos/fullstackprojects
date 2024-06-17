// src\controllers\product.controller.js
import { BaseController } from './base.controller.js'
import { ProductRepository } from '../models/repositories/product.repository.js'

export class ProductController extends BaseController {

    constructor() {
        super(new ProductRepository())
    }
}