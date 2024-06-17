
CREATE DATABASE IF NOT EXISTS `shop`;
USE `shop`;

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'som', '2024-06-16 20:29:36.000', '2024-06-17 08:54:06.000'),
	(2, 'vídeo', '2024-06-16 20:29:36.000', '2024-06-17 08:54:08.000'),
	(3, 'eletrodoméstico', '2024-06-16 20:29:36.000', '2024-06-17 08:54:09.000'),
	(4, 'informática', '2024-06-16 20:29:36.000', '2024-06-17 08:54:10.000'),
	(5, 'poráteis', '2024-06-16 20:29:36.000', '2024-06-17 08:54:11.000'),
	(6, 'celulares', '2024-06-16 20:29:36.000', '2024-06-17 08:54:12.000'),
	(7, 'foto', '2024-06-16 20:29:36.000', '2024-06-17 08:54:13.000');


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
