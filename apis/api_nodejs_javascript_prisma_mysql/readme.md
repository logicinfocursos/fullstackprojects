# api com node js, express e prisma
[node_express_prisma_template_api](https://github.com/logicinfocursos/node_express_prisma_template_api.git)
[github](https://github.com/logicinfocursos?tab=repositories)

Esse projeto visa ajudá-lo passo-a-passo a criar uma api robusta usando as melhores práticas do mercado. O objetivo é empregar recursos importantes de orientação a objetos como abstract class e herança para minimizar a repetição de código.

Usaremos o padrão de projetos mvc e implementaremos as operações CRUD (create, read, update e delete).

Espero que esse código possa ser usado para você como uma espécie de template ou skeleton "coringa" como um ponto de partida para os seus próximos projetos.

### resultado
ao concluir esse projeto, você terá uma api funcional para usar sempre que precisar, veja alguns exemplos de resultados:
<img src="https://logicinfo.com.br/assets/images/postedingithub/postman_products.jpg">
<small>tela do postman com o resultado de uma consulta à tabela produtos</small>

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

# estrutura das tabelas
<pre>
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(65,30) DEFAULT NULL,
  `inCart` tinyint(1) DEFAULT NULL,
  `isFavorite` tinyint(1) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_at` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_fkey` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
</pre>

# inserindo registros para testes
<pre>
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'som', '2024-06-16 20:29:36.000', '2024-06-17 08:54:06.000'),
	(2, 'vídeo', '2024-06-16 20:29:36.000', '2024-06-17 08:54:08.000'),
	(3, 'eletrodoméstico', '2024-06-16 20:29:36.000', '2024-06-17 08:54:09.000'),
	(4, 'informática', '2024-06-16 20:29:36.000', '2024-06-17 08:54:10.000'),
	(5, 'poráteis', '2024-06-16 20:29:36.000', '2024-06-17 08:54:11.000'),
	(6, 'celulares', '2024-06-16 20:29:36.000', '2024-06-17 08:54:12.000'),
	(7, 'foto', '2024-06-16 20:29:36.000', '2024-06-17 08:54:13.000');

INSERT INTO `products` (`id`, `name`, `details`, `price`, `inCart`, `isFavorite`, `category_id`, `image`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Cuisinart Air Fryer Forno – Fritadeira a ar de aço inoxidável de 6 litros – Combo de forno de fritadeira a ar seguro para máquina de lavar louça com 5 predefinições – Assar, grelhar e fritar ', 'Capacidade de tamanho familiar: a capacidade interna de 6 litros da fritadeira a ar oferece amplo espaço para cozinhar lotes maiores de alimentos, tornando-a adequada para famílias ou reuniõe', 645.000000000000000000000000000000, 1, 0, 3, 'https://m.media-amazon.com/images/I/71WOxmndFvL._AC_SY450_.jpg', 1, '2024-06-16 20:33:02.000', '2024-06-16 18:03:38.000'),
	(2, 'Audio-Technica AT-LP120XUSB-BK Direct Drive USB toca-discos', 'Toca-discos AT-LP120XUSB-BK, Cápsula fonográfica AT-VM95E; cabeçote AT-HS6; cabo de USB 1,9 m; cabo RCA duplo (macho) para RCA duplo (macho) com fio terra; contrapeso; feltro; tampa contra po', 3090.000000000000000000000000000000, 0, 0, 1, 'https://m.media-amazon.com/images/I/618zOKcrZ5L._AC_SX425_.jpg', 1, '2024-06-16 20:39:35.000', '2024-06-16 18:03:42.000'),
	(3, 'Caixa de Som Bluetooth Edifier R1280DB', 'Caixa de Som Bluetooth Edifier R1280DB 42W, Monitor de áudio, Bivolt, Madeira', 999.000000000000000000000000000000, 0, 0, 1, 'https://m.media-amazon.com/images/I/81+37Bd-8wL._AC_SX679_.jpg', 1, '2024-06-16 20:40:56.000', '2024-06-16 18:03:44.000'),
	(4, 'Onkyo RECEIVER TX8220, Preto, TX-8220', 'Equipado com a mais recente tecnologia Bluetooth, este receiver oferece a liberdade de escolher o volume de sua música, filmes e jogos. Ouça silenciosamente através de seus fones de ouvido Bl', 2165.000000000000000000000000000000, 1, 0, 1, 'https://m.media-amazon.com/images/I/71bTpE0V7fL._AC_SX679_.jpg', 1, '2024-06-16 20:37:37.000', '2024-06-16 18:03:40.000'),
	(5, 'Fast Smart TV Philco 58” PTV58GAGSKSBL Dolby Audio 4K LED', 'Alta performance de processamento: Com uma CPU Quad Core e uma GPU Triple Core a Fast Smart TV AndroidTV responde muito mais rápido aos comandos e oferece muito mais qualidade de imagem e cor', 2399.000000000000000000000000000000, 0, 1, 2, 'https://m.media-amazon.com/images/I/61CrTZDUPPL._AC_SX425_.jpg', 1, '2024-06-16 20:42:49.000', '2024-06-16 18:03:45.000'),
	(6, 'Smart TV 50" 4K LG NanoCell 50NANO77SRA Bluetooth ThinQ AI Alexa Google assistente Airplay 3 HDMI, Light Black', 'Smart - LG ThinQ AI - Google Assistente & Amazon Alexa', 2319.000000000000000000000000000000, 0, 1, 2, 'https://m.media-amazon.com/images/I/61vgiU5DFpL._AC_SX425_.jpg', 1, '2024-06-16 20:43:56.000', '2024-06-16 18:03:47.000'),
	(7, 'Smart TV DLED 43 Full HD Multi Android 11 3 HDMI 2 USB - TL066M', 'Smart TV DLED 43 Full HD Multi Android 11 3 HDMI 2 USB - TL066M', 1599.000000000000000000000000000000, 1, 1, 2, 'https://m.media-amazon.com/images/I/610DuMy9GmL._AC_SX425_.jpg', 1, '2024-06-16 20:45:20.000', '2024-06-16 18:03:48.000'),
	(8, 'Notebook Gamer Dell G15-i1300-A20P 15.6" FHD 13ª Geração Intel Core i5 8GB 512GB SSD NVIDIA RTX 3050 Windows 11', '13ª geração Intel Core i5-13450HX (10-core, cache de 20MB, até 4.6GHz), SSD de 512GB PCIe NVMe M.2,\r\n Memória de 8GB DDR5 (1x8GB) 4800MHz, Placa de vídeo NVIDIA GeForce RTX 3050, 6GB GDDR6, F', 5550.000000000000000000000000000000, 0, 1, 4, 'https://m.media-amazon.com/images/I/611QgduzXOL._AC_SX522_.jpg', 1, '2024-06-16 20:48:07.000', '2024-06-16 18:03:50.000'),
	(9, 'Computador Desktop Dell Alienware Aurora R15 i1300-A30P 13ª Geração Intel Core i7k RTX 3070 32GB 512GB SSD Windows 11', '13ª geração Intel Core i7-13700K (16-core, cache de 54MB, até 5.4GHz)\r\nSSD de 512GB PCIe NVMe M.2\r\nMemória de 32GB DDR5 (2x16GB) 4800MHz; Expansível até 64GB (2 slots UDIMM)\r\nNVIDIA GeForce R', 11000.000000000000000000000000000000, 0, 0, 4, 'https://m.media-amazon.com/images/I/718IQw7eeBL._AC_SX425_.jpg', 1, '2024-06-16 20:49:48.000', '2024-06-16 18:03:53.000'),
	(10, 'Dell Inspiron Laptop com tela sensível ao toque para estudantes universitários e negócios, 15,6 polegadas FHD, Intel Core i7-1355U de 13ª geração, RAM 32GB, SSD de 1 TB, webcam, Wi-Fi, HDMI,', '【Atualizado para 32 GB de memória para multitarefas de potência total】 Muita RAM de alta largura de banda para executar seus jogos e aplicativos de edição de fotos e vídeos, bem como vários p', 10665.000000000000000000000000000000, 0, 0, 4, 'https://m.media-amazon.com/images/I/71MJayN4rVL._AC_SX522_.jpg', 1, '2024-06-16 20:51:53.000', '2024-06-16 18:03:55.000'),
	(11, 'QCY H3 ANC Fone de Ouvido Bluetooth, Cancelamento de Ruído Ativo Headphone Bluetooth 5.4 Headset com Microfone, Certificação Hi-Res Audio, Conexão Multipontos, 60 horas reprodução (Preto)', 'CANCELAMENTO DE RUÍDO ATIVO: Esses fones de ouvido Bluetooth cancelam uma quantidade impressionante de ruído ambiente, de até 43 dB. Nada o distrai de sua música.\r\nCONTROLE SUA MÚSICA E SUAS ', 197.000000000000000000000000000000, 1, 0, 5, 'https://m.media-amazon.com/images/I/51MvjUv989L._AC_SX569_.jpg', 1, '2024-06-16 20:54:03.000', '2024-06-16 18:03:56.000'),
	(12, 'QCY HT05 Fone de Ouvido Bluetooth Cancelamento de Ruido, Fone de Ouvido sem Fio, 30 Horas De Reprodução, Preto', '[Cancelamento Ativo de Ruído] Os fones de ouvido QCY HT05 ANC estão equipados com 3 modos de redução de ruído. Use o aplicativo QCY para escolher seu nível preferido de redução de ruído com b', 179.000000000000000000000000000000, 1, 1, 5, 'https://m.media-amazon.com/images/I/61Vj5i8iOLL._AC_SX569_.jpg', 1, '2024-06-16 20:55:56.000', '2024-06-16 18:03:58.000'),
	(13, 'Sony Câmera Mirrorless Alpha A6400: Câmera Digital De Lente Compacta Aps-C Intercambiáveis ​​Com Foco Automático De Olho Em Tempo Real, Vídeo 4K, Tela Flip & 18-135Mm Lens E Mount Câmeras Com', 'Velocidade da próxima geração: experimente o AF de 0. 02 seg mais rápido do mundo com AF em tempo real e rastreamento de objetos', 8999.000000000000000000000000000000, 0, 0, 7, 'https://m.media-amazon.com/images/I/71zs+RZUggL._AC_SX679_.jpg', 1, '2024-06-16 20:57:31.000', '2024-06-16 18:03:59.000'),
	(14, 'CAMERA NIKON D7500 KIT AF-S 18-140 VR', 'Nascido de um desejo de desempenho emblematico e inovacAo em uma camera conectada mais compacta e simplificada, o D7500 oferece a resolucAo da mudanca de jogo, a gama Iso, o processamento de ', 8519.000000000000000000000000000000, 0, 0, 7, 'https://m.media-amazon.com/images/I/71iKNJ6rVIL._AC_SX569_.jpg', 1, '2024-06-16 20:58:49.000', '2024-06-16 18:04:01.000'),
	(15, 'Câmera Digital Canon EOS Rebel T100 EF-S 18-55mm f/3.5-5.6 III', 'Uma DSLR ultracompacta, fácil de utilizar e com excelentes resultados\r\nVeja instantaneamente os resultados na tela LCD de 6,8 cm (2,7"") fácil de utilizar.\r\nDesfrute da focagem automática ráp', 2900.000000000000000000000000000000, 1, 0, 7, 'https://m.media-amazon.com/images/I/712EbkvrsnL._AC_SX569_.jpg', 1, '2024-06-16 21:00:13.000', '2024-06-16 18:04:02.000');
</pre>

# imagens do projeto
<img src="https://logicinfo.com.br/assets/images/postedingithub/postman_categories.jpg">
<small>tela do postman com o resultado de uma consulta à tabela categories</small>

<img src="https://logicinfo.com.br/assets/images/postedingithub/postman_put.jpg">
<small>tela postman put - alterando uma categoria</small>

<img src="https://logicinfo.com.br/assets/images/postedingithub/postman_post.jpg">
<small>tela postman post incluindo um produto</small>

# json da tablea products
<pre>
[
    {
        "id": 1,
        "name": "Cuisinart Air Fryer Forno – Fritadeira a ar de aço inoxidável de 6 litros – Combo de forno de fritadeira a ar seguro para máquina de lavar louça com 5 predefinições – Assar, grelhar e fritar ",
        "details": "Capacidade de tamanho familiar: a capacidade interna de 6 litros da fritadeira a ar oferece amplo espaço para cozinhar lotes maiores de alimentos, tornando-a adequada para famílias ou reuniõe",
        "price": "645",
        "inCart": true,
        "isFavorite": false,
        "category_id": 3,
        "image": "https://m.media-amazon.com/images/I/71WOxmndFvL._AC_SY450_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:33:02.000Z",
        "updated_at": "2024-06-16T18:03:38.000Z"
    },
    {
        "id": 2,
        "name": "Audio-Technica AT-LP120XUSB-BK Direct Drive USB toca-discos",
        "details": "Toca-discos AT-LP120XUSB-BK, Cápsula fonográfica AT-VM95E; cabeçote AT-HS6; cabo de USB 1,9 m; cabo RCA duplo (macho) para RCA duplo (macho) com fio terra; contrapeso; feltro; tampa contra po",
        "price": "3090",
        "inCart": false,
        "isFavorite": false,
        "category_id": 1,
        "image": "https://m.media-amazon.com/images/I/618zOKcrZ5L._AC_SX425_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:39:35.000Z",
        "updated_at": "2024-06-16T18:03:42.000Z"
    },
    {
        "id": 3,
        "name": "Caixa de Som Bluetooth Edifier R1280DB",
        "details": "Caixa de Som Bluetooth Edifier R1280DB 42W, Monitor de áudio, Bivolt, Madeira",
        "price": "999",
        "inCart": false,
        "isFavorite": false,
        "category_id": 1,
        "image": "https://m.media-amazon.com/images/I/81+37Bd-8wL._AC_SX679_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:40:56.000Z",
        "updated_at": "2024-06-16T18:03:44.000Z"
    },
    {
        "id": 4,
        "name": "Onkyo RECEIVER TX8220, Preto, TX-8220",
        "details": "Equipado com a mais recente tecnologia Bluetooth, este receiver oferece a liberdade de escolher o volume de sua música, filmes e jogos. Ouça silenciosamente através de seus fones de ouvido Bl",
        "price": "2165",
        "inCart": true,
        "isFavorite": false,
        "category_id": 1,
        "image": "https://m.media-amazon.com/images/I/71bTpE0V7fL._AC_SX679_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:37:37.000Z",
        "updated_at": "2024-06-16T18:03:40.000Z"
    },
    {
        "id": 5,
        "name": "Fast Smart TV Philco 58” PTV58GAGSKSBL Dolby Audio 4K LED",
        "details": "Alta performance de processamento: Com uma CPU Quad Core e uma GPU Triple Core a Fast Smart TV AndroidTV responde muito mais rápido aos comandos e oferece muito mais qualidade de imagem e cor",
        "price": "2399",
        "inCart": false,
        "isFavorite": true,
        "category_id": 2,
        "image": "https://m.media-amazon.com/images/I/61CrTZDUPPL._AC_SX425_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:42:49.000Z",
        "updated_at": "2024-06-16T18:03:45.000Z"
    },
    {
        "id": 6,
        "name": "Smart TV 50\" 4K LG NanoCell 50NANO77SRA Bluetooth ThinQ AI Alexa Google assistente Airplay 3 HDMI, Light Black",
        "details": "Smart - LG ThinQ AI - Google Assistente & Amazon Alexa",
        "price": "2319",
        "inCart": false,
        "isFavorite": true,
        "category_id": 2,
        "image": "https://m.media-amazon.com/images/I/61vgiU5DFpL._AC_SX425_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:43:56.000Z",
        "updated_at": "2024-06-16T18:03:47.000Z"
    },
    {
        "id": 7,
        "name": "Smart TV DLED 43 Full HD Multi Android 11 3 HDMI 2 USB - TL066M",
        "details": "Smart TV DLED 43 Full HD Multi Android 11 3 HDMI 2 USB - TL066M",
        "price": "1599",
        "inCart": true,
        "isFavorite": true,
        "category_id": 2,
        "image": "https://m.media-amazon.com/images/I/610DuMy9GmL._AC_SX425_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:45:20.000Z",
        "updated_at": "2024-06-16T18:03:48.000Z"
    },
    {
        "id": 8,
        "name": "Notebook Gamer Dell G15-i1300-A20P 15.6\" FHD 13ª Geração Intel Core i5 8GB 512GB SSD NVIDIA RTX 3050 Windows 11",
        "details": "13ª geração Intel Core i5-13450HX (10-core, cache de 20MB, até 4.6GHz), SSD de 512GB PCIe NVMe M.2,\r\n Memória de 8GB DDR5 (1x8GB) 4800MHz, Placa de vídeo NVIDIA GeForce RTX 3050, 6GB GDDR6, F",
        "price": "5550",
        "inCart": false,
        "isFavorite": true,
        "category_id": 4,
        "image": "https://m.media-amazon.com/images/I/611QgduzXOL._AC_SX522_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:48:07.000Z",
        "updated_at": "2024-06-16T18:03:50.000Z"
    },
    {
        "id": 9,
        "name": "Computador Desktop Dell Alienware Aurora R15 i1300-A30P 13ª Geração Intel Core i7k RTX 3070 32GB 512GB SSD Windows 11",
        "details": "13ª geração Intel Core i7-13700K (16-core, cache de 54MB, até 5.4GHz)\r\nSSD de 512GB PCIe NVMe M.2\r\nMemória de 32GB DDR5 (2x16GB) 4800MHz; Expansível até 64GB (2 slots UDIMM)\r\nNVIDIA GeForce R",
        "price": "11000",
        "inCart": false,
        "isFavorite": false,
        "category_id": 4,
        "image": "https://m.media-amazon.com/images/I/718IQw7eeBL._AC_SX425_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:49:48.000Z",
        "updated_at": "2024-06-16T18:03:53.000Z"
    },
    {
        "id": 10,
        "name": "Dell Inspiron Laptop com tela sensível ao toque para estudantes universitários e negócios, 15,6 polegadas FHD, Intel Core i7-1355U de 13ª geração, RAM 32GB, SSD de 1 TB, webcam, Wi-Fi, HDMI,",
        "details": "【Atualizado para 32 GB de memória para multitarefas de potência total】 Muita RAM de alta largura de banda para executar seus jogos e aplicativos de edição de fotos e vídeos, bem como vários p",
        "price": "10665",
        "inCart": false,
        "isFavorite": false,
        "category_id": 4,
        "image": "https://m.media-amazon.com/images/I/71MJayN4rVL._AC_SX522_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:51:53.000Z",
        "updated_at": "2024-06-16T18:03:55.000Z"
    },
    {
        "id": 11,
        "name": "QCY H3 ANC Fone de Ouvido Bluetooth, Cancelamento de Ruído Ativo Headphone Bluetooth 5.4 Headset com Microfone, Certificação Hi-Res Audio, Conexão Multipontos, 60 horas reprodução (Preto)",
        "details": "CANCELAMENTO DE RUÍDO ATIVO: Esses fones de ouvido Bluetooth cancelam uma quantidade impressionante de ruído ambiente, de até 43 dB. Nada o distrai de sua música.\r\nCONTROLE SUA MÚSICA E SUAS ",
        "price": "197",
        "inCart": true,
        "isFavorite": false,
        "category_id": 5,
        "image": "https://m.media-amazon.com/images/I/51MvjUv989L._AC_SX569_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:54:03.000Z",
        "updated_at": "2024-06-16T18:03:56.000Z"
    },
    {
        "id": 12,
        "name": "QCY HT05 Fone de Ouvido Bluetooth Cancelamento de Ruido, Fone de Ouvido sem Fio, 30 Horas De Reprodução, Preto",
        "details": "[Cancelamento Ativo de Ruído] Os fones de ouvido QCY HT05 ANC estão equipados com 3 modos de redução de ruído. Use o aplicativo QCY para escolher seu nível preferido de redução de ruído com b",
        "price": "179",
        "inCart": true,
        "isFavorite": true,
        "category_id": 5,
        "image": "https://m.media-amazon.com/images/I/61Vj5i8iOLL._AC_SX569_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:55:56.000Z",
        "updated_at": "2024-06-16T18:03:58.000Z"
    },
    {
        "id": 13,
        "name": "Sony Câmera Mirrorless Alpha A6400: Câmera Digital De Lente Compacta Aps-C Intercambiáveis ​​Com Foco Automático De Olho Em Tempo Real, Vídeo 4K, Tela Flip & 18-135Mm Lens E Mount Câmeras Com",
        "details": "Velocidade da próxima geração: experimente o AF de 0. 02 seg mais rápido do mundo com AF em tempo real e rastreamento de objetos",
        "price": "8999",
        "inCart": false,
        "isFavorite": false,
        "category_id": 7,
        "image": "https://m.media-amazon.com/images/I/71zs+RZUggL._AC_SX679_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:57:31.000Z",
        "updated_at": "2024-06-16T18:03:59.000Z"
    },
    {
        "id": 14,
        "name": "CAMERA NIKON D7500 KIT AF-S 18-140 VR",
        "details": "Nascido de um desejo de desempenho emblematico e inovacAo em uma camera conectada mais compacta e simplificada, o D7500 oferece a resolucAo da mudanca de jogo, a gama Iso, o processamento de ",
        "price": "8519",
        "inCart": false,
        "isFavorite": false,
        "category_id": 7,
        "image": "https://m.media-amazon.com/images/I/71iKNJ6rVIL._AC_SX569_.jpg",
        "status": 1,
        "created_at": "2024-06-16T20:58:49.000Z",
        "updated_at": "2024-06-16T18:04:01.000Z"
    },
    {
        "id": 15,
        "name": "Câmera Digital Canon EOS Rebel T100 EF-S 18-55mm f/3.5-5.6 III",
        "details": "Uma DSLR ultracompacta, fácil de utilizar e com excelentes resultados\r\nVeja instantaneamente os resultados na tela LCD de 6,8 cm (2,7\"\") fácil de utilizar.\r\nDesfrute da focagem automática ráp",
        "price": "2900",
        "inCart": true,
        "isFavorite": false,
        "category_id": 7,
        "image": "https://m.media-amazon.com/images/I/712EbkvrsnL._AC_SX569_.jpg",
        "status": 1,
        "created_at": "2024-06-16T21:00:13.000Z",
        "updated_at": "2024-06-16T18:04:02.000Z"
    },
    {
        "id": 16,
        "name": "Apple iPhone 14 (128 GB) – Meia-Noite",
        "details": "Tela Super Retina XDR de 6,1 polegadas \n Sistema de câmera avançado para fotos melhores em qualquer luz \n Modo Cinema, agora em 4K Dolby Vision até 30 qps \n Modo Ação para vídeos em movimento",
        "price": "3899",
        "inCart": false,
        "isFavorite": false,
        "category_id": 1,
        "image": "https://m.media-amazon.com/images/I/515qY5tEaPL._AC_SX679_.jpg",
        "status": 1,
        "created_at": "2024-06-17T12:42:36.348Z",
        "updated_at": "2024-06-17T12:42:36.348Z"
    }
]
</pre>

# json da tablea categories
<pre>
[
    {
        "id": 1,
        "name": "som",
        "created_at": "2024-06-16T20:29:36.000Z",
        "updated_at": "2024-06-17T08:54:06.000Z"
    },
    {
        "id": 2,
        "name": "tv & vídeo",
        "created_at": "2024-06-16T20:29:36.000Z",
        "updated_at": "2024-06-17T12:37:15.364Z"
    },
    {
        "id": 3,
        "name": "eletrodoméstico",
        "created_at": "2024-06-16T20:29:36.000Z",
        "updated_at": "2024-06-17T08:54:09.000Z"
    },
    {
        "id": 4,
        "name": "informática",
        "created_at": "2024-06-16T20:29:36.000Z",
        "updated_at": "2024-06-17T08:54:10.000Z"
    },
    {
        "id": 5,
        "name": "poráteis",
        "created_at": "2024-06-16T20:29:36.000Z",
        "updated_at": "2024-06-17T08:54:11.000Z"
    },
    {
        "id": 6,
        "name": "celulares",
        "created_at": "2024-06-16T20:29:36.000Z",
        "updated_at": "2024-06-17T08:54:12.000Z"
    },
    {
        "id": 7,
        "name": "foto",
        "created_at": "2024-06-16T20:29:36.000Z",
        "updated_at": "2024-06-17T08:54:13.000Z"
    }
]
</pre>
# referências
- (node)[https://nodejs.org/en]
- (express)[https://expressjs.com/en/starter/hello-world.html]
- (mysql - documentation)[https://dev.mysql.com/doc/refman/8.4/en/]
- (mysql server - download)[https://dev.mysql.com/downloads/windows/installer/8.0.html]
- (mysql workbench - download)[https://dev.mysql.com/downloads/workbench/]
- (beekeeper studio - download)[https://www.beekeeperstudio.io/get-community]
- (heidiSQL - download)[https://www.heidisql.com/download.php]
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