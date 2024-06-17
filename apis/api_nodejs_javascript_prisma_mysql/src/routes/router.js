// src\routes\router.js
import { ProductRoute } from './product.route.js'
import { CategoryRoute } from './category.route.js'

export class Router {
    constructor(app) {
        this.app = app
        this.routes()
    }

    routes() {
        this.app.use('/products', new ProductRoute(this.app).router)  
        this.app.use('/categories', new CategoryRoute(this.app).router)      
    }
}