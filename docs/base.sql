CREATE TABLE `anio` ( 
  `id_anio` VARCHAR(50) NOT NULL,
  `anio` VARCHAR(50) NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_anio`),
  CONSTRAINT `año_unique` UNIQUE (`anio`),
  CONSTRAINT `id_año_unique` UNIQUE (`id_anio`)
);
CREATE TABLE `asociaciones` ( 
  `id_aso` VARCHAR(50) NOT NULL,
  `nom_asociacion` TEXT NULL,
  `estado_aso` TINYINT NULL DEFAULT 1 ,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_aso`)
);
CREATE TABLE `barrios` ( 
  `id_barrio` VARCHAR(50) NOT NULL,
  `nom_barrio` VARCHAR(120) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_barrio`),
  CONSTRAINT `nom_barrio` UNIQUE (`nom_barrio`)
);
CREATE TABLE `caja` ( 
  `id_caja` VARCHAR(50) NOT NULL,
  `fecha_cierre` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `monto_inicial` FLOAT NOT NULL,
  `monto_final` FLOAT NULL,
  `cerrada` TINYINT NOT NULL,
  `created_at` DATETIME NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_caja`)
);
CREATE TABLE `comuneros` ( 
  `id_comunero` VARCHAR(50) NOT NULL,
  `id_barrio` VARCHAR(50) NULL,
  `id_aso` VARCHAR(50) NULL,
  `id_persona` VARCHAR(50) NULL,
  `calificado` TINYINT NULL DEFAULT 0 ,
  `created_date` DATE NULL,
  `created_time` TIME NULL,
  `estado_com` TINYINT NULL DEFAULT 1 ,
  `numero_casa` INT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_comunero`)
);
CREATE TABLE `comuneros_tipos_doc` ( 
  `id_comunero` VARCHAR(50) NOT NULL,
  `id_tipo_doc` VARCHAR(50) NOT NULL,
  `documento` MEDIUMTEXT NULL,
  `last_update` DATE NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_comunero`, `id_tipo_doc`)
);
CREATE TABLE `cuota_anual` ( 
  `id_cuota` VARCHAR(50) NOT NULL,
  `nom_cuota` VARCHAR(100) NOT NULL,
  `valor_cuota` FLOAT NOT NULL,
  `estado_cuota` TINYINT NOT NULL DEFAULT 1 ,
  `id_anio` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(255) NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_cuota`, `id_anio`)
);
CREATE TABLE `cuotas_factura` ( 
  `id_factura` VARCHAR(50) NOT NULL,
  `id_cuota` VARCHAR(50) NOT NULL,
  `id_anio` VARCHAR(50) NOT NULL DEFAULT 1 ,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_factura`, `id_cuota`, `id_anio`)
);
CREATE TABLE `egresos` ( 
  `id_egreso` VARCHAR(40) NOT NULL,
  `detalle` VARCHAR(100) NOT NULL,
  `valor` FLOAT NOT NULL,
  `fecha_creacion` DATE NULL,
  `estado_egreso` TINYINT NOT NULL,
  `caja_id_caja` VARCHAR(50) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_egreso`)
);
CREATE TABLE `facturas` ( 
  `id_factura` VARCHAR(50) NOT NULL,
  `id_comunero` VARCHAR(50) NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `descrip_fac` VARCHAR(100) NULL,
  `subtotal_fac` FLOAT NOT NULL,
  `descuento` FLOAT NULL,
  `total_fac` FLOAT NOT NULL,
  `estado_fac` TINYINT NULL DEFAULT 1 ,
  `caja_id_caja` VARCHAR(50) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_factura`, `caja_id_caja`)
);
CREATE TABLE `ingresos` ( 
  `id_ingreso` VARCHAR(40) NOT NULL,
  `detalle` VARCHAR(100) NOT NULL,
  `valor` FLOAT NOT NULL,
  `estado_ingreso` TINYINT NOT NULL,
  `caja_id_caja` VARCHAR(50) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_ingreso`),
  CONSTRAINT `id_ingreso_UNIQUE` UNIQUE (`id_ingreso`)
);
CREATE TABLE `personas` ( 
  `id_persona` VARCHAR(50) NOT NULL,
  `cedula` VARCHAR(10) NOT NULL,
  `apellidos` VARCHAR(50) NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `fecha_de_nacimiento` DATE NOT NULL,
  `genero` TINYINT NOT NULL,
  `estado` TINYINT NULL DEFAULT 1 ,
  `celular_per` VARCHAR(10) NULL,
  `titulo_academico` VARCHAR(10) NULL DEFAULT 'sr.' ,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_persona`),
  CONSTRAINT `cedula` UNIQUE (`cedula`)
);
CREATE TABLE `requisito_apr` ( 
  `id_req_ap` VARCHAR(50) NOT NULL,
  `fecha_ap` DATE NOT NULL,
  `observacion` VARCHAR(150) NULL DEFAULT 'Ninguna' ,
  `id_persona` VARCHAR(50) NOT NULL,
  `id_req` VARCHAR(50) NOT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_req_ap`, `id_req`)
);
CREATE TABLE `requisitos` ( 
  `id_req` VARCHAR(50) NOT NULL,
  `requisito` VARCHAR(255) NOT NULL,
  `observacion` VARCHAR(255) NULL,
  `req_estado` TINYINT NULL DEFAULT 1 ,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_req`)
);
CREATE TABLE `rol_user` ( 
  `id_rol` VARCHAR(50) NOT NULL,
  `nom_rol` VARCHAR(50) NOT NULL,
  `estado_rol` TINYINT NULL DEFAULT 1 ,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_rol`)
);
CREATE TABLE `tipo_documentos` ( 
  `id_tipo_doc` VARCHAR(50) NOT NULL,
  `tipo_doc` LONGTEXT NOT NULL,
  `estado_doc` TINYINT NULL DEFAULT 1 ,
  `alias` VARCHAR(60) NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_tipo_doc`)
);
CREATE TABLE `usuarios` ( 
  `id_usuario` VARCHAR(50) NOT NULL,
  `id_comunero` VARCHAR(50) NULL,
  `id_rol` VARCHAR(50) NULL,
  `email` VARCHAR(100) NOT NULL,
  `created_at_date` DATE NOT NULL,
  `created_at_time` TIME NOT NULL,
  `nom_user` VARCHAR(12) NOT NULL,
  `pass_user` TEXT NOT NULL,
  `estado_user` TINYINT NULL DEFAULT 1 ,
  `img` LONGTEXT NULL,
  `signature` LONGTEXT NULL,
  CONSTRAINT `PRIMARY` PRIMARY KEY (`id_usuario`),
  CONSTRAINT `email` UNIQUE (`email`)
);
SET FOREIGN_KEY_CHECKS = 0;
INSERT INTO `anio` (`id_anio`, `anio`) VALUES ('56ec8d9d-9a30-42b2-bfc7-b0bbe86c6be4', '2022');
INSERT INTO `anio` (`id_anio`, `anio`) VALUES ('d48125e4-55ec-45ca-b45c-490d6bcff6e7', '2023');
INSERT INTO `asociaciones` (`id_aso`, `nom_asociacion`, `estado_aso`) VALUES ('aso-0cf272fe-df9d-4734-a1e0-8e6362acbffb', 'Maria Magdalena', 1);
INSERT INTO `asociaciones` (`id_aso`, `nom_asociacion`, `estado_aso`) VALUES ('aso-4f77af87-63dd-4ec0-8f4f-282d038736eb', 'Agricultores', 1);
INSERT INTO `barrios` (`id_barrio`, `nom_barrio`) VALUES ('bar-b83bd90e-acbb-4582-9bfd-41bf3bf378f9', '12 de Julio');
INSERT INTO `barrios` (`id_barrio`, `nom_barrio`) VALUES ('bar-8900e1f9-2b0c-4c62-bb0b-39373c6a7ef4', '25 de Diciembre');
INSERT INTO `barrios` (`id_barrio`, `nom_barrio`) VALUES ('bar-30ece9be-297a-4496-842b-b4bd39b88314', '3 de Noviembre');
INSERT INTO `caja` (`id_caja`, `fecha_cierre`, `updated_at`, `monto_inicial`, `monto_final`, `cerrada`, `created_at`) VALUES ('caj-019010c3-475b-4380-820b-dfc9d325f4d1', '2023-08-22 19:53:17', NULL, 43.5, 48.5, 1, '2023-08-22 19:52:59');
INSERT INTO `caja` (`id_caja`, `fecha_cierre`, `updated_at`, `monto_inicial`, `monto_final`, `cerrada`, `created_at`) VALUES ('caj-25223468-f1a7-491d-a9cb-c56164543883', '2023-08-29 19:11:03', NULL, 58.5, 73.5, 1, '2023-08-29 19:10:25');
INSERT INTO `caja` (`id_caja`, `fecha_cierre`, `updated_at`, `monto_inicial`, `monto_final`, `cerrada`, `created_at`) VALUES ('caj-35d5652d-5d26-4ed5-97c7-ce4eddc30da7', '2023-08-03 22:29:23', NULL, 0, 4, 1, '2023-08-03 22:28:59');
INSERT INTO `caja` (`id_caja`, `fecha_cierre`, `updated_at`, `monto_inicial`, `monto_final`, `cerrada`, `created_at`) VALUES ('caj-5a916abc-c38d-41ec-b821-84d488990f21', '2023-08-05 15:14:21', NULL, 12, 11, 1, '2023-08-05 15:14:07');
INSERT INTO `caja` (`id_caja`, `fecha_cierre`, `updated_at`, `monto_inicial`, `monto_final`, `cerrada`, `created_at`) VALUES ('caj-71f2e2af-3737-40fd-b59c-0bf001b406a6', NULL, NULL, 73.5, NULL, 0, '2023-08-30 16:01:05');
INSERT INTO `caja` (`id_caja`, `fecha_cierre`, `updated_at`, `monto_inicial`, `monto_final`, `cerrada`, `created_at`) VALUES ('caj-b72e6b92-fe47-4d96-abef-d8a8adf08325', '2023-08-23 20:16:19', NULL, 48.5, 58.5, 1, '2023-08-23 20:04:05');
INSERT INTO `caja` (`id_caja`, `fecha_cierre`, `updated_at`, `monto_inicial`, `monto_final`, `cerrada`, `created_at`) VALUES ('caj-d012f593-a950-4262-a440-cf6da6aa19d5', '2023-08-06 04:00:47', NULL, 11, 43.5, 1, '2023-08-06 03:59:42');
INSERT INTO `caja` (`id_caja`, `fecha_cierre`, `updated_at`, `monto_inicial`, `monto_final`, `cerrada`, `created_at`) VALUES ('caj-e7cdbc8d-d8c7-4dc2-ab2c-ac7fdc6a0b68', '2023-08-04 22:30:38', NULL, 4, 12, 1, '2023-08-04 22:29:59');
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-1c0be88c-0b0f-471f-9b01-76cbe083b7ed', 'bar-b83bd90e-acbb-4582-9bfd-41bf3bf378f9', NULL, 'per-15d4c236-0876-4aff-8f2e-1ad56123cd29', 1, '2023-06-29', '03:20:55', 1, 55);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-1e13a551-1cb4-4c05-ae66-4a8388049b71', 'bar-8900e1f9-2b0c-4c62-bb0b-39373c6a7ef4', NULL, 'per-005d1f5b-a522-4aeb-bbc2-9e39c99e281b', 0, '2023-06-24', '03:50:58', 1, 40);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-5cc42fc9-7c53-435a-932f-d9729bf8ea12', 'bar-8900e1f9-2b0c-4c62-bb0b-39373c6a7ef4', NULL, 'per-1eef6e1f-d8bf-46ae-9e62-7716faad6864', 1, '2023-07-16', '10:44:42', 1, 45);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-61760163-c7b0-4264-a024-1742b900f28b', 'bar-8900e1f9-2b0c-4c62-bb0b-39373c6a7ef4', 'aso-4f77af87-63dd-4ec0-8f4f-282d038736eb', 'per-2af3247f-4001-41be-bf79-c787ac070435', 1, '2022-04-21', '13:30:52', 1, 1);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-651b9549-da4d-4e8a-8b7d-060bb65835d8', 'bar-8900e1f9-2b0c-4c62-bb0b-39373c6a7ef4', 'aso-4f77af87-63dd-4ec0-8f4f-282d038736eb', 'per-7bef5a58-0939-4f9a-8c8a-4fc627bb4ca7', 1, '2023-07-15', '15:25:39', 1, 600);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-6980d3e8-55ec-435b-916d-3d17c970133a', 'bar-30ece9be-297a-4496-842b-b4bd39b88314', NULL, 'per-5304a01f-65b3-4716-a9cc-7bdd30afc974', 1, '2023-08-29', '11:37:46', 1, 100);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-6983984d-88b1-43c7-9ad9-9fd8b88bf78b', 'bar-b83bd90e-acbb-4582-9bfd-41bf3bf378f9', 'aso-4f77af87-63dd-4ec0-8f4f-282d038736eb', 'per-2eeea6d6-df32-4744-8051-d54155500718', 1, '2022-07-05', '02:38:16', 1, 18);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-6f52f149-30d0-4abb-91fa-957b6ee92ec4', 'bar-8900e1f9-2b0c-4c62-bb0b-39373c6a7ef4', NULL, 'per-2657af89-e753-4770-8970-a13e8d88b6a2', 0, '2023-06-19', '17:07:28', 1, 20);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-84360e4c-7ac1-4e1c-a553-d856fd6c2e83', 'bar-b83bd90e-acbb-4582-9bfd-41bf3bf378f9', 'aso-0cf272fe-df9d-4734-a1e0-8e6362acbffb', 'per-45857204-ae75-4a0f-ba12-e0acb087577d', 1, '2023-06-29', '02:33:26', 1, 25);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-85dd3d4d-e21d-404a-952e-459d48f1026e', 'bar-30ece9be-297a-4496-842b-b4bd39b88314', 'aso-4f77af87-63dd-4ec0-8f4f-282d038736eb', 'per-73b74dad-e3a8-4453-a6e2-76a021b93c03', 1, '2023-07-15', '15:24:49', 1, 40);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-89e9df92-bf9e-4a07-856b-508009697319', 'bar-30ece9be-297a-4496-842b-b4bd39b88314', NULL, 'per-863c7515-d6c9-4a68-8cbc-38e0734cf72a', 1, '2023-08-29', '11:45:11', 1, 78);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-9a1d1cde-e92e-4f6c-9e2d-ec34aa882e5a', 'bar-30ece9be-297a-4496-842b-b4bd39b88314', 'aso-4f77af87-63dd-4ec0-8f4f-282d038736eb', 'per-0a422e07-6ca6-4386-b231-c23067d40922', 1, '2023-06-12', '13:48:03', 1, 42);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-9b345bca-e38f-4501-8edf-2a9073ffa9b0', 'bar-8900e1f9-2b0c-4c62-bb0b-39373c6a7ef4', 'aso-4f77af87-63dd-4ec0-8f4f-282d038736eb', 'per-35aa37e4-4ad7-4fe7-bdd6-b95ae387d025', 1, '2023-08-05', '11:23:06', 1, 10);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-c595a4ea-2377-4d1c-b6ad-946f76e78a6b', 'bar-b83bd90e-acbb-4582-9bfd-41bf3bf378f9', NULL, 'per-34b877c2-1ab7-4a29-8e1c-cb73c0f1684a', 1, '2023-08-29', '11:44:00', 1, 84);
INSERT INTO `comuneros` (`id_comunero`, `id_barrio`, `id_aso`, `id_persona`, `calificado`, `created_date`, `created_time`, `estado_com`, `numero_casa`) VALUES ('com-f0fe2d0c-ad0e-4ab7-bbe2-93f6be876f2c', 'bar-b83bd90e-acbb-4582-9bfd-41bf3bf378f9', 'aso-4f77af87-63dd-4ec0-8f4f-282d038736eb', 'per-2477b245-23f8-4067-af7d-846c6ae5de89', 1, '2023-07-02', '03:14:29', 1, 13);
INSERT INTO `comuneros_tipos_doc` (`id_comunero`, `id_tipo_doc`, `documento`, `last_update`) VALUES ('com-1e13a551-1cb4-4c05-ae66-4a8388049b71', '17a39892-74b0-4204-9a06-e0afea5da185', 'Certificado de votación.pdf', '2023-08-16');
INSERT INTO `comuneros_tipos_doc` (`id_comunero`, `id_tipo_doc`, `documento`, `last_update`) VALUES ('com-651b9549-da4d-4e8a-8b7d-060bb65835d8', '17a39892-74b0-4204-9a06-e0afea5da185', 'Certificado de votación.pdf', '2023-07-20');
INSERT INTO `comuneros_tipos_doc` (`id_comunero`, `id_tipo_doc`, `documento`, `last_update`) VALUES ('com-651b9549-da4d-4e8a-8b7d-060bb65835d8', 'dc6844fd-e0d0-45cb-9a53-8c6dc75ee6e8', 'Cedula.pdf', '2023-07-20');
INSERT INTO `comuneros_tipos_doc` (`id_comunero`, `id_tipo_doc`, `documento`, `last_update`) VALUES ('com-6f52f149-30d0-4abb-91fa-957b6ee92ec4', '17a39892-74b0-4204-9a06-e0afea5da185', 'Certificado de votación.pdf', '2023-08-03');
INSERT INTO `comuneros_tipos_doc` (`id_comunero`, `id_tipo_doc`, `documento`, `last_update`) VALUES ('com-84360e4c-7ac1-4e1c-a553-d856fd6c2e83', '17a39892-74b0-4204-9a06-e0afea5da185', 'Certificado de votación.pdf', '2023-08-02');
INSERT INTO `comuneros_tipos_doc` (`id_comunero`, `id_tipo_doc`, `documento`, `last_update`) VALUES ('com-84360e4c-7ac1-4e1c-a553-d856fd6c2e83', 'dc6844fd-e0d0-45cb-9a53-8c6dc75ee6e8', 'Cedula.pdf', '2023-08-02');
INSERT INTO `cuota_anual` (`id_cuota`, `nom_cuota`, `valor_cuota`, `estado_cuota`, `id_anio`, `descripcion`) VALUES ('16b585f0-ca4f-4d8f-a8ea-9514e241b8cb', 'Cuota Anual', 5, 1, 'd48125e4-55ec-45ca-b45c-490d6bcff6e7', 'Cuota Comuna');
INSERT INTO `cuota_anual` (`id_cuota`, `nom_cuota`, `valor_cuota`, `estado_cuota`, `id_anio`, `descripcion`) VALUES ('b6b674e1-4054-42c3-b99b-502534c1e630', 'Cuota Festividades', 15, 1, 'd48125e4-55ec-45ca-b45c-490d6bcff6e7', 'Cuota Aniversario Comuna');
INSERT INTO `cuota_anual` (`id_cuota`, `nom_cuota`, `valor_cuota`, `estado_cuota`, `id_anio`, `descripcion`) VALUES ('e9310418-6363-430d-8dd5-a7bbbf2c5837', 'Cuota Anual', 10, 1, 'd48125e4-55ec-45ca-b45c-490d6bcff6e7', 'Cuota festividades Iglesia');
INSERT INTO `cuotas_factura` (`id_factura`, `id_cuota`, `id_anio`) VALUES ('21226937-b6b7-4f90-9f53-02fea664e510', '16b585f0-ca4f-4d8f-a8ea-9514e241b8cb', 'd48125e4-55ec-45ca-b45c-490d6bcff6e7');
INSERT INTO `cuotas_factura` (`id_factura`, `id_cuota`, `id_anio`) VALUES ('a3dc2471-a05e-4b38-b00f-539418e3813b', '16b585f0-ca4f-4d8f-a8ea-9514e241b8cb', 'd48125e4-55ec-45ca-b45c-490d6bcff6e7');
INSERT INTO `cuotas_factura` (`id_factura`, `id_cuota`, `id_anio`) VALUES ('b463caa5-bd92-4b0a-b103-8185a58404e9', '16b585f0-ca4f-4d8f-a8ea-9514e241b8cb', 'd48125e4-55ec-45ca-b45c-490d6bcff6e7');
INSERT INTO `cuotas_factura` (`id_factura`, `id_cuota`, `id_anio`) VALUES ('c87c5809-2500-4104-959b-1e5127b60f98', '16b585f0-ca4f-4d8f-a8ea-9514e241b8cb', 'd48125e4-55ec-45ca-b45c-490d6bcff6e7');
INSERT INTO `cuotas_factura` (`id_factura`, `id_cuota`, `id_anio`) VALUES ('26a8ed94-f20d-42e9-b7aa-f63ea5d9c24a', 'b6b674e1-4054-42c3-b99b-502534c1e630', 'd48125e4-55ec-45ca-b45c-490d6bcff6e7');
INSERT INTO `cuotas_factura` (`id_factura`, `id_cuota`, `id_anio`) VALUES ('5da11431-d2d1-4bde-8867-742dc8fc54a6', 'b6b674e1-4054-42c3-b99b-502534c1e630', 'd48125e4-55ec-45ca-b45c-490d6bcff6e7');
INSERT INTO `cuotas_factura` (`id_factura`, `id_cuota`, `id_anio`) VALUES ('afce4083-ff56-4cf0-a657-1209d529350a', 'b6b674e1-4054-42c3-b99b-502534c1e630', 'd48125e4-55ec-45ca-b45c-490d6bcff6e7');
INSERT INTO `cuotas_factura` (`id_factura`, `id_cuota`, `id_anio`) VALUES ('9fac3681-c9c8-47c5-9919-8c5a2515ff55', 'e9310418-6363-430d-8dd5-a7bbbf2c5837', 'd48125e4-55ec-45ca-b45c-490d6bcff6e7');
INSERT INTO `cuotas_factura` (`id_factura`, `id_cuota`, `id_anio`) VALUES ('a3dc2471-a05e-4b38-b00f-539418e3813b', 'e9310418-6363-430d-8dd5-a7bbbf2c5837', 'd48125e4-55ec-45ca-b45c-490d6bcff6e7');
INSERT INTO `cuotas_factura` (`id_factura`, `id_cuota`, `id_anio`) VALUES ('be0a8d46-2865-40f0-b05f-e07635a173c5', 'e9310418-6363-430d-8dd5-a7bbbf2c5837', 'd48125e4-55ec-45ca-b45c-490d6bcff6e7');
INSERT INTO `cuotas_factura` (`id_factura`, `id_cuota`, `id_anio`) VALUES ('eca250ff-3294-478b-96cb-a5a637d36e87', 'e9310418-6363-430d-8dd5-a7bbbf2c5837', 'd48125e4-55ec-45ca-b45c-490d6bcff6e7');
INSERT INTO `egresos` (`id_egreso`, `detalle`, `valor`, `fecha_creacion`, `estado_egreso`, `caja_id_caja`) VALUES ('egrs-3297fa55-770d-4fa7-b3ac-736613be007', 'Compra de Hojas', 2, '2023-08-04', 1, 'caj-e7cdbc8d-d8c7-4dc2-ab2c-ac7fdc6a0b68');
INSERT INTO `egresos` (`id_egreso`, `detalle`, `valor`, `fecha_creacion`, `estado_egreso`, `caja_id_caja`) VALUES ('egrs-4571cf5e-fcf1-4091-8a9e-817f9c1fdae', 'Compra de Lapices', 1, '2023-08-05', 1, 'caj-5a916abc-c38d-41ec-b821-84d488990f21');
INSERT INTO `egresos` (`id_egreso`, `detalle`, `valor`, `fecha_creacion`, `estado_egreso`, `caja_id_caja`) VALUES ('egrs-56f765ae-e6d5-44f5-b18f-5e1e51ae364', 'Compra agua', 1, '2023-08-03', 1, 'caj-35d5652d-5d26-4ed5-97c7-ce4eddc30da7');
INSERT INTO `egresos` (`id_egreso`, `detalle`, `valor`, `fecha_creacion`, `estado_egreso`, `caja_id_caja`) VALUES ('egrs-809826eb-3c0a-429e-97d6-126a48cb7f1', 'Compra de viveres', 5, '2023-08-29', 1, 'caj-25223468-f1a7-491d-a9cb-c56164543883');
INSERT INTO `egresos` (`id_egreso`, `detalle`, `valor`, `fecha_creacion`, `estado_egreso`, `caja_id_caja`) VALUES ('egrs-a5bea3a7-ca7c-4ff5-84db-64ce343f14e', 'Compra de resma de hojas', 5, '2023-08-06', 1, 'caj-d012f593-a950-4262-a440-cf6da6aa19d5');
INSERT INTO `egresos` (`id_egreso`, `detalle`, `valor`, `fecha_creacion`, `estado_egreso`, `caja_id_caja`) VALUES ('egrs-f4de7837-ebab-4de6-80d3-7988d5c01b9', 'Compra de esferos', 10, '2023-08-23', 1, 'caj-b72e6b92-fe47-4d96-abef-d8a8adf08325');
INSERT INTO `facturas` (`id_factura`, `id_comunero`, `fecha`, `hora`, `descrip_fac`, `subtotal_fac`, `descuento`, `total_fac`, `estado_fac`, `caja_id_caja`) VALUES ('21226937-b6b7-4f90-9f53-02fea664e510', 'com-61760163-c7b0-4264-a024-1742b900f28b', '2023-08-22', '14:53:11', 'Ninguna', 5, NULL, 5, 1, 'caj-019010c3-475b-4380-820b-dfc9d325f4d1');
INSERT INTO `facturas` (`id_factura`, `id_comunero`, `fecha`, `hora`, `descrip_fac`, `subtotal_fac`, `descuento`, `total_fac`, `estado_fac`, `caja_id_caja`) VALUES ('26a8ed94-f20d-42e9-b7aa-f63ea5d9c24a', 'com-1c0be88c-0b0f-471f-9b01-76cbe083b7ed', '2023-08-23', '15:16:01', '', 15, NULL, 15, 1, 'caj-b72e6b92-fe47-4d96-abef-d8a8adf08325');
INSERT INTO `facturas` (`id_factura`, `id_comunero`, `fecha`, `hora`, `descrip_fac`, `subtotal_fac`, `descuento`, `total_fac`, `estado_fac`, `caja_id_caja`) VALUES ('5da11431-d2d1-4bde-8867-742dc8fc54a6', 'com-5cc42fc9-7c53-435a-932f-d9729bf8ea12', '2023-08-06', '04:00:33', '', 15, NULL, 15, 1, 'caj-d012f593-a950-4262-a440-cf6da6aa19d5');
INSERT INTO `facturas` (`id_factura`, `id_comunero`, `fecha`, `hora`, `descrip_fac`, `subtotal_fac`, `descuento`, `total_fac`, `estado_fac`, `caja_id_caja`) VALUES ('9fac3681-c9c8-47c5-9919-8c5a2515ff55', 'com-5cc42fc9-7c53-435a-932f-d9729bf8ea12', '2023-08-29', '14:10:36', 'Ninguna', 10, NULL, 10, 1, 'caj-25223468-f1a7-491d-a9cb-c56164543883');
INSERT INTO `facturas` (`id_factura`, `id_comunero`, `fecha`, `hora`, `descrip_fac`, `subtotal_fac`, `descuento`, `total_fac`, `estado_fac`, `caja_id_caja`) VALUES ('a3dc2471-a05e-4b38-b00f-539418e3813b', 'com-1e13a551-1cb4-4c05-ae66-4a8388049b71', '2023-08-06', '04:00:28', 'Ninguna', 15, NULL, 15, 1, 'caj-d012f593-a950-4262-a440-cf6da6aa19d5');
INSERT INTO `facturas` (`id_factura`, `id_comunero`, `fecha`, `hora`, `descrip_fac`, `subtotal_fac`, `descuento`, `total_fac`, `estado_fac`, `caja_id_caja`) VALUES ('afce4083-ff56-4cf0-a657-1209d529350a', 'com-f0fe2d0c-ad0e-4ab7-bbe2-93f6be876f2c', '2023-08-06', '04:00:40', '', 15, NULL, 7.5, 1, 'caj-d012f593-a950-4262-a440-cf6da6aa19d5');
INSERT INTO `facturas` (`id_factura`, `id_comunero`, `fecha`, `hora`, `descrip_fac`, `subtotal_fac`, `descuento`, `total_fac`, `estado_fac`, `caja_id_caja`) VALUES ('b463caa5-bd92-4b0a-b103-8185a58404e9', 'com-651b9549-da4d-4e8a-8b7d-060bb65835d8', '2023-08-03', '17:29:07', 'Ninguna', 5, NULL, 5, 1, 'caj-35d5652d-5d26-4ed5-97c7-ce4eddc30da7');
INSERT INTO `facturas` (`id_factura`, `id_comunero`, `fecha`, `hora`, `descrip_fac`, `subtotal_fac`, `descuento`, `total_fac`, `estado_fac`, `caja_id_caja`) VALUES ('be0a8d46-2865-40f0-b05f-e07635a173c5', 'com-61760163-c7b0-4264-a024-1742b900f28b', '2023-08-04', '17:30:10', '', 10, NULL, 10, 1, 'caj-e7cdbc8d-d8c7-4dc2-ab2c-ac7fdc6a0b68');
INSERT INTO `facturas` (`id_factura`, `id_comunero`, `fecha`, `hora`, `descrip_fac`, `subtotal_fac`, `descuento`, `total_fac`, `estado_fac`, `caja_id_caja`) VALUES ('c87c5809-2500-4104-959b-1e5127b60f98', 'com-6f52f149-30d0-4abb-91fa-957b6ee92ec4', '2023-08-23', '15:15:55', 'Ninguna', 5, NULL, 5, 1, 'caj-b72e6b92-fe47-4d96-abef-d8a8adf08325');
INSERT INTO `facturas` (`id_factura`, `id_comunero`, `fecha`, `hora`, `descrip_fac`, `subtotal_fac`, `descuento`, `total_fac`, `estado_fac`, `caja_id_caja`) VALUES ('eca250ff-3294-478b-96cb-a5a637d36e87', 'com-85dd3d4d-e21d-404a-952e-459d48f1026e', '2023-08-29', '14:10:41', '', 10, NULL, 10, 1, 'caj-25223468-f1a7-491d-a9cb-c56164543883');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-005d1f5b-a522-4aeb-bbc2-9e39c99e281b', '0704545821', 'Arturo', 'Correa', '1967-03-30', 1, 1, '0900000000', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-0a422e07-6ca6-4386-b231-c23067d40922', '0987845123', 'Perez ', 'Juan Raul', '1980-05-05', 0, 1, '0924861230', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-15d4c236-0876-4aff-8f2e-1ad56123cd29', '0942397779', 'Sornoza', 'Oscar ', '1995-09-19', 1, 1, '0912345678', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-1eef6e1f-d8bf-46ae-9e62-7716faad6864', '0928225283', 'Leon Rivera', 'Helen Jamel', '2001-06-05', 0, 1, '0927987456', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-2477b245-23f8-4067-af7d-846c6ae5de89', '0705321925', 'Ramos', 'José', '1990-07-17', 1, 1, '0999999999', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-2657af89-e753-4770-8970-a13e8d88b6a2', '0929012656', 'Alberto', 'Ramirez', '2002-05-23', 1, 1, '0999999999', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-2af3247f-4001-41be-bf79-c787ac070435', '0927966870', 'Rosales Caiche', 'Steven Ariel', '2000-04-17', 1, 1, '0962010164', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-2eeea6d6-df32-4744-8051-d54155500718', '0987964512', 'Tomalá Tomalá', 'Arturo ', '1985-05-04', 0, 1, '0924567811', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-34b877c2-1ab7-4a29-8e1c-cb73c0f1684a', '1200891115', 'Rugel', 'Alberto', '1958-10-22', 1, 1, '0914785464', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-35aa37e4-4ad7-4fe7-bdd6-b95ae387d025', '0701935439', 'Aguilar Toro', 'Antonio Josué ', '1967-03-30', 1, 1, '0962001628', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-45857204-ae75-4a0f-ba12-e0acb087577d', '0703233676', 'Alvarado Ludena', 'Marcel', '1976-03-05', 1, 1, '0927548796', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-5304a01f-65b3-4716-a9cc-7bdd30afc974', '2450320912', 'Reyes', 'Melany', '2001-02-27', 0, 1, '', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-652c901e-3a7c-462e-bed5-915514a1f5fe', '2400031445', 'Miraba Reyes', 'Anthony Steven', '2001-05-15', 1, 1, '', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-73b74dad-e3a8-4453-a6e2-76a021b93c03', '0927966879', 'Rosales Caiche ', 'Steven Ariel ', '2001-07-18', 1, 1, '0962001628', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-7bef5a58-0939-4f9a-8c8a-4fc627bb4ca7', '0706016375', 'Ramirez Tejada', 'Dixon David', '1996-03-18', 1, 1, '0962001628', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-863c7515-d6c9-4a68-8cbc-38e0734cf72a', '0104034954', 'Cabrera Cabrera', 'Jose Gustavo', '1984-09-29', 1, 1, '', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-997f4db8-10a7-4df0-ad3d-cf9e7095d3b6', '0956771745', 'Torres Lara', 'Mayerli Johanna', '2001-11-23', 0, 1, '', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-aefc6261-18d0-49a7-a660-b3227d9f59c2', '0802482463', 'Chala Banguera', 'Alfredo Pascual', '1982-04-11', 1, 1, '', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-b73ac912-872a-4e93-bbef-5661deedfcc5', '0927966878', 'Caiche Catuto', 'Virginia Rosario', '1977-07-01', 0, 1, '0918980661', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-ea6d33f1-9821-4c6d-bcaa-0dbae5231686', '0706513066', 'Encarnacion Valle', 'Deiber Leonardo', '1991-06-24', 1, 1, '', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-f8a292b1-facd-4ec0-bbad-f04ee7c67576', '0705458917', 'Marin Ajila', 'Hammer Tomas', '1988-05-17', 1, 1, '', 'sr.');
INSERT INTO `personas` (`id_persona`, `cedula`, `apellidos`, `nombre`, `fecha_de_nacimiento`, `genero`, `estado`, `celular_per`, `titulo_academico`) VALUES ('per-f9f03ab0-e721-459d-843b-44edde53cc4c', '1719240929', 'Cordova Vera', 'Bryan Francisco', '1990-12-16', 1, 1, '0962001628', 'sr.');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('04bf99b8-5068-4e65-848f-c994bc6c5b22', '2023-07-16', 'Ninguna', 'per-35aa37e4-4ad7-4fe7-bdd6-b95ae387d025', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('14af7e0f-bdbb-4a22-8b92-98520774846c', '2023-06-19', 'Ninguna', 'per-45857204-ae75-4a0f-ba12-e0acb087577d', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('14ca21cb-8cd0-448e-b574-75bfc16847c2', '2023-06-18', 'Ninguna', 'per-2657af89-e753-4770-8970-a13e8d88b6a2', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('16bd43a6-aeb9-4b22-beb2-d7608069e7d4', '2023-05-26', 'Justificación', 'per-0a422e07-6ca6-4386-b231-c23067d40922', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('1baf59f2-190d-4f3f-a8c2-31d747117897', '2023-06-23', 'Ninguna', 'per-005d1f5b-a522-4aeb-bbc2-9e39c99e281b', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('2685f859-4e0f-4ba6-a4f0-163626ab627f', '2023-06-19', 'Ninguna', 'per-7bef5a58-0939-4f9a-8c8a-4fc627bb4ca7', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('27b64248-90f3-4b34-a99b-695447f5e88d', '2023-06-23', 'Ninguna', 'per-005d1f5b-a522-4aeb-bbc2-9e39c99e281b', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('398d9f4b-ba0c-4d54-b4e9-6c9dc1dbcb7e', '2023-05-20', 'Justificación', 'per-0a422e07-6ca6-4386-b231-c23067d40922', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('3c40f312-73db-44f1-9983-1941b5675a43', '2023-07-16', 'Ninguna', 'per-1eef6e1f-d8bf-46ae-9e62-7716faad6864', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('3d05ad1f-952a-495d-b50a-dc51a1fe8975', '2023-07-08', 'Ninguna', 'per-1eef6e1f-d8bf-46ae-9e62-7716faad6864', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('3ddef8b1-e0d3-466a-8d9b-d59ae55d9276', '2023-06-16', 'Ninguna', 'per-7bef5a58-0939-4f9a-8c8a-4fc627bb4ca7', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('42c549a2-1c32-471e-a052-b8928fbefb6b', '2023-08-29', 'Ninguna', 'per-34b877c2-1ab7-4a29-8e1c-cb73c0f1684a', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('49db4b92-5f16-428b-8c90-0617cd15e751', '2023-06-24', 'Ninguna', 'per-45857204-ae75-4a0f-ba12-e0acb087577d', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('4bb1d483-484e-4b13-9784-4bbecdeb3c4e', '2023-06-23', 'Ninguna', 'per-5304a01f-65b3-4716-a9cc-7bdd30afc974', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('4f3d36b8-51f8-42c4-8105-4702986d056d', '2023-07-15', 'Ninguna', 'per-73b74dad-e3a8-4453-a6e2-76a021b93c03', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('4fb627fc-eb5c-4cfa-bd34-ba69e3c18eeb', '2023-06-19', 'Ninguna', 'per-005d1f5b-a522-4aeb-bbc2-9e39c99e281b', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('59967de9-683e-4732-aa99-269a107f583d', '2023-05-20', 'Justificación', 'per-0a422e07-6ca6-4386-b231-c23067d40922', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('5b61a5dd-24c6-43ca-a037-c1a5aeed10aa', '2023-06-24', 'Ninguna', 'per-15d4c236-0876-4aff-8f2e-1ad56123cd29', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('5b87c74b-1a9c-4221-8e3f-b87f12ba4850', '2023-06-19', 'Ninguna', 'per-2657af89-e753-4770-8970-a13e8d88b6a2', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('6067e614-def0-4e0e-a440-4a21e243353e', '2023-06-19', 'Ninguna', 'per-73b74dad-e3a8-4453-a6e2-76a021b93c03', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('6406e2a9-35e6-40f5-a23b-9a447459505d', '2023-07-08', 'Ninguna', 'per-1eef6e1f-d8bf-46ae-9e62-7716faad6864', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('7d776a30-785c-40d2-a7b1-14deabeffa16', '2023-07-01', 'Ninguna', 'per-2eeea6d6-df32-4744-8051-d54155500718', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('7e4fcf22-5be4-4052-8326-da904c1cfb50', '2023-08-15', 'Ninguna', 'per-5304a01f-65b3-4716-a9cc-7bdd30afc974', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('89476a25-487b-4c9a-89cd-be9d465da01c', '2023-07-01', 'Ninguna', 'per-35aa37e4-4ad7-4fe7-bdd6-b95ae387d025', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('9025b54c-bed7-4b5a-8a60-2fba285edcd7', '2023-06-24', 'Ninguna', 'per-15d4c236-0876-4aff-8f2e-1ad56123cd29', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('a5e58719-2d07-44f6-ba65-d1e0e39d5446', '2023-07-01', 'Ninguna', 'per-2eeea6d6-df32-4744-8051-d54155500718', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('abaae946-e8a4-410b-95b0-952fa7416667', '2023-06-19', 'Ninguna', 'per-73b74dad-e3a8-4453-a6e2-76a021b93c03', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('ad4f3a64-78f3-4be3-91c5-ba84d1443188', '2023-08-29', 'Ninguna', 'per-34b877c2-1ab7-4a29-8e1c-cb73c0f1684a', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('af1f9983-f55c-4652-9496-0107c6547159', '2023-06-17', 'Ninguna', 'per-7bef5a58-0939-4f9a-8c8a-4fc627bb4ca7', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('b1530f82-4162-4ee4-b9f5-2dc9a075483c', '2023-08-29', 'Ninguna', 'per-863c7515-d6c9-4a68-8cbc-38e0734cf72a', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('b2baa378-4098-45c4-a959-cfbaac0dbd8e', '2023-08-05', 'Ninguna', 'per-5304a01f-65b3-4716-a9cc-7bdd30afc974', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('bdbadee5-17e2-4d20-8d7b-33721f0ecf53', '2023-08-30', 'Ninguna', 'per-ea6d33f1-9821-4c6d-bcaa-0dbae5231686', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('c91cb9ca-eaed-43d8-91d7-fa34877f77b4', '2023-06-30', 'Ninguna', 'per-2477b245-23f8-4067-af7d-846c6ae5de89', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('d20dfdc4-c5d2-49db-b081-f729eaec487f', '2023-08-30', 'Ninguna', 'per-ea6d33f1-9821-4c6d-bcaa-0dbae5231686', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('d3db5d84-1bbd-4728-8f4e-9ca179e7aea9', '2023-06-16', 'Ninguna', 'per-34b877c2-1ab7-4a29-8e1c-cb73c0f1684a', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('d8aed147-18fd-42c5-bd96-bec04cdea72e', '2023-06-17', 'Ninguna', 'per-ea6d33f1-9821-4c6d-bcaa-0dbae5231686', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('d99d1a8f-a376-4940-bbec-e25da77c3415', '2023-06-29', 'Ninguna', 'per-2477b245-23f8-4067-af7d-846c6ae5de89', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('dea0312d-b75c-4933-9178-b4d9c54cec0b', '2023-08-29', 'Ninguna', 'per-863c7515-d6c9-4a68-8cbc-38e0734cf72a', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('e194f51d-3e5f-4ef0-a57f-b0053407b842', '2023-06-16', 'Ninguna', 'per-2657af89-e753-4770-8970-a13e8d88b6a2', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('e7246308-dc82-44ec-addd-b6506a8b408f', '2023-08-29', 'Ninguna', 'per-863c7515-d6c9-4a68-8cbc-38e0734cf72a', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('e945ede7-84bc-4098-aa74-8c4accae92f1', '2023-07-01', 'Ninguna', 'per-35aa37e4-4ad7-4fe7-bdd6-b95ae387d025', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('ea68c758-8501-4f55-8c80-d07152e6524c', '2023-06-25', 'Ninguna', 'per-2477b245-23f8-4067-af7d-846c6ae5de89', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('ee0e75be-cc3c-4454-98a5-243537d2fa82', '2023-05-08', 'Justificación', 'per-2af3247f-4001-41be-bf79-c787ac070435', 'req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('f33b882b-3a7e-4c8b-b257-f5286663af4a', '2023-06-24', 'Ninguna', 'per-2eeea6d6-df32-4744-8051-d54155500718', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('f875193d-6cb9-40ed-810f-ff8e2a3832f6', '2023-06-29', 'Ninguna', 'per-15d4c236-0876-4aff-8f2e-1ad56123cd29', 'req-f987e2b7-3021-4929-8752-3a5440424b3e');
INSERT INTO `requisito_apr` (`id_req_ap`, `fecha_ap`, `observacion`, `id_persona`, `id_req`) VALUES ('fa87bb96-d4c1-445a-adbc-8f9b22f1518b', '2023-06-24', 'Ninguna', 'per-45857204-ae75-4a0f-ba12-e0acb087577d', 'req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b');
INSERT INTO `requisitos` (`id_req`, `requisito`, `observacion`, `req_estado`) VALUES ('req-53bc2194-ed43-4fc0-8489-aa21cd91c8e9', 'Asistencia', 'Asistencia a sesiones de comuna', 1);
INSERT INTO `requisitos` (`id_req`, `requisito`, `observacion`, `req_estado`) VALUES ('req-6d03ae1d-35b0-4d63-a255-fa7a523b7d7b', 'Donacion', 'Compra de sillas', 1);
INSERT INTO `requisitos` (`id_req`, `requisito`, `observacion`, `req_estado`) VALUES ('req-f987e2b7-3021-4929-8752-3a5440424b3e', 'Solicitud', 'Solicitud al presidente de Comuna', 1);
INSERT INTO `rol_user` (`id_rol`, `nom_rol`, `estado_rol`) VALUES ('rol-08984849-57d9-44cc-94a5-107c7deb6589', 'Administrador', 1);
INSERT INTO `rol_user` (`id_rol`, `nom_rol`, `estado_rol`) VALUES ('rol-636a761a-c4aa-4d17-9a7d-628133cecaae', 'Secretario', 1);
INSERT INTO `tipo_documentos` (`id_tipo_doc`, `tipo_doc`, `estado_doc`, `alias`) VALUES ('17a39892-74b0-4204-9a06-e0afea5da185', 'Certificado de votación', 1, NULL);
INSERT INTO `tipo_documentos` (`id_tipo_doc`, `tipo_doc`, `estado_doc`, `alias`) VALUES ('dc6844fd-e0d0-45cb-9a53-8c6dc75ee6e8', 'Cedula', 1, NULL);
INSERT INTO `usuarios` (`id_usuario`, `id_comunero`, `id_rol`, `email`, `created_at_date`, `created_at_time`, `nom_user`, `pass_user`, `estado_user`, `img`, `signature`) VALUES ('user-966d3469-4dba-4653-b3bd-e7202a600654', 'com-9a1d1cde-e92e-4f6c-9e2d-ec34aa882e5a', 'rol-636a761a-c4aa-4d17-9a7d-628133cecaae', 'stevenrosales3@outlook.com', '2023-06-12', '13:50:46', 'JuanitoPg', '$2b$10$XslGg5rcQqZAbYGH2y7lr.WE8q0ScJwhs37W2xAmOhkUHJJ4q3Nay', 1, NULL, 'light');
INSERT INTO `usuarios` (`id_usuario`, `id_comunero`, `id_rol`, `email`, `created_at_date`, `created_at_time`, `nom_user`, `pass_user`, `estado_user`, `img`, `signature`) VALUES ('user-c5646e82-b975-4651-be31-d92e99445959', 'com-61760163-c7b0-4264-a024-1742b900f28b', 'rol-08984849-57d9-44cc-94a5-107c7deb6589', 'stevenrosales31@gmail.com', '2023-04-21', '13:32:44', 'StevenRC', '$2b$10$Vuqv.lOO4dvpVzZPHLnvxeauSdRdg2vyx5uZlUGxynH7qianPuHKO', 1, 'https://res.cloudinary.com/doh1jbd9i/image/upload/v1682468108/xroaoz57q2ola5o8wrqe.jpg', 'light');
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `comuneros` ADD CONSTRAINT `fk_rel_pers_comunero` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `comuneros` ADD CONSTRAINT `fk_rel_asociacion_comunero` FOREIGN KEY (`id_aso`) REFERENCES `asociaciones` (`id_aso`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `comuneros` ADD CONSTRAINT `fk_rel_barrio_comunero` FOREIGN KEY (`id_barrio`) REFERENCES `barrios` (`id_barrio`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `comuneros_tipos_doc` ADD CONSTRAINT `fk_comuneros_has_tipo_documentos_tipo_documentos1` FOREIGN KEY (`id_tipo_doc`) REFERENCES `tipo_documentos` (`id_tipo_doc`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `comuneros_tipos_doc` ADD CONSTRAINT `fk_comuneros_has_tipo_documentos_comuneros1` FOREIGN KEY (`id_comunero`) REFERENCES `comuneros` (`id_comunero`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `cuota_anual` ADD CONSTRAINT `fk_cuota_anual_table11` FOREIGN KEY (`id_anio`) REFERENCES `anio` (`id_anio`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `cuotas_factura` ADD CONSTRAINT `fk_facturas_has_cuota_anual_facturas1` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `cuotas_factura` ADD CONSTRAINT `fk_facturas_has_cuota_anual_cuota_anual1` FOREIGN KEY (`id_cuota`, `id_anio`) REFERENCES `cuota_anual` (`id_cuota`, `id_anio`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `egresos` ADD CONSTRAINT `fk_egresos_caja1` FOREIGN KEY (`caja_id_caja`) REFERENCES `caja` (`id_caja`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `facturas` ADD CONSTRAINT `fk_facturas_caja1` FOREIGN KEY (`caja_id_caja`) REFERENCES `caja` (`id_caja`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `facturas` ADD CONSTRAINT `fk_rel_comunero_fact` FOREIGN KEY (`id_comunero`) REFERENCES `comuneros` (`id_comunero`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `ingresos` ADD CONSTRAINT `fk_ingresos_caja1` FOREIGN KEY (`caja_id_caja`) REFERENCES `caja` (`id_caja`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `requisito_apr` ADD CONSTRAINT `fk_requisito_apr_personas1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `requisito_apr` ADD CONSTRAINT `fk_requisito_apr_requisitos1` FOREIGN KEY (`id_req`) REFERENCES `requisitos` (`id_req`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `usuarios` ADD CONSTRAINT `fk_rel_user_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol_user` (`id_rol`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `usuarios` ADD CONSTRAINT `fk_rel_comunero_usuario` FOREIGN KEY (`id_comunero`) REFERENCES `comuneros` (`id_comunero`) ON DELETE RESTRICT ON UPDATE RESTRICT;
