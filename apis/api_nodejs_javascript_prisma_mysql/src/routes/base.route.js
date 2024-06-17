// src\routes\base.route.js
import { Router } from 'express'

export class BaseRoute {
    constructor(controller, app) {
        this.router = Router()
        this.controller = controller
        this.setRoutes()
    }

    getAll = (request, response) => {
        this.controller.getAll(request, response)
    }

    getById = (request, response) => {
        this.controller.getById(request, response)
    }

    getByField = (request, response) => {
        this.controller.getByField(request, response)
    }

    create = (request, response) => {
        this.controller.create(request, response)
    }

    update = (request, response) => {
        this.controller.update(request, response)
    }

    erase = (request, response) => {
        this.controller.erase(request, response)
    }

    setRoutes() {
        this.router.get('/', this.getAll)              
        this.router.get('/:id?', this.getById)
        this.router.get('/:field?/:value?', this.getByField)
        this.router.post('/', this.create)
        this.router.put('/:id?', this.update)
        this.router.patch('/:id?', this.update)
        this.router.delete('/:id?', this.erase)
    }
}