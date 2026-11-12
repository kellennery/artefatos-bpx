-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 25/10/2026 às 21:05
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
-- Estrutura para tabela `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `paciente_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo_evento` enum('insert','update','delete','restore','login','logout','leitura','exportacao','erro') NOT NULL,
  `entidade` varchar(255) NOT NULL,
  `registro_id` bigint(20) UNSIGNED DEFAULT NULL,
  `acao` varchar(255) NOT NULL,
  `justificativa` text DEFAULT NULL,
  `dados_anteriores` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dados_anteriores`)),
  `dados_novos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dados_novos`)),
  `campos_alterados` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`campos_alterados`)),
  `origem` enum('web','mobile','api','job','sistema') NOT NULL,
  `ip_origem` varchar(255) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `request_id` varchar(255) DEFAULT NULL,
  `sucesso` tinyint(1) NOT NULL DEFAULT 1,
  `mensagem_erro` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `audit_logs`
--

INSERT INTO `audit_logs` (`id`, `user_id`, `paciente_id`, `tipo_evento`, `entidade`, `registro_id`, `acao`, `justificativa`, `dados_anteriores`, `dados_novos`, `campos_alterados`, `origem`, `ip_origem`, `user_agent`, `request_id`, `sucesso`, `mensagem_erro`, `created_at`) VALUES
(1, NULL, NULL, 'login', 'users', 6, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.64.222.170', 'okhttp/4.12.0', NULL, 1, NULL, '2026-09-20 02:14:41'),
(2, NULL, NULL, 'insert', 'pacientes', 1, 'cadastro_paciente_titular', 'Cadastro do paciente titular.', NULL, '{\"nome\":\"nery.kellen@gmail.com\",\"data_nascimento\":\"1973-11-02T03:00:00.000000Z\",\"sexo\":\"feminino\",\"cpf\":\"03341635793\",\"telefone\":\"21988817765\",\"email\":\"nery.kellen@gmail.com\",\"nome_mae\":null,\"gestante\":false,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"AB+\",\"grupo_populacional\":\"nao_informado\",\"uf_residencia\":\"RJ\",\"user_id\":6,\"tipo_cadastro\":\"titular\",\"ativo\":true,\"ultimo_acesso_em\":\"2026-09-20T02:16:49.000000Z\",\"updated_at\":\"2026-09-20T02:16:49.000000Z\",\"created_at\":\"2026-09-20T02:16:49.000000Z\",\"id\":1}', '[\"nome\",\"data_nascimento\",\"sexo\",\"cpf\",\"telefone\",\"email\",\"nome_mae\",\"gestante\",\"data_inicio_gestacao\",\"tipo_sanguineo\",\"grupo_populacional\",\"uf_residencia\",\"user_id\",\"tipo_cadastro\",\"ativo\",\"ultimo_acesso_em\",\"updated_at\",\"created_at\",\"id\"]', 'api', '172.64.222.170', 'okhttp/4.12.0', NULL, 1, NULL, '2026-09-20 02:16:49'),
(3, NULL, NULL, 'update', 'pacientes', 1, 'alteracao_paciente_titular', 'Alteração de dados cadastrais do paciente titular.', '{\"data_nascimento\":\"1973-11-02T03:00:00.000000Z\",\"sexo\":\"feminino\",\"telefone\":\"21988817765\",\"nome_mae\":null,\"gestante\":false,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"AB+\",\"grupo_populacional\":\"nao_informado\",\"uf_residencia\":\"RJ\"}', '{\"data_nascimento\":\"1973-11-02T03:00:00.000000Z\",\"sexo\":\"feminino\",\"telefone\":\"21988817765\",\"nome_mae\":null,\"gestante\":false,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"AB+\",\"grupo_populacional\":\"nao_informado\",\"uf_residencia\":\"RJ\"}', '[\"data_nascimento\",\"sexo\",\"telefone\",\"nome_mae\",\"gestante\",\"data_inicio_gestacao\",\"tipo_sanguineo\",\"grupo_populacional\",\"uf_residencia\"]', 'api', '172.64.222.171', 'okhttp/4.12.0', NULL, 1, NULL, '2026-09-20 02:16:59'),
(4, 7, NULL, 'login', 'users', 7, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.69.91.27', 'okhttp/4.12.0', NULL, 1, NULL, '2026-09-30 16:56:40'),
(5, 7, NULL, 'login', 'users', 7, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.69.91.28', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-03 16:19:41'),
(6, 7, 2, 'insert', 'pacientes', 2, 'cadastro_paciente_titular', 'Cadastro do paciente titular.', NULL, '{\"nome\":\"Ana Lu\\u00edza Nery Marques de Souza\",\"data_nascimento\":\"1973-11-01T03:00:00.000000Z\",\"sexo\":\"feminino\",\"cpf\":\"18305859754\",\"telefone\":\"21975513113\",\"email\":\"analuizanerymarques@gmail.com\",\"nome_mae\":\"Kellen Cristina de Almeida Nery\",\"gestante\":false,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"nao_informado\",\"grupo_populacional\":\"nao_informado\",\"uf_residencia\":\"RJ\",\"user_id\":7,\"tipo_cadastro\":\"titular\",\"ativo\":true,\"ultimo_acesso_em\":\"2026-10-03T16:20:34.000000Z\",\"updated_at\":\"2026-10-03T16:20:34.000000Z\",\"created_at\":\"2026-10-03T16:20:34.000000Z\",\"id\":2}', '[\"nome\",\"data_nascimento\",\"sexo\",\"cpf\",\"telefone\",\"email\",\"nome_mae\",\"gestante\",\"data_inicio_gestacao\",\"tipo_sanguineo\",\"grupo_populacional\",\"uf_residencia\",\"user_id\",\"tipo_cadastro\",\"ativo\",\"ultimo_acesso_em\",\"updated_at\",\"created_at\",\"id\"]', 'api', '172.69.91.27', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-03 16:20:34'),
(7, 7, 3, 'insert', 'dependentes', 1, 'Dependente cadastrado', NULL, NULL, '{\"paciente\":{\"user_id\":7,\"nome\":\"Kellen Cristina de Almeida Nery\",\"data_nascimento\":\"1973-11-01T03:00:00.000000Z\",\"sexo\":\"feminino\",\"cpf\":null,\"cartao_sus\":null,\"telefone\":null,\"email\":null,\"nome_mae\":null,\"gestante\":false,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"AB+\",\"grupo_populacional\":\"nao_informado\",\"acamado\":false,\"institucionalizado\":false,\"uf_residencia\":\"RJ\",\"foto_perfil\":null,\"ativo\":true,\"tipo_cadastro\":\"dependente\",\"updated_at\":\"2026-10-03T16:23:42.000000Z\",\"created_at\":\"2026-10-03T16:23:42.000000Z\",\"id\":3},\"vinculo\":{\"responsavel_id\":2,\"dependente_id\":3,\"parentesco\":\"mae\",\"updated_at\":\"2026-10-03T16:23:42.000000Z\",\"created_at\":\"2026-10-03T16:23:42.000000Z\",\"id\":1}}', '[\"nome\",\"data_nascimento\",\"sexo\",\"cpf\",\"telefone\",\"email\",\"nome_mae\",\"gestante\",\"data_inicio_gestacao\",\"tipo_sanguineo\",\"grupo_populacional\",\"acamado\",\"institucionalizado\",\"uf_residencia\",\"foto_perfil\",\"parentesco\"]', 'api', '172.64.222.170', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-03 16:23:42'),
(8, 7, NULL, 'login', 'users', 7, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.64.222.170', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-03 16:33:46'),
(9, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"nery.kellen@gmail.com\"}', NULL, 'api', '172.70.140.170', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-05 13:38:07'),
(10, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"nery.kellen@gmail.com\"}', NULL, 'api', '172.70.140.171', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-05 13:38:20'),
(11, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":null}', NULL, 'api', '172.70.140.171', 'okhttp/4.12.0', NULL, 0, 'Código MFA inválido', '2026-10-05 13:40:11'),
(12, NULL, NULL, 'login', 'users', 6, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.70.140.171', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-05 13:40:30'),
(13, NULL, NULL, 'login', 'users', 6, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.71.238.60', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-06 23:14:32'),
(14, NULL, NULL, 'erro', 'users', NULL, 'Falha ao cadastrar usuário', 'Erro durante o processo de criação do usuário', NULL, '{\"name\":\"Tedte\",\"email\":\"equipevacinaplus@gmail.com\"}', NULL, 'api', '172.69.90.236', 'okhttp/4.12.0', NULL, 0, 'The email has already been taken.', '2026-10-12 23:36:55'),
(15, NULL, NULL, 'erro', 'users', NULL, 'Falha ao cadastrar usuário', 'Erro durante o processo de criação do usuário', NULL, '{\"name\":\"Pessoa Teste Maestro\",\"email\":\"equipevacinaplus@gmail.com\"}', NULL, 'api', '172.70.140.171', 'okhttp/4.12.0', NULL, 0, 'The email has already been taken.', '2026-10-12 23:45:14'),
(16, 10, NULL, 'login', 'users', 10, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.64.222.170', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-13 01:33:00'),
(17, 9, NULL, 'login', 'users', 9, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.64.222.170', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-13 01:42:58'),
(18, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"equipevacinaplus@gmail.com\"}', NULL, 'api', '172.64.222.171', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-13 01:52:44'),
(19, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"equipevacinaplus@gmail.com\"}', NULL, 'api', '172.64.222.170', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-13 02:00:46'),
(20, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"equipevacinaplus@gmail.com\"}', NULL, 'api', '172.64.222.171', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-13 02:01:19'),
(21, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"equipevacinaplus@gmail.com\"}', NULL, 'api', '172.64.222.171', 'okhttp/4.12.0', NULL, 0, 'Usuário bloqueado', '2026-10-13 02:01:53'),
(22, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"equipevacinaplus@gmail.com\"}', NULL, 'api', '172.64.222.170', 'okhttp/4.12.0', NULL, 0, 'Usuário bloqueado', '2026-10-13 02:07:18'),
(23, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"equipevacinaplus@gmail.com\"}', NULL, 'api', '172.64.222.171', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-13 02:21:00'),
(24, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"equipevacinaplus@gmail.com\"}', NULL, 'api', '172.64.222.170', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-13 02:21:34'),
(25, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"equipevacinaplus@gmail.com\"}', NULL, 'api', '172.64.222.171', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-13 02:22:08'),
(26, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"equipevacinaplus@gmail.com\"}', NULL, 'api', '172.64.222.170', 'okhttp/4.12.0', NULL, 0, 'Usuário bloqueado', '2026-10-13 02:23:39'),
(27, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"mfa.teste@vacinaplus.com\"}', NULL, 'api', '172.69.90.236', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-13 02:26:55'),
(28, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"mfa.teste@vacinaplus.com\"}', NULL, 'api', '172.69.90.236', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-13 02:27:29'),
(29, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"mfa.teste@vacinaplus.com\"}', NULL, 'api', '172.69.90.237', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-13 02:28:03'),
(30, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"mfa.teste@vacinaplus.com\"}', NULL, 'api', '172.69.90.237', 'okhttp/4.12.0', NULL, 0, 'Usuário bloqueado', '2026-10-13 02:28:35'),
(31, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"vacinaplus@gmail.com\"}', NULL, 'api', '172.69.90.237', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-13 02:33:59'),
(32, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"equipevacinaplus@gmail.com\"}', NULL, 'api', '172.69.90.237', 'okhttp/4.12.0', NULL, 0, 'Usuário bloqueado', '2026-10-13 02:34:18'),
(33, 10, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":null}', NULL, 'api', '172.64.222.171', 'okhttp/4.12.0', NULL, 0, 'Código MFA inválido', '2026-10-13 02:47:26'),
(34, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"mfa.teste@vacinaplus.com\"}', NULL, 'api', '172.64.222.171', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-13 02:50:21'),
(35, 11, NULL, 'login', 'users', 11, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.69.90.237', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-16 00:54:48'),
(36, 11, NULL, 'login', 'users', 11, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.64.222.171', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-16 00:59:25'),
(37, 11, NULL, 'login', 'users', 11, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.64.222.171', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-16 01:01:09'),
(38, 11, 4, 'insert', 'pacientes', 4, 'cadastro_paciente_titular', 'Cadastro do paciente titular.', NULL, '{\"nome\":\"Kellen Nery\",\"data_nascimento\":\"2000-01-02T02:00:00.000000Z\",\"sexo\":\"feminino\",\"cpf\":\"41537462075\",\"telefone\":\"11987654321\",\"email\":\"nery.kellen@gmail.com\",\"nome_mae\":\"Maria Exemplo de Souza\",\"gestante\":false,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"AB+\",\"grupo_populacional\":\"nao_informado\",\"uf_residencia\":\"SP\",\"user_id\":11,\"tipo_cadastro\":\"titular\",\"ativo\":true,\"ultimo_acesso_em\":\"2026-10-16T01:52:29.000000Z\",\"updated_at\":\"2026-10-16T01:52:29.000000Z\",\"created_at\":\"2026-10-16T01:52:29.000000Z\",\"id\":4}', '[\"nome\",\"data_nascimento\",\"sexo\",\"cpf\",\"telefone\",\"email\",\"nome_mae\",\"gestante\",\"data_inicio_gestacao\",\"tipo_sanguineo\",\"grupo_populacional\",\"uf_residencia\",\"user_id\",\"tipo_cadastro\",\"ativo\",\"ultimo_acesso_em\",\"updated_at\",\"created_at\",\"id\"]', 'api', '172.64.222.171', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-16 01:52:29'),
(39, 11, 4, 'update', 'pacientes', 4, 'alteracao_paciente_titular', 'Alteração de dados cadastrais do paciente titular.', '{\"data_nascimento\":\"2000-01-02T02:00:00.000000Z\",\"sexo\":\"feminino\",\"telefone\":\"11987654321\",\"nome_mae\":\"Maria Exemplo de Souza\",\"gestante\":false,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"AB+\",\"grupo_populacional\":\"nao_informado\",\"uf_residencia\":\"SP\"}', '{\"data_nascimento\":\"2000-01-02T02:00:00.000000Z\",\"sexo\":\"feminino\",\"telefone\":\"11999998888\",\"nome_mae\":\"Maria Exemplo de Souza\",\"gestante\":false,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"AB+\",\"grupo_populacional\":\"nao_informado\",\"uf_residencia\":\"SP\"}', '[\"data_nascimento\",\"sexo\",\"telefone\",\"nome_mae\",\"gestante\",\"data_inicio_gestacao\",\"tipo_sanguineo\",\"grupo_populacional\",\"uf_residencia\"]', 'api', '172.64.222.170', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-16 02:05:28'),
(40, 11, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":null}', NULL, 'api', '172.64.222.143', 'PostmanRuntime/7.56.0', NULL, 0, 'Código MFA inválido', '2026-10-22 18:49:57'),
(41, 11, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":null}', NULL, 'api', '172.64.222.142', 'PostmanRuntime/7.56.0', NULL, 0, 'Código MFA inválido', '2026-10-22 18:50:12'),
(42, 11, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":null}', NULL, 'api', '172.64.222.142', 'PostmanRuntime/7.56.0', NULL, 0, 'Código MFA inválido', '2026-10-22 18:50:24'),
(43, 11, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":null}', NULL, 'api', '172.64.222.143', 'PostmanRuntime/7.56.0', NULL, 0, 'Usuário bloqueado no MFA', '2026-10-22 18:50:36'),
(44, 11, NULL, 'login', 'users', 11, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.68.14.130', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-25 21:42:28'),
(45, 11, 5, 'insert', 'dependentes', 2, 'Dependente cadastrado', NULL, NULL, '{\"paciente\":{\"user_id\":11,\"nome\":\"Dependente Maestro A\",\"data_nascimento\":\"2022-10-03T03:00:00.000000Z\",\"sexo\":\"masculino\",\"cpf\":\"72151057097\",\"cartao_sus\":null,\"telefone\":null,\"email\":null,\"nome_mae\":null,\"gestante\":null,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"O+\",\"grupo_populacional\":\"nao_informado\",\"acamado\":false,\"institucionalizado\":false,\"uf_residencia\":\"SP\",\"foto_perfil\":null,\"ativo\":true,\"tipo_cadastro\":\"dependente\",\"updated_at\":\"2026-10-25T22:23:58.000000Z\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"id\":5},\"vinculo\":{\"responsavel_id\":4,\"dependente_id\":5,\"parentesco\":\"irmao\",\"updated_at\":\"2026-10-25T22:23:58.000000Z\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"id\":2}}', '[\"nome\",\"data_nascimento\",\"sexo\",\"cpf\",\"telefone\",\"email\",\"nome_mae\",\"gestante\",\"data_inicio_gestacao\",\"tipo_sanguineo\",\"grupo_populacional\",\"acamado\",\"institucionalizado\",\"uf_residencia\",\"foto_perfil\",\"parentesco\"]', 'api', '172.64.222.143', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-25 22:23:58'),
(46, 12, NULL, 'login', 'users', 12, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.64.222.143', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-25 22:56:25'),
(47, 12, 6, 'insert', 'pacientes', 6, 'cadastro_paciente_titular', 'Cadastro do paciente titular.', NULL, '{\"nome\":\"Usu\\u00e1rio Maestro B\",\"data_nascimento\":\"1996-10-02T03:00:00.000000Z\",\"sexo\":\"masculino\",\"cpf\":\"51881118029\",\"telefone\":\"21998532655\",\"email\":\"Kellennery@souunisuam.com.br\",\"nome_mae\":\"Maria DB\",\"gestante\":false,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"B-\",\"grupo_populacional\":\"indigena\",\"uf_residencia\":\"RJ\",\"user_id\":12,\"tipo_cadastro\":\"titular\",\"ativo\":true,\"ultimo_acesso_em\":\"2026-10-25T22:57:37.000000Z\",\"updated_at\":\"2026-10-25T22:57:37.000000Z\",\"created_at\":\"2026-10-25T22:57:37.000000Z\",\"id\":6}', '[\"nome\",\"data_nascimento\",\"sexo\",\"cpf\",\"telefone\",\"email\",\"nome_mae\",\"gestante\",\"data_inicio_gestacao\",\"tipo_sanguineo\",\"grupo_populacional\",\"uf_residencia\",\"user_id\",\"tipo_cadastro\",\"ativo\",\"ultimo_acesso_em\",\"updated_at\",\"created_at\",\"id\"]', 'api', '172.64.222.143', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-25 22:57:37'),
(48, 11, NULL, 'login', 'users', 11, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.64.222.143', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-25 23:09:25'),
(49, 11, NULL, 'login', 'users', 11, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.64.222.142', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-25 23:18:27'),
(50, 11, NULL, 'login', 'users', 11, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.64.222.142', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-25 23:26:27'),
(51, 12, NULL, 'login', 'users', 12, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.64.222.142', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-25 23:27:28'),
(52, 11, NULL, 'login', 'users', 11, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.64.222.143', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-25 23:30:37'),
(53, 12, NULL, 'login', 'users', 12, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.64.222.142', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-25 23:31:40'),
(54, NULL, NULL, 'login', 'users', NULL, 'Tentativa de login', NULL, NULL, '{\"email_informado\":\"nery.kellen@gmail.com\"}', NULL, 'api', '172.69.91.44', 'okhttp/4.12.0', NULL, 0, 'Credenciais inválidas', '2026-10-25 23:42:18'),
(55, 11, NULL, 'login', 'users', 11, 'Login realizado', NULL, NULL, NULL, NULL, 'api', '172.69.91.44', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-25 23:42:51'),
(56, 11, 5, 'update', 'dependentes', 2, 'Dados do dependente alterados', NULL, '{\"paciente\":{\"id\":5,\"user_id\":11,\"nome\":\"Dependente Maestro A\",\"data_nascimento\":\"2022-10-03T03:00:00.000000Z\",\"sexo\":\"masculino\",\"cpf\":\"72151057097\",\"cartao_sus\":null,\"telefone\":null,\"email\":null,\"nome_mae\":null,\"gestante\":null,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"O+\",\"grupo_populacional\":\"nao_informado\",\"acamado\":false,\"institucionalizado\":false,\"uf_residencia\":\"SP\",\"foto_perfil\":null,\"ultimo_acesso_em\":null,\"ativo\":true,\"tipo_cadastro\":\"dependente\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"updated_at\":\"2026-10-25T22:23:58.000000Z\",\"deleted_at\":null},\"vinculo\":{\"id\":2,\"responsavel_id\":4,\"dependente_id\":5,\"parentesco\":\"irmao\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"updated_at\":\"2026-10-25T22:23:58.000000Z\",\"deleted_at\":null}}', '{\"paciente\":{\"id\":5,\"user_id\":11,\"nome\":\"Dependente Maestro A can\",\"data_nascimento\":\"2022-10-03T03:00:00.000000Z\",\"sexo\":\"masculino\",\"cpf\":\"72151057097\",\"cartao_sus\":null,\"telefone\":null,\"email\":null,\"nome_mae\":null,\"gestante\":null,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"O+\",\"grupo_populacional\":\"nao_informado\",\"acamado\":false,\"institucionalizado\":false,\"uf_residencia\":\"SP\",\"foto_perfil\":null,\"ultimo_acesso_em\":null,\"ativo\":true,\"tipo_cadastro\":\"dependente\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"updated_at\":\"2026-10-25T23:44:07.000000Z\",\"deleted_at\":null},\"vinculo\":{\"id\":2,\"responsavel_id\":4,\"dependente_id\":5,\"parentesco\":\"irmao\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"updated_at\":\"2026-10-25T22:23:58.000000Z\",\"deleted_at\":null}}', '[\"pacientes.nome\"]', 'api', '172.69.91.44', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-25 23:44:07'),
(57, 11, 5, 'update', 'dependentes', 2, 'Dados do dependente alterados', NULL, '{\"paciente\":{\"id\":5,\"user_id\":11,\"nome\":\"Dependente Maestro A can\",\"data_nascimento\":\"2022-10-03T03:00:00.000000Z\",\"sexo\":\"masculino\",\"cpf\":\"72151057097\",\"cartao_sus\":null,\"telefone\":null,\"email\":null,\"nome_mae\":null,\"gestante\":null,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"O+\",\"grupo_populacional\":\"nao_informado\",\"acamado\":false,\"institucionalizado\":false,\"uf_residencia\":\"SP\",\"foto_perfil\":null,\"ultimo_acesso_em\":null,\"ativo\":true,\"tipo_cadastro\":\"dependente\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"updated_at\":\"2026-10-25T23:44:07.000000Z\",\"deleted_at\":null},\"vinculo\":{\"id\":2,\"responsavel_id\":4,\"dependente_id\":5,\"parentesco\":\"irmao\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"updated_at\":\"2026-10-25T22:23:58.000000Z\",\"deleted_at\":null}}', '{\"paciente\":{\"id\":5,\"user_id\":11,\"nome\":\"Dependente Maestro A\",\"data_nascimento\":\"2022-10-03T03:00:00.000000Z\",\"sexo\":\"masculino\",\"cpf\":\"72151057097\",\"cartao_sus\":null,\"telefone\":null,\"email\":null,\"nome_mae\":null,\"gestante\":null,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"O+\",\"grupo_populacional\":\"nao_informado\",\"acamado\":false,\"institucionalizado\":false,\"uf_residencia\":\"SP\",\"foto_perfil\":null,\"ultimo_acesso_em\":null,\"ativo\":true,\"tipo_cadastro\":\"dependente\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"updated_at\":\"2026-10-25T23:45:19.000000Z\",\"deleted_at\":null},\"vinculo\":{\"id\":2,\"responsavel_id\":4,\"dependente_id\":5,\"parentesco\":\"irmao\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"updated_at\":\"2026-10-25T22:23:58.000000Z\",\"deleted_at\":null}}', '[\"pacientes.nome\"]', 'api', '172.69.91.44', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-25 23:45:19'),
(58, 11, 5, 'update', 'dependentes', 2, 'Dados do dependente alterados', NULL, '{\"paciente\":{\"id\":5,\"user_id\":11,\"nome\":\"Dependente Maestro A\",\"data_nascimento\":\"2022-10-03T03:00:00.000000Z\",\"sexo\":\"masculino\",\"cpf\":\"72151057097\",\"cartao_sus\":null,\"telefone\":null,\"email\":null,\"nome_mae\":null,\"gestante\":null,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"O+\",\"grupo_populacional\":\"nao_informado\",\"acamado\":false,\"institucionalizado\":false,\"uf_residencia\":\"SP\",\"foto_perfil\":null,\"ultimo_acesso_em\":null,\"ativo\":true,\"tipo_cadastro\":\"dependente\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"updated_at\":\"2026-10-25T23:45:19.000000Z\",\"deleted_at\":null},\"vinculo\":{\"id\":2,\"responsavel_id\":4,\"dependente_id\":5,\"parentesco\":\"irmao\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"updated_at\":\"2026-10-25T22:23:58.000000Z\",\"deleted_at\":null}}', '{\"paciente\":{\"id\":5,\"user_id\":11,\"nome\":\"Dependente Maestro A Editado\",\"data_nascimento\":\"2022-10-03T03:00:00.000000Z\",\"sexo\":\"masculino\",\"cpf\":\"72151057097\",\"cartao_sus\":null,\"telefone\":null,\"email\":null,\"nome_mae\":null,\"gestante\":null,\"data_inicio_gestacao\":null,\"tipo_sanguineo\":\"O+\",\"grupo_populacional\":\"nao_informado\",\"acamado\":false,\"institucionalizado\":false,\"uf_residencia\":\"SP\",\"foto_perfil\":null,\"ultimo_acesso_em\":null,\"ativo\":true,\"tipo_cadastro\":\"dependente\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"updated_at\":\"2026-10-26T00:02:54.000000Z\",\"deleted_at\":null},\"vinculo\":{\"id\":2,\"responsavel_id\":4,\"dependente_id\":5,\"parentesco\":\"irmao\",\"created_at\":\"2026-10-25T22:23:58.000000Z\",\"updated_at\":\"2026-10-25T22:23:58.000000Z\",\"deleted_at\":null}}', '[\"pacientes.nome\"]', 'api', '172.69.91.44', 'okhttp/4.12.0', NULL, 1, NULL, '2026-10-26 00:02:54');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_logs_user_id_foreign` (`user_id`),
  ADD KEY `audit_logs_paciente_id_foreign` (`paciente_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_paciente_id_foreign` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `audit_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
