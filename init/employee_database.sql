CREATE TABLE FUNCIONARIO
( Primeiro_nome           VARCHAR(10)   NOT NULL,
  Nome_meio           CHAR,
  Ultimo_nome           VARCHAR(20)      NOT NULL,
  Cpf             CHAR(9)          NOT NULL,
  Data_nascimento           DATE,
  Endereco         VARCHAR(30),
  Sexo             CHAR(1),
  Salario          DECIMAL(5),
  Cpf_supervisor       CHAR(9),
  Numero_departamento             INT               NOT NULL,
PRIMARY KEY   (Cpf));

CREATE TABLE DEPARTAMENTO
( Nome_departamento           VARCHAR(15)       NOT NULL,
  Numero_departamento         INT               NOT NULL,
  Cpf_gerente         CHAR(9)           NOT NULL,
  Data_inicio_gerente  DATE,
PRIMARY KEY (Numero_departamento),
UNIQUE      (Nome_departamento),
FOREIGN KEY (Cpf_gerente) REFERENCES FUNCIONARIO(Cpf) );

CREATE TABLE LOCALIZACOES_DEPARTAMENTO
( Numero_departamento         INT               NOT NULL,
  Local       VARCHAR(15)       NOT NULL,
PRIMARY KEY (Numero_departamento, Local),
FOREIGN KEY (Numero_departamento) REFERENCES DEPARTAMENTO(Numero_departamento) );

CREATE TABLE PROJETO
( Nome_projeto           VARCHAR(15)       NOT NULL,
  Numero_projeto         INT               NOT NULL,
  Local_projeto       VARCHAR(15),
  Numero_departamento            INT               NOT NULL,
PRIMARY KEY (Numero_projeto),
UNIQUE      (Nome_projeto),
FOREIGN KEY (Numero_departamento) REFERENCES DEPARTAMENTO(Numero_departamento) );

CREATE TABLE TRABALHA_EM
( Cpf_funcionario            CHAR(9)           NOT NULL,
  Numero_projeto             INT               NOT NULL,
  Horas           DECIMAL(3,1)      NOT NULL,
PRIMARY KEY (Cpf_funcionario, Numero_projeto),
FOREIGN KEY (Cpf_funcionario) REFERENCES FUNCIONARIO(Cpf),
FOREIGN KEY (Numero_projeto) REFERENCES PROJETO(Numero_projeto) );

CREATE TABLE DEPENDENTE
( Cpf_funcionario            CHAR(9)           NOT NULL,
  Nome_dependente  VARCHAR(15)       NOT NULL,
  Sexo             CHAR,
  Data_nascimento           DATE,
  Parentesco    VARCHAR(8),
PRIMARY KEY (Cpf_funcionario, Nome_dependente),
FOREIGN KEY (Cpf_funcionario) REFERENCES FUNCIONARIO(Cpf) );

INSERT INTO FUNCIONARIO
VALUES      ('John','B','Smith',123456789,'1965-01-09','731 Fondren, Houston TX','M',30000,333445555,5),
            ('Franklin','T','Wong',333445555,'1965-12-08','638 Voss, Houston TX','M',40000,888665555,5),
            ('Alicia','J','Zelaya',999887777,'1968-01-19','3321 Castle, Spring TX','F',25000,987654321,4),
            ('Jennifer','S','Wallace',987654321,'1941-06-20','291 Berry, Bellaire TX','F',43000,888665555,4),
            ('Ramesh','K','Narayan',666884444,'1962-09-15','975 Fire Oak, Humble TX','M',38000,333445555,5),
            ('Joyce','A','English',453453453,'1972-07-31','5631 Rice, Houston TX','F',25000,333445555,5),
            ('Ahmad','V','Jabbar',987987987,'1969-03-29','980 Dallas, Houston TX','M',25000,987654321,4),
            ('James','E','Borg',888665555,'1937-11-10','450 Stone, Houston TX','M',55000,null,1);

INSERT INTO DEPARTAMENTO
VALUES      ('Research',5,333445555,'1988-05-22'),
            ('Administration',4,987654321,'1995-01-01'),
            ('Headquarters',1,888665555,'1981-06-19');

INSERT INTO PROJETO
VALUES      ('ProductX',1,'Bellaire',5),
            ('ProductY',2,'Sugarland',5),
            ('ProductZ',3,'Houston',5),
            ('Computerization',10,'Stafford',4),
            ('Reorganization',20,'Houston',1),
            ('Newbenefits',30,'Stafford',4);

INSERT INTO TRABALHA_EM
VALUES     (123456789,1,32.5),
           (123456789,2,7.5),
           (666884444,3,40.0),
           (453453453,1,20.0),
           (453453453,2,20.0),
           (333445555,2,10.0),
           (333445555,3,10.0),
           (333445555,10,10.0),
           (333445555,20,10.0),
           (999887777,30,30.0),
           (999887777,10,10.0),
           (987987987,10,35.0),
           (987987987,30,5.0),
           (987654321,30,20.0),
           (987654321,20,15.0),
           (888665555,20,16.0);

INSERT INTO DEPENDENTE
VALUES      (333445555,'Alice','F','1986-04-04','Daughter'),
            (333445555,'Theodore','M','1983-10-25','Son'),
            (333445555,'Joy','F','1958-05-03','Spouse'),
            (987654321,'Abner','M','1942-02-28','Spouse'),
            (123456789,'Michael','M','1988-01-04','Son'),
            (123456789,'Alice','F','1988-12-30','Daughter'),
            (123456789,'Elizabeth','F','1967-05-05','Spouse');

INSERT INTO LOCALIZACOES_DEPARTAMENTO
VALUES      (1,'Houston'),
            (4,'Stafford'),
            (5,'Bellaire'),
            (5,'Sugarland'),
            (5,'Houston');

ALTER TABLE DEPARTAMENTO
 ADD CONSTRAINT Dep_emp FOREIGN KEY (Cpf_gerente) REFERENCES FUNCIONARIO(Cpf);

ALTER TABLE FUNCIONARIO
 ADD CONSTRAINT Emp_super FOREIGN KEY  (Cpf_supervisor) REFERENCES FUNCIONARIO(Cpf);
 
ALTER TABLE FUNCIONARIO
 ADD CONSTRAINT Emp_dno FOREIGN KEY  (Numero_departamento) REFERENCES DEPARTAMENTO(Numero_departamento);
 