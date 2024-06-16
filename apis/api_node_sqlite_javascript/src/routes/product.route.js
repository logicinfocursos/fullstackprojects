// src\routes\product.route.js
import { BaseRoute } from './base.route.js'
import { ProductController } from '../controllers/product.controller.js'

export class ProductRoute extends BaseRoute {
    constructor(app) {
       
        super(new ProductController(), app)
    }
}