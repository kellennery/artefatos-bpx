-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 26/10/2026 às 00:18
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
-- Estrutura para tabela `registro_vacinais`
--

CREATE TABLE `registro_vacinais` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paciente_id` bigint(20) UNSIGNED NOT NULL,
  `vacina_id` bigint(20) UNSIGNED NOT NULL,
  `tipo_dose` enum('basica','reforco','unica','campanha','anual') NOT NULL,
  `numero_dose` int(11) DEFAULT NULL,
  `data_aplicacao` date NOT NULL,
  `data_aproximada` tinyint(1) NOT NULL DEFAULT 0,
  `unidade_saude` varchar(255) DEFAULT NULL,
  `profissional_responsavel` varchar(255) DEFAULT NULL,
  `lote` varchar(255) DEFAULT NULL,
  `fabricante` varchar(255) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `status_registro` enum('ativo','revisado','excluido') NOT NULL DEFAULT 'ativo',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `registro_vacinais`
--

INSERT INTO `registro_vacinais` (`id`, `paciente_id`, `vacina_id`, `tipo_dose`, `numero_dose`, `data_aplicacao`, `data_aproximada`, `unidade_saude`, `profissional_responsavel`, `lote`, `fabricante`, `observacoes`, `status_registro`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 4, 1, 'basica', 1, '2026-10-25', 0, NULL, NULL, 'Lote Teste Maestro', NULL, NULL, 'ativo', '2026-10-26 01:59:23', '2026-10-26 03:15:54', '2026-10-26 03:15:54'),
(3, 5, 2, 'basica', 1, '2026-10-25', 0, NULL, NULL, NULL, NULL, NULL, 'ativo', '2026-10-26 02:11:25', '2026-10-26 02:11:25', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `registro_vacinais`
--
ALTER TABLE `registro_vacinais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registro_vacinais_paciente_id_foreign` (`paciente_id`),
  ADD KEY `registro_vacinais_vacina_id_foreign` (`vacina_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `registro_vacinais`
--
ALTER TABLE `registro_vacinais`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `registro_vacinais`
--
ALTER TABLE `registro_vacinais`
  ADD CONSTRAINT `registro_vacinais_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `registro_vacinais_vacina_id_foreign` FOREIGN KEY (`vacina_id`) REFERENCES `vacinas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
