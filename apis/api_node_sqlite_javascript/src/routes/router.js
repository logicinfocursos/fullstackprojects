// src\routes\router.js
import { ProductRoute } from './product.route.js'

export class Router {
    constructor(app) {
        this.app = app
        this.routes()
    }

    routes() {
        this.app.use('/products', new ProductRoute(this.app).router)      
    }
}