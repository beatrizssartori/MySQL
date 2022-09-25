/*Criando a Sys1*/

CREATE DATABASE Sys1;
USE Sys1;

CREATE TABLE Cadcli(
Codcli int auto_increment primary key not null,
Nomecli varchar(30) not null,
Endcli varchar(40) not null,
Cepcli char(9) not null,
Sexocli char(1) not null check (Sexocli IN ('F', 'M')),
Exportado tinytext check (Exportado IN ('true', 'false'))
);

INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Beatriz Souza Sartori', 'R Padre Antônio Vieira, 630',
'89201-000', 'F', 'true');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Ana Julia Alves', 'R Albano Schmidt, 2323',
'89201-001', 'F', 'true');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Anderson dos Santos', 'R Selma Doering Bruhns, 430',
'89201-002', 'M', 'false');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Ederson Targino', 'Serv Lauro Chegatti, 550',
'89201-003', 'M', 'false');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Heloisa Helena da Silva', 'R Habib Farah, 826',
'89201-203', 'F', 'true');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Luciana Gitti Lopes', 'R Cecílio Ferreira, 120',
'89201-205', 'F', 'true');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Marcos Adriano da Silva', 'R Theonesto Westrupp, 807',
'89201-110', 'M', 'false');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Maria dos Réus Viana ', 'R Inambu, 4000',
'89201-095', 'F', 'true');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Vinicius Alcântara Marafioti ', 'R Guarujá, 687',
'89201-090', 'M', 'false');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Vinícius Santos Thomazelli', 'R Ibirapuera, 477',
'89201-080', 'M', 'false');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Simone Regina Fontes', 'R Max Lepper, 56',
'89201-075', 'F', 'true');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Patricia Júlia da Silva', 'R Cidade de Sevilha, 866',
'89201-070', 'F', 'true');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Maria Clara Stacco Oliva', 'R Mozart, 80',
'89201-060', 'F', 'true');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Jussara Fagundes Rodrigues', 'R Anita Garibaldi, 2048',
'89201-050', 'F', 'true');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Ana Paula Gonçalves', 'R Doutor João Colin, 2500',
'89201-040', 'F', 'true');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Aline Cardoso', 'R Max Lepper, 56',
'89201-030', 'F', 'true');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Cristiane Lins da Silva', 'R Arara, 639',
'89201-025', 'F', 'true');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Gislene Gomes dos Santos', 'R Tubarão, 65',
'89201-020', 'F', 'true');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('José do Egito', 'R Padre Kolb, 1449',
'89201-017', 'M', 'false');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Marcos Adriano da Silva', 'R Uruguaiana, 355',
'89201-015', 'M', 'false');
INSERT INTO Cadcli (Nomecli, Endcli, Cepcli, Sexocli, Exportado) values ('Maria dos Réus Viana', 'R Ubirajara Araújo, 266',
'89201-010', 'F', 'true');

/*Criando a View agendaCli*/

CREATE VIEW agendaCli AS
SELECT c.Codcli, c.Nomecli, c.Endcli, c.Cepcli, c.Sexocli, c.Exportado, 
timestampdiff(month, '2021-07-22', current_date) as meses_cadastro
FROM Cadcli as c
WHERE c.Sexocli = 'F';

/*Criando a Sys2 a partir da integração da view*/

CREATE DATABASE Sys2;
USE Sys2;

CREATE TABLE Clicad(
Clicod int auto_increment primary key not null,
Clinome varchar(30) not null,
Cliend varchar(40) not null,
Clicep char(9) not null,
Clisexo char(1) not null check (Clisexo IN ('F', 'M')),
Exportado tinytext check (Exportado IN ('true', 'false')), 
meses_cadastro int not null
);

INSERT INTO Clicad
Select * from sys1.agendacli;