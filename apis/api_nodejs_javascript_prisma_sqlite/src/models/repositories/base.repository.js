// src\models\repositories\base.repository.js

import { prisma } from '../../services/prisma.js'
export class BaseRepository {    

    constructor(entity) {
        this.entity = entity        
    }

    async getAll() {
        const result = await prisma[this.entity].findMany({})

        return result
    }

    async getById(id) {

        console.log("BaseRepository -> getById -> id", id, this.entity)
        const result = await prisma[this.entity].findUnique({
            where: { id }
        })

        return result
    }

    async getByField(field, value) {
        const isNumeric = !isNaN(value);
        const queryValue = isNumeric ? parseInt(value) : value;
    
        /* const result = await prisma[this.entity].findMany({
            where: {
                [field]: {
                    contains: queryValue
                }
            }
        }) */
            const result = await prisma[this.entity].findMany({
                where: {
                    [field]: queryValue
                }
            })
        return result;
    }

    async create(data) {
        const result = await prisma[this.entity].create({
            data
        })

        return result
    }

    async update(id, data) {
        const result = await prisma[this.entity].update({
            where: { id },
            data
        })

        return result
    }

    async erase(id) {

        const result = await prisma[this.entity].delete({
            where:  {id}
        })

        return result
    }

    mapObject(object) {
        let newObject = {}
        Object.keys(object).forEach((key) => {
            newObject[key] = object[key]
        })
        return newObject
    }
}