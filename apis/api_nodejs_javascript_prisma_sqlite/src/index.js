// index.js
// Importando o módulo Express, que é um framework para construir aplicações web em Node.js
import express from 'express'

// Importando o módulo CORS, que permite ou bloqueia pedidos de recursos em um servidor web dependendo de onde a solicitação HTTP foi iniciada
import cors from 'cors'

// Importando o módulo dotenv, que permite carregar variáveis de ambiente de um arquivo .env para process.env
import 'dotenv/config'

// Importando o módulo Router de um arquivo local chamado router.js dentro da pasta routes
import { Router } from './routes/router.js'

// Definindo a porta do servidor a partir das variáveis de ambiente ou usando 3111 como padrão
const port = process.env.PORT || 3111

// Criando uma instância do aplicativo Express
const app = express()

// Usando o middleware CORS no aplicativo Express para permitir solicitações de diferentes origens
app.use(cors())

// Usando o middleware express.json() no aplicativo Express para analisar corpos de solicitação HTTP JSON
app.use(express.json())

// Criando uma nova instância do Router, passando o aplicativo Express como argumento
new Router(app)

// Iniciando o servidor Express para escutar solicitações HTTP na porta especificada
app.listen(port, () => {
    // Imprimindo uma mensagem no console para indicar que o servidor está rodando e em qual porta
    console.log(`Servidor rodando na porta ${port}`)
})