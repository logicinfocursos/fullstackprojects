// src\routes\category.route.js
import { BaseRoute } from './base.route.js'
import { CategoryController } from '../controllers/category.controller.js'

export class CategoryRoute extends BaseRoute {
    constructor(app) {
       
        super(new CategoryController(), app)
    }
}