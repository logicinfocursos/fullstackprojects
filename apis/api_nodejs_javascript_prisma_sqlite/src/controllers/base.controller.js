// src\controllers\base.controller.js
export class BaseController {

    constructor(repository) {
        this.repository = repository
    }

    async getAll(_, response) {

        try {
            const result = await this.repository.getAll()
            const objectList = result.map(object => this.repository.mapObject(object))

            response.status(200).send(objectList)

        } catch (e) {
            response.status(400).send(e)
        }
    }

    async getById(request, response) {
        try {
            const result = await this.repository.getById(parseInt(request.params.id))
            const mappedObject = this.repository.mapObject(result)

            response.status(200).send(mappedObject)

        } catch (e) {
            response.status(400).send(e)
        }
    }

    async create(request, response) {
        response.status(200).send(await this.repository.create(request.body))
    }

    async update(request, response) {
        response.status(200).send(await this.repository.update(parseInt(request.params.id), request.body))
    }

    async erase(request, response) {
        response.status(200).send(await this.repository.erase(parseInt(request.params.id)))
    }
}