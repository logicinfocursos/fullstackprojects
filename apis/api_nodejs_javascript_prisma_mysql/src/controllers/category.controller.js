// src\controllers\category.controller.js
import { BaseController } from './base.controller.js'
import { CategoryRepository } from '../models/repositories/category.repository.js'

export class CategoryController extends BaseController {

    constructor() {
        super(new CategoryRepository())
    }
}