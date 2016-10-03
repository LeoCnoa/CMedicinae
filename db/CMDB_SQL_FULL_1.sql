-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.13-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para cmdb
CREATE DATABASE IF NOT EXISTS `cmdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cmdb`;


-- Copiando estrutura para tabela cmdb.agendamentos
CREATE TABLE IF NOT EXISTS `agendamentos` (
  `COD_AGENDAMENTOS` int(11) NOT NULL AUTO_INCREMENT,
  `MEDICOS_COD_MEDICOS` int(11) NOT NULL,
  `PACIENTES_COD_PACIENTES` int(11) NOT NULL,
  `AGE_DATA` date DEFAULT NULL,
  `AGE_HORA` time DEFAULT NULL,
  `AGE_CONFIRMACAO` int(11) DEFAULT NULL,
  `AGE_COMENTARIO` text,
  `AGE_ATIVO` int(11) NOT NULL,
  PRIMARY KEY (`COD_AGENDAMENTOS`,`MEDICOS_COD_MEDICOS`,`PACIENTES_COD_PACIENTES`),
  KEY `fk_MEDICOS_has_PACIENTES_PACIENTES1_idx` (`PACIENTES_COD_PACIENTES`),
  KEY `fk_MEDICOS_has_PACIENTES_MEDICOS_idx` (`MEDICOS_COD_MEDICOS`),
  CONSTRAINT `fk_MEDICOS_has_PACIENTES_MEDICOS` FOREIGN KEY (`MEDICOS_COD_MEDICOS`) REFERENCES `medicos` (`COD_MEDICOS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MEDICOS_has_PACIENTES_PACIENTES1` FOREIGN KEY (`PACIENTES_COD_PACIENTES`) REFERENCES `pacientes` (`COD_PACIENTES`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cmdb.agendamentos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `agendamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `agendamentos` ENABLE KEYS */;


-- Copiando estrutura para tabela cmdb.convenios
CREATE TABLE IF NOT EXISTS `convenios` (
  `COD_CONVENIOS` int(11) NOT NULL AUTO_INCREMENT,
  `CON_NOME` varchar(50) NOT NULL,
  `CON_TELEFONE1` varchar(50) DEFAULT NULL,
  `CON_TELEFONE2` varchar(50) DEFAULT NULL,
  `CON_EMAIL` varchar(50) DEFAULT NULL,
  `CON_COMENTARIOS` text,
  `CON_ATIVO` int(11) NOT NULL,
  PRIMARY KEY (`COD_CONVENIOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';

-- Copiando dados para a tabela cmdb.convenios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `convenios` DISABLE KEYS */;
/*!40000 ALTER TABLE `convenios` ENABLE KEYS */;


-- Copiando estrutura para tabela cmdb.medicos
CREATE TABLE IF NOT EXISTS `medicos` (
  `COD_MEDICOS` int(11) NOT NULL AUTO_INCREMENT,
  `MED_NOME` varchar(50) NOT NULL,
  `MED_RG` int(11) DEFAULT NULL,
  `MED_CPF` int(11) DEFAULT NULL,
  `MED_CRM` int(11) NOT NULL,
  `MED_TELEFONE` varchar(50) DEFAULT NULL,
  `MED_CELULAR` varchar(50) DEFAULT NULL,
  `MED_EMAIL` varchar(50) DEFAULT NULL,
  `MED_LOGRADOURO` varchar(50) DEFAULT NULL,
  `MED_BAIRRO` varchar(50) DEFAULT NULL,
  `MED_CIDADE` varchar(50) DEFAULT NULL,
  `MED_ESTADO` varchar(50) DEFAULT NULL,
  `MED_CEP` varchar(50) DEFAULT NULL,
  `MED_ESPECIALIZACAO` varchar(50) NOT NULL,
  `MED_COMENTARIOS` text,
  `MED_ATIVO` int(11) NOT NULL,
  PRIMARY KEY (`COD_MEDICOS`),
  UNIQUE KEY `COD_MEDICOS_UNIQUE` (`COD_MEDICOS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cmdb.medicos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;


-- Copiando estrutura para tabela cmdb.pacientes
CREATE TABLE IF NOT EXISTS `pacientes` (
  `COD_PACIENTES` int(11) NOT NULL AUTO_INCREMENT,
  `CONVENIOS_COD_CONVENIOS` int(11) NOT NULL,
  `PAC_NOME` varchar(50) NOT NULL,
  `PAC_EMAIL` varchar(50) DEFAULT NULL,
  `PAC_DATA_NASC` date DEFAULT NULL,
  `PAC_RG` int(11) DEFAULT NULL,
  `PAC_CPF` int(11) NOT NULL,
  `PAC_TELEFONE` varchar(50) NOT NULL,
  `PAC_CELULAR` varchar(50) DEFAULT NULL,
  `PAC_LOGRADOURO` varchar(50) DEFAULT NULL,
  `PAC_BAIRRO` varchar(50) DEFAULT NULL,
  `PAC_CIDADE` varchar(50) DEFAULT NULL,
  `PAC_ESTADO` varchar(50) DEFAULT NULL,
  `PAC_CEP` varchar(50) DEFAULT NULL,
  `PAC_COMENTARIOS` text,
  `PAC_ATIVO` int(11) NOT NULL,
  PRIMARY KEY (`COD_PACIENTES`,`CONVENIOS_COD_CONVENIOS`),
  UNIQUE KEY `COD_PACIENTES_UNIQUE` (`COD_PACIENTES`),
  KEY `fk_PACIENTES_CONVENIOS1_idx` (`CONVENIOS_COD_CONVENIOS`),
  CONSTRAINT `fk_PACIENTES_CONVENIOS1` FOREIGN KEY (`CONVENIOS_COD_CONVENIOS`) REFERENCES `convenios` (`COD_CONVENIOS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cmdb.pacientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;


-- Copiando estrutura para tabela cmdb.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `COD_USUARIOS` int(11) NOT NULL AUTO_INCREMENT,
  `USU_NOME` varchar(45) NOT NULL,
  `USU_EMAIL` varchar(45) DEFAULT NULL,
  `USU_LOGIN` varchar(45) NOT NULL,
  `USU_SENHA` varchar(45) NOT NULL,
  `USU_TELEFONE` varchar(50) DEFAULT NULL,
  `USU_CELULAR` varchar(50) DEFAULT NULL,
  `USU_RG` int(11) DEFAULT NULL,
  `USU_CPF` int(15) DEFAULT NULL,
  `USU_LOGRADOURO` varchar(50) DEFAULT NULL,
  `USU_BAIRRO` varchar(50) DEFAULT NULL,
  `USU_CIDADE` varchar(50) DEFAULT NULL,
  `USU_ESTADO` varchar(50) DEFAULT NULL,
  `USU_COMENTARIO` varchar(50) DEFAULT NULL,
  `USU_ATIVO` int(11) NOT NULL,
  PRIMARY KEY (`COD_USUARIOS`),
  UNIQUE KEY `USU_LOGIN_UNIQUE` (`USU_LOGIN`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela cmdb.usuarios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
