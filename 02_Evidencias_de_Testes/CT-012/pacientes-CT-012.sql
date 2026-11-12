-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 27/10/2026 às 12:48
-- Versão do servidor: 10.5.29-MariaDB
-- Versão do PHP: 8.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdvacina`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `pacientes`
--

CREATE TABLE `pacientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(255) NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` enum('masculino','feminino','outro','nao_informado') NOT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `cartao_sus` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome_mae` varchar(255) DEFAULT NULL,
  `gestante` tinyint(1) DEFAULT NULL,
  `data_inicio_gestacao` date DEFAULT NULL,
  `tipo_sanguineo` enum('A+','A-','B+','B-','AB+','AB-','O+','O-','nao_informado') NOT NULL DEFAULT 'nao_informado',
  `grupo_populacional` enum('indigena','quilombola','ribeirinho','nao_informado','outro') NOT NULL DEFAULT 'nao_informado',
  `acamado` tinyint(1) NOT NULL DEFAULT 0,
  `institucionalizado` tinyint(1) NOT NULL DEFAULT 0,
  `uf_residencia` char(2) NOT NULL,
  `foto_perfil` varchar(255) DEFAULT NULL,
  `ultimo_acesso_em` datetime DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `tipo_cadastro` enum('titular','dependente') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `pacientes`
--

INSERT INTO `pacientes` (`id`, `user_id`, `nome`, `data_nascimento`, `sexo`, `cpf`, `cartao_sus`, `telefone`, `email`, `nome_mae`, `gestante`, `data_inicio_gestacao`, `tipo_sanguineo`, `grupo_populacional`, `acamado`, `institucionalizado`, `uf_residencia`, `foto_perfil`, `ultimo_acesso_em`, `ativo`, `tipo_cadastro`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 7, 'Ana Luíza Nery Marques de Souza', '1973-11-01', 'feminino', '18305859754', NULL, '21975513113', 'analuizanerymarques@gmail.com', 'Kellen Cristina de Almeida Nery', 0, NULL, 'nao_informado', 'nao_informado', 0, 0, 'RJ', NULL, '2026-10-03 13:33:53', 1, 'titular', '2026-10-03 16:20:34', '2026-10-03 16:33:53', NULL),
(3, 7, 'Kellen Cristina de Almeida Nery', '1973-11-01', 'feminino', NULL, NULL, NULL, NULL, NULL, 0, NULL, 'AB+', 'nao_informado', 0, 0, 'RJ', NULL, NULL, 1, 'dependente', '2026-10-03 16:23:42', '2026-10-03 16:23:42', NULL),
(4, 11, 'Kellen Nery', '2000-01-02', 'feminino', '41537462075', NULL, '11999998888', 'nery.kellen@gmail.com', 'Maria Exemplo de Souza', 0, NULL, 'AB+', 'indigena', 0, 0, 'SP', NULL, '2026-10-27 12:47:22', 1, 'titular', '2026-10-16 01:52:29', '2026-10-27 15:47:22', NULL),
(5, 11, 'Dependente Maestro A', '2022-10-03', 'masculino', '72151057097', NULL, NULL, NULL, NULL, NULL, NULL, 'O+', 'nao_informado', 0, 0, 'SP', NULL, NULL, 1, 'dependente', '2026-10-25 22:23:58', '2026-10-27 15:10:34', '2026-10-27 15:10:34'),
(8, 11, 'Dependente Maestro A', '2020-10-06', 'masculino', '12424651035', NULL, NULL, NULL, NULL, NULL, NULL, 'B-', 'nao_informado', 0, 0, 'RJ', NULL, NULL, 1, 'dependente', '2026-10-27 15:15:21', '2026-10-27 15:41:40', '2026-10-27 15:41:40'),
(9, 12, 'Usuário B', '2000-10-10', 'masculino', '57825676009', NULL, NULL, 'Kellennery@souunisuam.com.br', NULL, 0, NULL, 'nao_informado', 'nao_informado', 0, 0, 'RJ', NULL, '2026-10-27 12:31:06', 1, 'titular', '2026-10-27 15:27:59', '2026-10-27 15:31:06', NULL),
(10, 11, 'Dependente Maestro A', '2022-10-27', 'masculino', '26508912038', NULL, NULL, NULL, NULL, NULL, NULL, 'B-', 'nao_informado', 0, 0, 'RJ', NULL, NULL, 1, 'dependente', '2026-10-27 15:45:51', '2026-10-27 15:47:15', '2026-10-27 15:47:15');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pacientes_cpf_unique` (`cpf`),
  ADD UNIQUE KEY `pacientes_cartao_sus_unique` (`cartao_sus`),
  ADD UNIQUE KEY `pacientes_email_unique` (`email`),
  ADD KEY `pacientes_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
