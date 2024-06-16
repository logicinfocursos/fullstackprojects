
-- Copiando estrutura do banco de dados para dev
CREATE DATABASE IF NOT EXISTS "dev";

-- Copiando estrutura para tabela dev.categories
CREATE TABLE IF NOT EXISTS "categories" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME
);

-- Copiando dados para a tabela dev.categories: 6 rows
INSERT INTO "categories" ("id", "name", "created_at", "updated_at") VALUES
	(1, 'som', '2024-06-16 20:29:36', '2024-06-16 17:30:15'),
	(2, 'vídeo', '2024-06-16 20:30:35', '2024-06-16 17:31:48'),
	(3, 'eletrodoméstico', '2024-06-16 20:30:48', '2024-06-16 17:31:49'),
	(4, 'informática', '2024-06-16 20:30:55', '2024-06-16 17:31:50'),
	(5, 'portáteis', '2024-06-16 20:31:20', '2024-06-16 17:31:52'),
	(6, 'celulares', '2024-06-16 20:31:27', '2024-06-16 17:31:53');

-- Copiando estrutura para tabela dev.products
CREATE TABLE IF NOT EXISTS "products" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT,
    "details" TEXT,
    "price" DECIMAL,
    "inCart" BOOLEAN,
    "isFavorite" BOOLEAN,
    "category_id" INTEGER,
    "status" INTEGER,
    "created_at" DATETIME DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME, "image" TEXT,
    CONSTRAINT "products_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- Copiando dados para a tabela dev.products: 15 rows
INSERT INTO "products" ("id", "name", "details", "price", "inCart", "isFavorite", "category_id", "status", "created_at", "updated_at", "image") VALUES
	(1, 'Cuisinart Air Fryer Forno – Fritadeira a ar de aço inoxidável de 6 litros – Combo de forno de fritadeira a ar seguro para máquina de lavar louça com 5 predefinições – Assar, grelhar e fritar ao ar', 'Capacidade de tamanho familiar: a capacidade interna de 6 litros da fritadeira a ar oferece amplo espaço para cozinhar lotes maiores de alimentos, tornando-a adequada para famílias ou reuniões
MÚLTIPLAS FUNÇÕES DE COZINHA: Com 5 funções de cozimento, incluindo fritar ao ar, assar, grelhar e manter aquecido, esta fritadeira oferece versatilidade e permite que você prepare uma ampla variedade de pratos
5 pré-ajustes fáceis: o visor digital com 5 predefinições Air Fry simplifica o processo de cozimento, oferecendo opções fáceis de usar para alcançar resultados ideais com apenas alguns botões pressionados
Ampla faixa de temperatura: com 1800 watts de potência e controle de temperatura ajustável com uma temperatura máxima de 232 °C, oferece controle preciso sobre o processo de cozimento, permitindo que você atinja o nível desejado de crocância e escurecimento
Aquecedor automático: o temporizador de até 60 minutos com função automática de manter quente garante que sua comida permaneça quente até que você esteja pronto para servir, oferecendo conveniência e flexibilidade
Fácil de limpar: a cesta antiaderente e fácil de limpar na lava-louças simplifica a limpeza, facilitando a manutenção da limpeza do aparelho', 645, 1, 0, 3, 1, '2024-06-16 20:33:02', '2024-06-16 18:03:38', 'https://m.media-amazon.com/images/I/71WOxmndFvL._AC_SY450_.jpg'),
	(2, 'Onkyo RECEIVER TX8220, Preto, TX-8220', 'Equipado com a mais recente tecnologia Bluetooth, este receiver oferece a liberdade de escolher o volume de sua música, filmes e jogos. Ouça silenciosamente através de seus fones de ouvido Bluetooth sem sacrificar a qualidade do som ou acordar seus filhos. Ou, enquanto o resto da família aproveita os alto-falantes em volume moderado, acomode uma pessoa que possa precisar de ajuda para ouvir via fones de ouvido Bluetooth.', 2165, 1, 0, 1, 1, '2024-06-16 20:37:37', '2024-06-16 18:03:40', 'https://m.media-amazon.com/images/I/71bTpE0V7fL._AC_SX679_.jpg'),
	(3, 'Audio-Technica AT-LP120XUSB-BK Direct Drive USB toca-discos', 'Toca-discos AT-LP120XUSB-BK, Cápsula fonográfica AT-VM95E; cabeçote AT-HS6; cabo de USB 1,9 m; cabo RCA duplo (macho) para RCA duplo (macho) com fio terra; contrapeso; feltro; tampa contra poeira; adaptador de 45 RPM; luz da agulha tipo plugue', 3090, 0, 0, 1, 1, '2024-06-16 20:39:35', '2024-06-16 18:03:42', 'https://m.media-amazon.com/images/I/618zOKcrZ5L._AC_SX425_.jpg'),
	(4, 'Caixa de Som Bluetooth Edifier R1280DB', 'Caixa de Som Bluetooth Edifier R1280DB 42W, Monitor de áudio, Bivolt, Madeira', 999, 0, 0, 1, 1, '2024-06-16 20:40:56', '2024-06-16 18:03:44', 'https://m.media-amazon.com/images/I/81+37Bd-8wL._AC_SX679_.jpg'),
	(5, 'Fast Smart TV Philco 58” PTV58GAGSKSBL Dolby Audio 4K LED', 'Alta performance de processamento: Com uma CPU Quad Core e uma GPU Triple Core a Fast Smart TV AndroidTV responde muito mais rápido aos comandos e oferece muito mais qualidade de imagem e cores', 2399, 0, 1, 2, 1, '2024-06-16 20:42:49', '2024-06-16 18:03:45', 'https://m.media-amazon.com/images/I/61CrTZDUPPL._AC_SX425_.jpg'),
	(6, 'Smart TV 50" 4K LG NanoCell 50NANO77SRA Bluetooth ThinQ AI Alexa Google assistente Airplay 3 HDMI, Light Black', 'Smart - LG ThinQ AI - Google Assistente & Amazon Alexa', 2319, 0, 1, 2, 1, '2024-06-16 20:43:56', '2024-06-16 18:03:47', 'https://m.media-amazon.com/images/I/61vgiU5DFpL._AC_SX425_.jpg'),
	(7, 'Smart TV DLED 43 Full HD Multi Android 11 3 HDMI 2 USB - TL066M', 'Smart TV DLED 43 Full HD Multi Android 11 3 HDMI 2 USB - TL066M', 1599, 1, 1, 2, 1, '2024-06-16 20:45:20', '2024-06-16 18:03:48', 'https://m.media-amazon.com/images/I/610DuMy9GmL._AC_SX425_.jpg'),
	(8, 'Notebook Gamer Dell G15-i1300-A20P 15.6" FHD 13ª Geração Intel Core i5 8GB 512GB SSD NVIDIA RTX 3050 Windows 11', '13ª geração Intel Core i5-13450HX (10-core, cache de 20MB, até 4.6GHz), SSD de 512GB PCIe NVMe M.2,
 Memória de 8GB DDR5 (1x8GB) 4800MHz, Placa de vídeo NVIDIA GeForce RTX 3050, 6GB GDDR6, Full HD de 15.6" (1920 x 1080), 120Hz, 250 nits', 5550, 0, 1, 4, 1, '2024-06-16 20:48:07', '2024-06-16 18:03:50', 'https://m.media-amazon.com/images/I/611QgduzXOL._AC_SX522_.jpg'),
	(9, 'Computador Desktop Dell Alienware Aurora R15 i1300-A30P 13ª Geração Intel Core i7k RTX 3070 32GB 512GB SSD Windows 11', '13ª geração Intel Core i7-13700K (16-core, cache de 54MB, até 5.4GHz)
SSD de 512GB PCIe NVMe M.2
Memória de 32GB DDR5 (2x16GB) 4800MHz; Expansível até 64GB (2 slots UDIMM)
NVIDIA GeForce RTX 3070, 8GB GDDR6
Audio Realtek 7.1 canais', 11000, 0, 0, 4, 1, '2024-06-16 20:49:48', '2024-06-16 18:03:53', 'https://m.media-amazon.com/images/I/718IQw7eeBL._AC_SX425_.jpg'),
	(10, 'Dell Inspiron Laptop com tela sensível ao toque para estudantes universitários e negócios, 15,6 polegadas FHD, Intel Core i7-1355U de 13ª geração, RAM 32GB, SSD de 1 TB, webcam, Wi-Fi, HDMI,', '【Atualizado para 32 GB de memória para multitarefas de potência total】 Muita RAM de alta largura de banda para executar seus jogos e aplicativos de edição de fotos e vídeos, bem como vários programas e abas do navegador ao mesmo tempo.
【Atualizado para SSD de 1 TB 】Oferece enorme espaço de armazenamento para arquivos enormes, para que você possa armazenar dados digitais importantes e trabalhar com facilidade. Dá a você um enorme espaço para salvar todos os seus arquivos.
【Intel Core i7-1355U】10 núcleos, 12 linhas, relógio base de 3,7 GHz, máx. Boost Clock até 5,0 GHz. Gráficos Intel Iris Xe.
【Tela sensível ao toque FHD de 15,6 polegadas com webcam e microfone】WLED de micro-borda FHD SVA BrightView de 15,6 polegadas na diagonal. Webcam com microfone.
【Conectividade】1 x USB 2.0, 1 x USB Tipo A, 1 x USB Tipo-C, 1 x HDMI, 1 x fone de ouvido/alto-falante/conector de linha, 1 x leitor de cartão SD | Wi-Fi, Bluetooth 【Windows 11 Home】', 10665, 0, 0, 4, 1, '2024-06-16 20:51:53', '2024-06-16 18:03:55', 'https://m.media-amazon.com/images/I/71MJayN4rVL._AC_SX522_.jpg'),
	(11, 'QCY H3 ANC Fone de Ouvido Bluetooth, Cancelamento de Ruído Ativo Headphone Bluetooth 5.4 Headset com Microfone, Certificação Hi-Res Audio, Conexão Multipontos, 60 horas reprodução (Preto)', 'CANCELAMENTO DE RUÍDO ATIVO: Esses fones de ouvido Bluetooth cancelam uma quantidade impressionante de ruído ambiente, de até 43 dB. Nada o distrai de sua música.
CONTROLE SUA MÚSICA E SUAS CHAMADAS: Os botões físicos permitem que você controle o volume, mude de faixa, reproduza/pause e até mesmo ative o assistente de voz. Chamada telefônica recebida? Pegue-o com o toque de um botão.
BLUETOOTH + CABO: Esses fones de ouvido podem ser usados sem fio com recursos Bluetooth 5.4, além de uma entrada confiável de cabo de 3,5 mm, você merece.
BATERIA DE LONGA DURAÇÃO: 60 horas de reprodução contínua de música com cancelamento de ruído ativo desativado, 35 horas com ANC ativado. O cancelamento de ruído ativo (ANC) nunca teve um preço tão acessível.
CONFORTO SEM PRESSÃO: Os fone Bluetooth QCY H3 têm fones de ouvido de couro de proteína ultramacios com enchimento de espuma viscoelástica para se ajustar perfeitamente às suas orelhas. A construção leve também garante que eles sejam confortáveis para longas sessões de audição.', 197, 1, 0, 5, 1, '2024-06-16 20:54:03', '2024-06-16 18:03:56', 'https://m.media-amazon.com/images/I/51MvjUv989L._AC_SX569_.jpg'),
	(12, 'QCY HT05 Fone de Ouvido Bluetooth Cancelamento de Ruido, Fone de Ouvido sem Fio, 30 Horas De Reprodução, Preto', '[Cancelamento Ativo de Ruído] Os fones de ouvido QCY HT05 ANC estão equipados com 3 modos de redução de ruído. Use o aplicativo QCY para escolher seu nível preferido de redução de ruído com base no ambiente. Em qualquer ambiente barulhento, basta ativar o modo de redução de ruído e você poderá mergulhar silenciosamente em seu próprio mundo musical.
[Chamadas Claras] Com 6 microfones (3 para cada fone de ouvido), o HT05 Melobuds ANC pode remover o ruído ambiente e transmitir uma voz clara para a outra parte. Além disso, através do design anti-vazamento exclusivo, a qualidade clara da chamada pode ser mantida mesmo com velocidades de vento equivalentes a 45 km/s. Ideal para exposições ou conferências online.
[30 Horas de Reprodução] Com o design de economia de energia, você pode jogar por mais de 8 horas continuamente apenas com os fones de ouvido e, junto com a caixa de armazenamento, pode jogar por até 30 horas. Além disso, este fone de ouvido sem fio suporta carregamento rápido e pode jogar por até 60 minutos com uma carga de 5 minutos.
[Som Excelente] Equipado com um driver grande de 10 mm, esses fone Bluetooth garantem uma ampla gama e som equilibrado. Graves potentes permitem que você aproveite totalmente sua música. Usando o aplicativo dedicado QCY, você pode personalizar o EQ de acordo com sua preferência. Crie seus próprios fones de ouvido originais.
[Ajuste Confortável] Vem com tampões de ouvido de silicone macio ergonomicamente projetados e 3 tamanhos (S/M/L). Você pode fazer um ajuste preciso de acordo com o tamanho da sua orelha. Com o excelente desempenho à prova d''água IPX5, você pode curtir música com tranquilidade, mesmo que chova repentinamente durante o exercício.', 179, 1, 1, 5, 1, '2024-06-16 20:55:56', '2024-06-16 18:03:58', 'https://m.media-amazon.com/images/I/61Vj5i8iOLL._AC_SX569_.jpg'),
	(13, 'Sony Câmera Mirrorless Alpha A6400: Câmera Digital De Lente Compacta Aps-C Intercambiáveis ​​Com Foco Automático De Olho Em Tempo Real, Vídeo 4K, Tela Flip & 18-135Mm Lens E Mount Câmeras Compatíveis', 'Velocidade da próxima geração: experimente o AF de 0. 02 seg mais rápido do mundo com AF em tempo real e rastreamento de objetos', 8999, 0, 0, 5, 1, '2024-06-16 20:57:31', '2024-06-16 18:03:59', 'https://m.media-amazon.com/images/I/71zs+RZUggL._AC_SX679_.jpg'),
	(14, 'CAMERA NIKON D7500 KIT AF-S 18-140 VR', 'Nascido de um desejo de desempenho emblematico e inovacAo em uma camera conectada mais compacta e simplificada, o D7500 oferece a resolucAo da mudanca de jogo, a gama Iso, o processamento de imagem e a eficiencia energetica da premiada D500 em uma Dslr de nivel entusiasta. Simplificando, a D7500 desenvolvida para superar qualquer camera em sua classe com qualidade de imagem de nivel superior, velocidade de ardencia, autofoco sem falhas, video 4K Ultra Hd e ferramentas criativas de nivel profissional, tudo em um design confortavel e robusto. Esta e uma camera para a nova geracAo de criadores.', 8519, 0, 0, 5, 1, '2024-06-16 20:58:49', '2024-06-16 18:04:01', 'https://m.media-amazon.com/images/I/71iKNJ6rVIL._AC_SX569_.jpg'),
	(15, 'Câmera Digital Canon EOS Rebel T100 EF-S 18-55mm f/3.5-5.6 III', 'Uma DSLR ultracompacta, fácil de utilizar e com excelentes resultados
Veja instantaneamente os resultados na tela LCD de 6,8 cm (2,7"") fácil de utilizar.
Desfrute da focagem automática rápida e dos disparos de resolução total a 3 fps: basta apontar e disparar para conseguir resultados impressionantes com o modo de automático.
Tire selfies divertidas e imagens únicas utilizando a função de disparo remoto com o aplicativo Câmera Connect mais a função Wi-Fi integrada¹ da câmera.
Fotografe e compartilhe as suas histórias utilizando a função Wi-Fi integrada¹ com o aplicativo Câmera Connect.', 2900, 1, 0, 5, 1, '2024-06-16 21:00:13', '2024-06-16 18:04:02', 'https://m.media-amazon.com/images/I/712EbkvrsnL._AC_SX569_.jpg');
