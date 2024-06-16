# api com node js, express e prisma
[node_express_prisma_template_api](https://github.com/logicinfocursos/node_express_prisma_template_api.git)
[github](https://github.com/logicinfocursos?tab=repositories)

Esse projeto visa ajudá-lo passo-a-passo a criar uma api robusta usando as melhores práticas do mercado. O objetivo é empregar recursos importantes de orientação a objetos como abstract class e herança para minimizar a repetição de código.

Usaremos o padrão de projetos mvc e implementaremos as operações CRUD (create, read, update e delete).

Espero que esse código possa ser usado para você como uma espécie de template ou skeleton "coringa" como um ponto de partida para os seus próximos projetos.

### criar o projeto node js
1- inicializar o projeto:

<pre>
c:\> mkdir api
c:\> cd api
c:\api> npm init -y
</pre>

Isso criará um arquivo package.json na raiz do seu projeto.

### instalar as dependências iniciais do projeto
<pre>
c:\api> npm i express cors dotenv
c:\api> npm i --save-dev nodemon
</pre>

onde:
- express: responsável pela por enviar e receber requisições http e orquestra as rotas do projeto

- cors: CORS (Cross-origin Resource Sharing) é um mecanismo de segurança que bloqueia o acesso de fontes não autorizadas. Esse plugin vai impedir que ocorra um erro de acesso à api, com isso a api irá responder a qualquer requisição independente de sua origem

- dotenv: irá permitir ler os dados das variáveis de ambiente armazenadas no arquivo ".env"

- nodemon: recurso muito útil durante a faze de programação, com ele toda a vez que alterações de código forem salvas, o servidor local será restartado para refletir tais as atualizações

obs.: o uso do parametro --save-dev no npm fará que as dependências assim identificadas sejam configuradas como depências de desenvolvimento, sendo descartadas para o uso em produção

### npm x yarn
nesse tutorial iremos usar o gerenciador de pacotes do próprio nodejs, o npm (e o npx), mas se preferir usar o yarn, fica a seu critério.

como ajustar a sintaxe?
<pre>
npm init -y               | yarn init -y        (inicializar um projeto nodejs)
npm i express             | yarn add express    (instalar uma dependência)
npm i --save-dev nodemon  | yarn add -D nodemon (instalar uma dependência como dev)
npm run dev               | yarn dev            (executar o script)
npm i                     | yarn                (criar o node_modules)
</pre>
para instalar o yarn:
<pre>
npm i -g yarn
</pre>
obs sobre variações no uso do npm:
- em nosso projeto iremos usar o express que é o framework (ou mini-framework) mais usado em projetos node js
- no lugar de "npm install --save-dev", você pode usar "npm install -D" e no lugar de "install" você pode usar some "i"


# express
Em nosso projeto iremos usar o express que é o framework (ou mini-framework) mais usado em projetos node js.

### criar o primeiro programa do projeto
na raiz do projeto, criar um arquivo de nome "index.js" com os seguintes comandos:

<pre>
import express from 'express'
const app = express()
const port = 3000

app.get('/', (req, res) => {
    res.send('Hello World - logicinfo!')
  })

app.listen(3000, () => {
    console.log(`Server is running on http://localhost:${port}`)
})
</pre>

### antes de "rodar" o projeto
teremos que fazer um ajuste no arquivo "package.json", vamos inserir a seguinte instrução:

<pre>
  "type": "module",
  "scripts": {
    "start": "node --no-warnings ./src/index.js",
    "dev": "nodemon --no-warnings ./src/index.js "
  }
</pre>

onde:
- "type": "module" indicará ao nodejs que será usada a sintaxe mais atual do javascript, permitindo o uso de "import/export"

- "scripts": o projeto terá duas formas de execução: "start" - execução padrão e "dev" - através do nodemon


### nosso primeiro hello world
Pronto, agora podemos executar o nosso projeto pela primeira vez:

<pre>
c:\api> npm run dev
</pre>

no terminal teremos um resultado semelhante a esse:
<pre>
> api@1.0.0 dev
> nodemon --no-warnings ./src/index.js

[nodemon] 3.1.0
[nodemon] to restart at any time, enter `rs`
[nodemon] watching path(s): *.*
[nodemon] watching extensions: js,mjs,cjs,json
[nodemon] starting `node --no-warnings ./src/index.js`
Server is running on port 3000
</pre>

e se consultarmos o navegador na url [localhost:3000/](http://localhost:3000/), teremos a seguinte mensagem:

<pre>
Hello World - logicinfo!
</pre>

# prisma
O prisma é um orm prático e poderoso. Irá nos ajudar a economizar várias linhas de código em toda manipulação das tabelas vinculadas ao projeto.

### instalação e inicialização
Para inicializar o prisma, retorne ao terminal e use a combinação de teclas control + c para interromper a execução atual e liberar o prompt de comando. Digite:

<pre>
c:\api> npm i prisma @prisma/client
c:\api> npx prisma init --datasource-provider sqlite
</pre>

onde:
- prisma e @prisma/client, instala o prisma e a sua estrutura de linha de comando
- inicializa o prisma e indica que o provider será o sqlite

Ao inicializar o prisma, um diretório de nome "prisma" com o arquivo "schema.prisma" é criado, além disso na raíz do projeto também teremos um arquivo de nome ".env" (arquivo de configuração através de variáveis de ambiente).

Nesse projeto para facilitar o estudo, usaremos o sqlite, mas o prisma trabalha também com mysql, postgreSQL, sqlserver, mongoDB, etc. Isso é fantástico, pois vai permitir a troca do sgbd, caso necessário, sem mexer uma linha de código sequer, apenas alterando pequenas configurações nos arquivos "schema.prisma" e ".env".

### configurações
a) arquivo ".env", no caso do sqlite, a string de conexão com os dados de acesso ao banco de dados já vem preenchida e pronta para uso, para mysql e outros sgbd é necessário preencher com os dados de acesso (banco de dados, usuário, etc)

<pre>
"DATABASE_URL="file:./dev.db"
</pre>

b) preencher o arquivo "schema.prisma"
É nesse arquivo que indicamos qual será o provider de banco de dados usado em nosso projeto e também criamos as classes que serão usadas para a criação das tabelas no sgbd.

Para tanto, altere o conteúdo original do arquivo "schema.prisma", inserindo as classes Product e Category:

<pre>
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "sqlite"
  url      = env("DATABASE_URL")
}

model Product {
  id           Int       @id @default(autoincrement())
  name         String?
  price        Decimal?
  created_at   DateTime? @default(now())
  updated_at   DateTime? @updatedAt

  @@map("products")
}

model Category {
  id         Int       @id @default(autoincrement())
  name       String?
  created_at DateTime? @default(now())
  updated_at DateTime? @updatedAt

  @@map("categories")
}
</pre>

Para esse projeto, iremos usar apenas duas entidades, Product e Category.

Obs: 
- a instrução "@@map" é usada para definir o nome da tabela a ser gerada no banco de dados
- quando utilizarmos o prisma iremos nos referir as classes Product e Category sejam escritas com a primeria letra em maiúscula, durante o uso do prisma essas classes serão referenciadas em letra minúscula, por exemplo: prisma.product.findMany()

Para maiores detalhes sobre a estruturação das propriedades vide a documentação do próprio [prisma](https://www.prisma.io/docs/getting-started/setup-prisma/start-from-scratch/relational-databases-typescript-mysql)

A definição dos tipos/tamanhos e demais configurações de propriedades depende das características de cada banco de dados. Em nosso exemplo, estamos usando as definiões aceitas para tabelas em sqlite. Por exemplo, para mysql existem vários outras configurações possíveis para as propriedades/campos das tabelas. Consulte o material referente ao banco de dados escolhido em seu projeto.

c) Criar as tabelas no banco de dados

Após a configuração da estrutura e características das entidades do nosso projeto, podemos criar efetivamente as tabelas em nosso banco de dados. Esse processo ocorre através de um recurso do prisma chamado “Migration” (outros orms também dispõe desse recurso). Para tanto basta rodar o comando:

<pre>
c:\api> npx prisma migrate dev --name init
</pre>

onde: estamos criando uma "migration" de nome "init"

Agora se observarmos o diretório prisma, teremos uma pasta de nome "migrations" e um arquivo sqlite de nome "dev.db" já com as tabelas criadas de acordo com a configuração especificada anteriormente.

### estrutura de pastas do projeto
Agora que as principais configurações do nosso projeto já foram definidas, é o momento de definir a estrutura de pastas. Iremos manter o nosso código na pasta "src" e dentro dela as seguintes sub-pastas:

- controllers
- repositories
- routes

Essa é a estrutura de pastas que iremos adotar:

<pre>
<pre>
/my-api
|-- /assets
|-- /node_modules
|-- /src
|   |-- /controllers
|   |   |-- base.controller.js
|   |   |-- product.controller.js
|   |   |-- category.controller.js
|   |-- /routes
|   |   |-- base.route.js
|   |   |-- product.route.js
|   |   |-- category.route.js
|   |-- /models
|   |   |-- /entities
|   |   |   |-- base.entity.js
|   |   |   |-- category.entity.js
|   |   |   |-- index.js
|   |   |   |-- product.entity.js
|   |   |-- /repositories
|   |   |   |-- base.repository.js
|   |   |   |-- category.repository.js
|   |   |   |-- product.repository.js
|   |-- /services
|   |   |-- prisma.js
|   |-- /prisma
|   |   |-- /migrations
|   |   |-- dev.db
|   |   |-- schema.prisma
|   |-- index.js
|-- .env
|-- .env-template
|-- package-lock.json
|-- package.json
</pre>
</pre>


# .env
O arquivo ".env" pode ser utilizado para outros fins, além do uso através do prisma. Para ilustrar iremos configurar uma variável de ambiente para conter a porta usada em nosso projeto. 

<pre>
DATABASE_URL="file:./dev.db"
PORT=3000
</pre>

# baixar o projeto no github
agora que todas as configurações do projeto foram realizadas, recomendo que baixo o código completo da nossa api no 
[github](https://github.com/logicinfocursos/node_express_prisma_template_api.git).

você pode optar por clonar o projeto ou baixar o arquivo .zip.

se você seguiu o tutorial até agora, se optar por baixar o código pronto, apague todos os arquivos da pasta de trabalho e insira o código obtido no github.

obs: não esqueça de instalar novamente as dependências do projeto:

<pre>
c:\api> npm install
c:\api> npx prisma init --datasource-provider sqlite
</pre>
onde: 
- primeiro você instala todas as dependências do projeto (pasta node_modules)
- você inicializa o prisma

a) após inicializar o prisma, sobreponha o arquivo "schema.prisma" da pasta prisma com o arquivo do mesmo nome que está na pasta assets (já está com o código das classes Product e Category)
b) na pasta assets você também vai encontrar o arquivo "tables_structure.sql" com os comandos create das tabelas do prjeto.
c) como uma boa prática de projeto, no código baixado você não encontrará o arquivo ".env" e sim o arquivo ".env-template", basta renomea-lo para ".env".

para executar o projeto:
<pre>
c:\api> npx prisma migrate dev --name init
c:\api> npm run dev
</pre>

onde:
- você cria a migration (cria as tabelas no sqlite)
- executa o projeto

### dicas importantes
Vale a pena também configurar ou criar o arquivo .gitgnore (caso ainda não exista na raíz do projeto) e mencionar o arquivo ".env" e o diretório "node_modules" para que ambos sejam ignorados caso seja do seu interesse manter o seu projeto em um serviço de controle e armazenamento de código como o github, ou o gitlab (entre outros).
<pre>
node_modules
.env
</pre>

para forçar / atualizar as bases de dados:
<pre>
prisma migrate dev --name <NAME_OF_YOUR_MIGRATION>
prisma migrate dev --create-only --name <NAME_OF_YOUR_MIGRATION>
</pre>

# referências
- (node)[https://nodejs.org/en]
- (express)[https://expressjs.com/en/starter/hello-world.html]
- (typescript)[https://www.typescriptlang.org/docs/]
- (prisma)[https://www.prisma.io/docs/getting-started]
- (nodemon)[https://www.npmjs.com/package/nodemon]
- (vscode)[https://code.visualstudio.com/download]
- (postman)[https://www.postman.com/downloads/]
- (insomnia)[https://insomnia.rest/download]
- (dotenv)[https://www.npmjs.com/package/dotenv]
- (yup)[https://www.npmjs.com/package/yup]
- (conventional commits)[https://www.conventionalcommits.org/en/v1.0.0/]

### plugins vscode
- (prisma)[https://marketplace.visualstudio.com/items?itemName=Prisma.prisma]
- (prisma - insider)[https://marketplace.visualstudio.com/items?itemName=Prisma.prisma-insider]
- (live server)[https://marketplace.visualstudio.com/items?itemName=ritwickdey.LiveServer]
- (prettier - code formatter)[https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode]
- (eslint)[https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint]
- (thunder client)[https://marketplace.visualstudio.com/items?itemName=rangav.vscode-thunder-client]
- (mysql)[https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-mysql-client2]
# sobre a logicinfo

Somos uma consultoria em T.I. e atuamos com desenvolvimento de aplicações para todos os segumentos e mantemos também uma estrutura de treinamento com as melhores soluções para o aprendizado em programação.

Alguns de nossos serviços:

- desenvolvimento de aplicações mobile, web e desktop
- I.A. Generativa - tenha um I.A. focada em seu negócio, atendendo os seus clientes e fornecedores por whatsapp, chat e U.R.A.

Visite o nosso site:
[logicinfo.com.br](https://logicinfo.com.br)

Fale consoco:
whatsapp: [11 9 8627 4173](11-9-8627-4173)
e-mail: [contato@logicinfo.com.br](contato@logicinfo.com.br)