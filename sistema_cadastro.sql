-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 21/06/2024 às 21:41
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_cadastro`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagens`
--

CREATE TABLE `imagens` (
  `id` int(11) NOT NULL,
  `individuo_id` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `imagens`
--

INSERT INTO `imagens` (`id`, `individuo_id`, `imagem`) VALUES
(36, 36, 'novas_imagens-1717285700137.png'),
(37, 37, 'imagens-1717285825447.png'),
(38, 38, 'imagens-1717285950471.png'),
(39, 39, 'imagens-1717288220018.png'),
(40, 40, 'imagens-1717341609584.png'),
(42, 40, 'novas_imagens-1717341628562.png'),
(43, 41, 'imagens-1717642281314.png');

-- --------------------------------------------------------

--
-- Estrutura para tabela `individuos`
--

CREATE TABLE `individuos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `alcunha` varchar(50) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `genitora` varchar(100) DEFAULT NULL,
  `pai` varchar(100) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `logradouro` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `placa_veiculo` varchar(10) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `faccao` varchar(255) DEFAULT NULL,
  `funcao` varchar(255) DEFAULT NULL,
  `observacao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `individuos`
--

INSERT INTO `individuos` (`id`, `nome`, `alcunha`, `data_nascimento`, `cpf`, `rg`, `genitora`, `pai`, `telefone`, `cep`, `estado`, `cidade`, `logradouro`, `bairro`, `latitude`, `longitude`, `placa_veiculo`, `imagem`, `data_cadastro`, `faccao`, `funcao`, `observacao`) VALUES
(36, 'PPEDRO HENRIQUE BENCHIMOL FERREIRA DE ANDRADE', 'PEDRO BOCÃO', NULL, '033.544.791', '5071036 SSP-GO', 'WILCIONE ABRENHOSA DE ANDRADE', NULL, '62984666666', NULL, 'Go', 'Goiania', 'RUA 217 Nº 134', 'VILA NOVA', NULL, NULL, NULL, 'novas_imagens-1717285700137.png', '2024-06-01 23:47:20', 'Sem facção', 'Sem função', '<h1>Eos voluptas soluta qui libero architecto!</h1>\r\n\r\n<p>Lorem ipsum dolor sit amet. Id dolores Quis ex labore aliquidut cumque et delectus possimus. Sed accusantium quod non facere facilisEt sequi!</p>\r\n\r\n<ul>\r\n	<li>Ex praesentium praesentium vel praesentium quod et vitae laboriosam.</li>\r\n	<li>Eos dolores illo ea voluptas voluptatem sit rerum iusto hic aliquam rerum.</li>\r\n	<li>Sed galisum rerum et libero facilis.</li>\r\n	<li>Et dolores omnis et alias debitis.</li>\r\n	<li>Ea minima praesentium aut sint veniam a Quis molestiae.</li>\r\n</ul>\r\n\r\n<p>Et molestiae laborum ut pariatur totam.</p>\r\n\r\n<p>Qui consequuntur saepe sit culpa nisi ad nobis commodi aut magni illum.</p>\r\n\r\n<p>Aut rerum modi et error esse.</p>\r\n\r\n<p>Sed placeat internos ut autem autem est explicabo labore qui fugit dignissimos.</p>\r\n\r\n<p>Rem perferendis autem qui odio iusto!</p>\r\n\r\n<p>Hic sint consequatur qui modi enim.</p>\r\n\r\n<blockquote>Eum repudiandae asperiores in fugiat vitae hic consectetur sint ut libero laborum et quibusdam obcaecati est reprehenderit repudiandae.</blockquote>\r\n\r\n<pre>\r\n<code>&lt;!-- Quo libero excepturi. --&gt;\r\n&lt;et&gt;Ut libero quae hic dolores numquam eum eligendi sunt.&lt;/et&gt;\r\n&lt;iure&gt;Aut quia deserunt qui alias dolorem et molestiae deleniti.&lt;/iure&gt;\r\n&lt;quo&gt;Id necessitatibus dolorum?&lt;/quo&gt;\r\n&lt;fuga&gt;Cum aliquam sint sed dolorem odit sed corrupti temporibus.&lt;/fuga&gt;\r\n</code></pre>\r\n\r\n<h2>In galisum quidem est adipisci dolor et magnam enim!</h2>\r\n\r\n<p>Qui inventore amet qui illum similiquesit quas vel incidunt aperiam et facere reiciendis. Ut delectus blanditiis in perferendis sequiSit adipisci eum perferendis delectus ea minima facere nam suscipit consequatur. Aut amet odit <em>Quo laudantium et enim dolores quo deleniti quae</em>.</p>\r\n\r\n<ol>\r\n	<li>Et assumenda facilis ut voluptatem adipisci est nostrum animi est quam esse.</li>\r\n	<li>Est galisum voluptatem vel autem veritatis in itaque doloribus.</li>\r\n	<li>Aut illo voluptatibus 33 facere beatae ut autem eius ut voluptatum fugiat?</li>\r\n	<li>Aut unde iure eum nostrum voluptatibus ut placeat nostrum.</li>\r\n</ol>\r\n\r\n<h3>Aut nemo error est corporis nihil.</h3>\r\n\r\n<p>Et quas iustoEt similique qui impedit minus qui consectetur enim. Eos rerum neque id repellendus quasea provident vel expedita ratione. Est officia enimsed fuga et nobis veritatis.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
(37, 'MATHEUS DOS SANTOS SOUSA ', NULL, NULL, '706.572.041', '6599706 SSPGO', 'DEUSIANE DOS SANTOS CELESTINO', NULL, NULL, NULL, 'Go', 'GOIÂNIA ', 'RUA BM1 QD 02 LT 58 ', 'BRISAS DA MATA', NULL, NULL, 'NWR3125 ', 'imagens-1717285825447.png', '2024-06-01 23:50:25', 'Sem facção', 'Sem função', '<h1>Ut fugit blanditiis aut consequatur saepe non quasi asperiores.</h1>\r\n\r\n<p>Lorem ipsum dolor sit amet. Quo asperiores voluptates <em>Sit sequi est reiciendis labore ea dolorem tempore</em> et quisquam odio ea fugiat voluptatum. Non totam doloremque id tenetur iustoSit ipsa ut tempore galisum rem adipisci fuga et enim ducimus cum quaerat similique.</p>\r\n\r\n<h2>Aut laudantium sapiente aut consequatur eligendi in voluptas illum.</h2>\r\n\r\n<p>Et asperiores natus aut omnis nisiCum ipsam At possimus magni ex dolor quisquam in tempore molestiae est inventore sunt. Ea veritatis harum aut architecto eius <strong>Sed quia sed laborum laboriosam sit unde eveniet a vero adipisci</strong>?</p>\r\n\r\n<ol>\r\n	<li>Vel velit impedit quo laudantium error!</li>\r\n	<li>Et esse voluptatem non saepe recusandae.</li>\r\n	<li>Sit internos sint ad eaque voluptatem in asperiores delectus.</li>\r\n	<li>Vel deserunt deserunt ea blanditiis omnis qui neque necessitatibus quo dolorem voluptates.</li>\r\n	<li>Sit exercitationem tempora et dignissimos rerum est omnis nihil sit nostrum sunt.</li>\r\n	<li>Qui provident tempora aut ducimus quia non neque internos.</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>Cum suscipit laborum et consequatur atque qui magni ipsa est vero quidem.</li>\r\n	<li>Quo internos voluptas aut ullam consequatur qui architecto quia.</li>\r\n</ul>\r\n\r\n<p>Id unde modi.</p>\r\n\r\n<p>Et voluptatibus delectus qui dolorum nihil sed quia rerum.</p>\r\n\r\n<p>Ut harum veniam ea exercitationem maxime.</p>\r\n\r\n<p>Id tempora nemo non veniam reiciendis et praesentium dolorem eos beatae sunt.</p>\r\n\r\n<h3>Ab laudantium nisi ut porro laboriosam!</h3>\r\n\r\n<p>Est Quis voluptatum <strong>Qui rerum ut enim rerum aut fugit cumque</strong> vel delectus deserunt. Ex culpa nesciunt rem itaque expeditaet quibusdam et atque quae aut tempore ducimus.</p>\r\n\r\n<blockquote>Qui neque consectetur ab voluptas repellat vel ipsa dolorum in unde deleniti est voluptatibus magni vel autem sint.</blockquote>\r\n'),
(38, 'SAVIO NEVES SILVA', NULL, NULL, NULL, '6223107/SSP-GO', 'PATRÍCIA NEVES CABRAL', NULL, NULL, NULL, NULL, NULL, 'RUA ARAXA, 255', 'FABRINI', NULL, NULL, NULL, 'imagens-1717285950471.png', '2024-06-01 23:52:30', 'Sem facção', 'Sem função', '<h1>Qui voluptas assumenda non accusamus voluptatem ut iusto iure.</h1>\r\n\r\n<p>Lorem ipsum dolor sit amet. Qui odio iustohic cumque sit similique voluptate! Ut nemo quasi <em>Cum totam et sint voluptas</em>.</p>\r\n\r\n<ol>\r\n	<li>Ut aspernatur corrupti id fugit eius vel architecto veritatis.</li>\r\n	<li>Ea commodi quis qui velit doloremque ad inventore voluptatem aut iusto sunt.</li>\r\n</ol>\r\n\r\n<p>Aut neque inventore!</p>\r\n\r\n<p>Non itaque cupiditate vel enim dolorum.</p>\r\n\r\n<p>33 voluptas fugiat.</p>\r\n\r\n<p>Eos aliquid nobis sit tempore similique.</p>\r\n\r\n<h2>Ea voluptate rerum qui omnis corporis qui impedit voluptas.</h2>\r\n\r\n<p>Ut provident esseAut laudantium est reiciendis molestiae et nesciunt temporibus. Et veniam Quis <em>Sit praesentium ab aliquid quas est explicabo deleniti</em> ut facilis voluptates quo consequatur iure rem modi neque? Id dolorem rerum aut aspernatur ducimusEa deserunt aut rerum itaque qui enim veritatis ea culpa delectus! Et saepe voluptatemEx similique id nemo illum.</p>\r\n\r\n<h3>Quo ducimus doloribus sit molestias quae.</h3>\r\n\r\n<p>Ab quam voluptas <em>Cum quam ut molestiae dolorum eos corrupti debitis</em>. Ex corrupti impeditQui quam eos ipsam veniam sed voluptas deleniti id culpa minus cum odio ipsam. Et illum necessitatibus <strong>Et molestiae et labore eius ex dolorem saepe</strong> et nihil rerum At soluta nihil. Eos eveniet voluptas ut quasi facilisAt adipisci sed ullam accusantium aut eveniet quos et quia magni.</p>\r\n\r\n<ul>\r\n	<li>33 omnis consequatur in labore facilis ut rerum repellendus sit labore autem.</li>\r\n	<li>Non placeat laborum qui aliquam internos cum veniam commodi?</li>\r\n	<li>Non alias iure ad accusantium dolorem qui consequatur excepturi.</li>\r\n</ul>\r\n\r\n<blockquote>Ut excepturi quasi ea quia autem et voluptas sequi in enim voluptatibus qui odit alias.</blockquote>\r\n'),
(39, 'EDI INÁCIO DE ARAÚJO JUNIOR', 'EDINHO', NULL, '090.626.261', '7207933/SSP-GO', 'VANUZA RODRIGUES DE JESUS', NULL, NULL, NULL, 'go', 'GOIÂNIA ', NULL, 'VALE DOS SONHOS ', NULL, NULL, NULL, 'imagens-1717288220018.png', '2024-06-02 00:30:20', 'CV', 'Sem função', '<h1>Et voluptatem perspiciatis qui placeat autem aut nulla voluptas.</h1>\r\n\r\n<p>Lorem ipsum dolor sit amet. Et quia aspernatur ut illum quasqui eligendi. Et placeat dolorum qui dolor doloremNon suscipit est alias vitae sit fugit similique sit esse necessitatibus. Eum fuga modi <strong>Quo internos vel reprehenderit eius eos provident adipisci</strong> id consequuntur nisi.</p>\r\n\r\n<blockquote>Ut voluptatem tempora est fuga doloremque aut velit soluta est magni velit.</blockquote>\r\n\r\n<h2>Ab dolores enim sit ipsum molestias id omnis enim.</h2>\r\n\r\n<p>Eos error recusandae aut voluptatem tempore <strong>Rem fugit quo dignissimos consequatur</strong> quo aspernatur enim ut voluptates enim At ducimus recusandae. Et blanditiis adipisci et vitae reiciendisnon voluptatum et culpa voluptatem non nulla reprehenderit.</p>\r\n\r\n<ul>\r\n	<li>Et repellat dolorem et molestiae ipsum ex mollitia nihil et ratione ipsum.</li>\r\n	<li>Ea dolor soluta sit reiciendis repellendus.</li>\r\n	<li>Et mollitia quaerat est fuga harum et culpa repellendus.</li>\r\n	<li>Ut recusandae dolorem a tempora suscipit.</li>\r\n	<li>Et minima explicabo aut aliquid corrupti.</li>\r\n	<li>Et quae vero sed dolores laborum et odit quidem eos illo adipisci.</li>\r\n</ul>\r\n\r\n<div>In veritatis molestias et distinctio sint.</div>\r\n\r\n<div>Sed totam iusto sed labore voluptatem eos possimus iusto rem quasi vero!</div>\r\n\r\n<div>Id nostrum libero.</div>\r\n\r\n<div>Est excepturi rerum non autem quaerat.</div>\r\n\r\n<h3>Cum maxime consequatur sit fugiat consectetur in minus eius?</h3>\r\n\r\n<p>Sed maiores nihil non enim odioAut amet aut numquam libero aut aliquid quas et expedita esse vel omnis neque. Sit nihil autem <strong>Ut laboriosam</strong> et quia dolores. Et magnam possimus et omnis voluptas <em>Ex aspernatur est beatae dolores ex quaerat doloremque rem porro omnis</em> sit consequatur tempora. Id earum internosAt illo rem dolores fugiat sit tempora minima aut vitae ipsum non adipisci rerum?</p>\r\n\r\n<ol>\r\n	<li>Qui voluptas itaque 33 asperiores quaerat ad quia illum ea commodi nihil.</li>\r\n	<li>Ea quis unde non ipsum iure.</li>\r\n	<li>Ut odio aliquid et eius sint qui inventore provident.</li>\r\n</ol>\r\n\r\n<p>teste</p>\r\n'),
(40, 'BRUNA RODRIGUES DA SILVA', NULL, NULL, '750.808.691', '6003748 SSP GO', 'NILZA RODRIGUES DA SILVA', NULL, NULL, NULL, 'GO', 'GOIANIA', 'RUA MDV-13, QD. 23, LT. 05, CASA 02, ', 'MOINHO DOS VENTOS, ', NULL, NULL, NULL, 'novas_imagens-1717341628562.png', '2024-06-02 15:20:09', 'Sem facção', 'Sem função', '<h1>Est quaerat Quis et velit repudiandae.</h1>\r\n\r\n<h3>Lorem ipsum dolor sit amet. Est deleniti dignissimosAt vitae est pariatur adipisci sit quas corporis. Sed laboriosam consectetur qui numquam galisum <em>Et quasi sit sint repellendus in cupiditate earum in beatae nihil</em>. 33 unde placeat <strong>Et fugit eum accusantium iure et soluta enim</strong> sed laudantium quaerat ea nihil temporibus eos reiciendis deserunt.</h3>\r\n\r\n<ol>\r\n	<li>\r\n	<div>Est quia corrupti sed consequatur itaque aut aspernatur necessitatibus vel voluptatem odio.</div>\r\n	</li>\r\n	<li>\r\n	<div>Est iusto aperiam sit accusamus saepe qui ipsam numquam est ratione facilis!</div>\r\n	</li>\r\n	<li>\r\n	<div>Et placeat quam vel autem maxime aut fugiat omnis aut rerum nihil.</div>\r\n	</li>\r\n	<li>\r\n	<div>Qui rerum itaque in perspiciatis vero qui repellat autem.</div>\r\n	</li>\r\n	<li>\r\n	<div>Ut perspiciatis consectetur est exercitationem sint quo architecto odit.</div>\r\n	</li>\r\n</ol>\r\n\r\n<div>Aut dolorem eligendi et similique voluptatem.</div>\r\n\r\n<div>Non atque totam qui quas incidunt eum eveniet quibusdam vel reprehenderit doloribus.</div>\r\n\r\n<div>Eos numquam alias aut voluptatem beatae.</div>\r\n\r\n<div>In iusto dignissimos ad rerum voluptatem aut sapiente quia?</div>\r\n\r\n<div>Sit commodi pariatur aut culpa harum.</div>\r\n\r\n<div>Ea quaerat voluptatibus et nulla eaque.</div>\r\n\r\n<div>Et perspiciatis dolor sed omnis dolorum eos ratione reiciendis.</div>\r\n\r\n<div>Vel cumque molestiae ut dolorem ipsa <em>Sed repellendus id laboriosam tempore</em> est dignissimos alias et nesciunt expedita qui sapiente vero. Sit repellendus corruptiAut mollitia ad nihil impedit aut aliquid iste aut voluptas natus.</div>\r\n\r\n<div>Sit velit error qui dolores nulla.</div>\r\n\r\n<div>Qui corporis explicaboEt natus et eaque natus aut modi modi hic debitis galisum et suscipit optio a architecto nobis. Et velit alias <em>Id pariatur hic dolores similique ut laboriosam illo</em> et quia laudantium. Sed ratione doloremque est sequi consequatur <strong>Ex omnis eos reiciendis illo et veniam dolorem ut fugiat dicta</strong>.</div>\r\n\r\n<ul>\r\n	<li>\r\n	<div>Ut deleniti beatae et alias nihil ex sapiente nihil.</div>\r\n	</li>\r\n	<li>\r\n	<div>Ea iste delectus eos quaerat unde et blanditiis dolores.</div>\r\n	</li>\r\n	<li>\r\n	<div>Sit tenetur perspiciatis sit facere voluptates ea officiis beatae?</div>\r\n	</li>\r\n	<li>\r\n	<div>Id atque consequatur 33 magni facere.</div>\r\n	</li>\r\n	<li>\r\n	<div>33 necessitatibus Quis et voluptas sapiente.</div>\r\n	</li>\r\n	<li>\r\n	<div>Et enim mollitia non atque corrupti nam explicabo explicabo.</div>\r\n	</li>\r\n</ul>\r\n\r\n<div>Vel nihil incidunt ut provident autem in veritatis aliquid ut obcaecati ratione.</div>\r\n'),
(41, 'teste', 'peba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'imagens-1717642281314.png', '2024-06-06 02:51:21', NULL, NULL, '<p>teste</p>\r\n');

-- --------------------------------------------------------

--
-- Estrutura para tabela `logs_auditoria`
--

CREATE TABLE `logs_auditoria` (
  `id` int(11) NOT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `acao` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `role`) VALUES
(1, 'admin', '$2b$10$ip8vMgmNet2pw6MUS9AMyOl5Bmm.s3y1O/.Cg6n22hMtLUj/KuWhy', 'admin'),
(4, 'teste', '$2b$10$OCM/9eNZN3bQw7XfL7RS0uQKTS5Apull.cRdX/21maPvH.G6bZqB2', 'user');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `imagens`
--
ALTER TABLE `imagens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `individuo_id` (`individuo_id`);

--
-- Índices de tabela `individuos`
--
ALTER TABLE `individuos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `logs_auditoria`
--
ALTER TABLE `logs_auditoria`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `imagens`
--
ALTER TABLE `imagens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `individuos`
--
ALTER TABLE `individuos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de tabela `logs_auditoria`
--
ALTER TABLE `logs_auditoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `imagens`
--
ALTER TABLE `imagens`
  ADD CONSTRAINT `imagens_ibfk_1` FOREIGN KEY (`individuo_id`) REFERENCES `individuos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
