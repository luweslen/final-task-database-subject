-------------------- DATABASE CREATION | CRIAR BANCO DE DADDOS

drop schema if exists tads_database;

create schema tads_database;

use tads_database;

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- CREATION OF TABLES | CRIAÇÃO DAS TABELAS
---------- SEMESTERS | SEMESTRES
/* 
  Name: semesters
  Fields(campos):
    id int auto_increment not null primary key
    name varchar(20) not null
    start_date date not null
    concept_date date not null
    end_date date not null
*/
create table semesters(
  id int not null auto_increment primary key,
  name varchar(20) not null,
  start_date date not null,
  concept_date date not null,
  end_date date not null
);

---------- SUBJECTS | DISCIPLINAS
/* 
  Name(nome): subjects 
  Fields(campos):
    id int auto_increment not null primary key
    name varchar(50) not null
    workload int not null
    time_course int not null 
    description varchar(250) not null
*/
create table subjects(name
  id int not null auto_increment primary key,
  name varchar(50),
  workload int not null,
  time_course int not null,
  description varchar(350)
);

---------- USERS | USUÁRIOS
/*
  Name(nome): users
  Fields(campos):
    id int auto_increment not null primary key
    first_name varchar(50) not null
    last_name varchar(50) not null
    email varchar(50)
    phone varchar(50)
    type varchar(50) not null
*/
create table users(
  id int not null auto_increment primary key,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  email varchar(50),
  phone varchar(50),
  type varchar(50) not null
);

---------- CLASSES | TURMAS
/*
  Name(nome): classes
  Fields(campos):
    id int auto_increment not null primary key
    slug varchar(20) not null
    name varchar(30) not null
    description varchar(250) not null
    start_date date not null
*/
create table classes(
  id int not null auto_increment primary key,
  slug varchar(20) not null,
  name varchar(30) not null,
  description varchar(250) not null,
  start_date date not null
);

---------- STUDENTS | ESTUDANTES
/*
  Name(nome): students
  Fields(campos): 
    id int auto_increment not null primary key
    registration varchar(30) not null
    institutional_email varchar(50)
    is_active boolean not null
    is_representative boolean not null,
    class_id int not null
    user_id int not null foreign key
*/
create table students(
  id int not null auto_increment primary key,
  registration varchar(30) not null,
  institutional_email varchar(30),
  is_active boolean not null,
  is_representative boolean not null,
  class_id int not null,
  user_id int not null,
  foreign key(class_id) references classes(id),
  foreign key(user_id) references users(id)
);

---------- PROFESSORS | PROFESSORES
/*
  Name(nome): professors
  Fields(campos):
    id int auto_increment not null primary key
    institutional_email varchar(50)
    graduate_area varchar(50)
    search_areas varchar(50) 
    user_id int not null foreign key
*/
create table professors(
  id int not null auto_increment primary key,
  institutional_email varchar(30),
  graduate_area varchar(50),
  search_areas varchar(150),
  user_id int not null,
  foreign key(user_id) references users(id)
);

---------- SCHEDULES | HORÁRIOS
/*
  Name(nome): schedules
  Fields(campos):
    id int auto_increment not null primary key
    class_id int not null foreign key
    subject_id int not null foreign key
    professor_id int not null foreign key
    semester_id int not null foreign key
    weekday varchar(10) not null
    start_time varchar(5) not null
    end_time varchar(5) not null
*/
create table schedules(
  id int not null auto_increment primary key,
  weekday varchar(10) not null,
  start_time varchar(5) not null,
  end_time varchar(5) not null,
  class_id int not null,
  subject_id int not null,
  professor_id int not null,
  semester_id int not null,
  foreign key(class_id) references classes(id),
  foreign key(subject_id) references subjects(id),
  foreign key(professor_id) references professors(id),
  foreign key(semester_id) references semesters(id)
);

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- INSERT DATA IN THE TABLES | INSERIR DADOS NAS TABELAS
---------- SEMESTERS | SEMESTRES
insert into semesters(name, start_date, concept_date, end_date) values 
    ("2021.2", "2022-01-18", "2021-04-26", "2021-05-12"),
    ("2021.1", "2021-08-12", "2021-12-09", "2021-12-17"),
    ("2020.2", "2021-04-07", "2021-08-12", "2021-08-12"),
    ("2020.1", "2020-10-30", "2021-04-07", "2021-04-07"),
    ("2019.2", "2019-07-12", "2019-12-03", "2019-12-13"),
    ("2019.1", "2019-02-14", "2019-06-04", "2019-06-14"),
    ("2018.2", "2018-07-15", "2018-12-05", "2018-12-15"),
    ("2018.1", "2018-02-16", "2018-06-06", "2018-06-16"),
    ("2017.2", "2017-07-17", "2017-12-07", "2017-12-17"),
    ("2017.1", "2017-02-18", "2017-06-08", "2017-06-18");

---------- SUBJECTS | DISCIPLINAS
insert into subjects(name, workload, time_course, description) values 
    ("Lógica de Programação", 60, 1, "Ensino e aprendizagem do “pensar” algorítmico e sistêmico fundamental para a  modelagem  e  desenvolvimento  de  soluções  computacionais"),
    ("Informática Instrumental", 45, 1, "Conceitos básicos de sistemas operacionais. Operação de diferentes sistemas  operacionais  com  interface  gráfica.  Softwares  básicos:  editores  de  texto, planilhas  eletrônicas,  e  gerenciadores  de  apresentações.  Conceitos  básicos de Internet e gerenciador de correio eletrônico"),
    ("Fundamentos da Computação", 60, 1, "Estrutura e funcionamento de computadores. História da Computação. Sistemas numéricos. Introdução aos sistemas operacionais. Software e Hardware. Operações numéricas."),
    ("Laboratório de Computação I", 60, 1, "O que é programação?; Por que estudar programação?; Histórico da programação;  Paradigmas  da  programação,  não  estruturada,  estruturada, orientada  a  objetos,  funcional  e  lógica;"),
    ("Fundamentos Matemáticos para Computação", 60, 1, "Lógica para computação. Cálculo Proposicional e de Primeira Ordem. Álgebra Booleana. Análise combinatória. Estatística descritiva. Amostragem. Probabilidade. "),
    ("Comunicação e Expressão", 45, 1, "Norma-padrão para a produção de textos técnicos e acadêmicos. Normativas de produção. Leitura crítica de textos. Retórica e oralidade."),
    ("Fundamentos de Orientação a Objetos", 60, 2, "Paradigma Orientado a Objetos. Princípios da Orientação a Objetos: Abstração, Classe,  Objeto,  Instância, Método,  Atributo,  Encapsulamento, Ocultamento de Informação, Herança e Polimorfismo (sobrecarga e sobrescrita), "),
    ("Engenharia de Software", 60, 2, "A engenharia de software. O processo e os modelos de processo de software. Atividades Técnicas. Atividades de Apoio/Gerenciais. Engenharia de requisitos. Modelagem (Análise e Projeto do Software)."),
    ("Linguagem  de  Programação  Orientada  a Objetos", 60, 3, "O Paradigma Orientado a Objetos; Características específicas de linguagens de  programação  orientadas  a  objetos;  Classes,  objetos,  abstração;  Tipos primitivos,  variáveis,  declaração  e  atribuição;"),
    ("Projeto  e  Implementação  de  Bancos  de Dados", 60, 3, "Projeto de Banco de Banco. Transformação Modelo Lógico  – Modelo Físico. Regras  Integridade.  Chaves.  Linguagem  SQL.  Comandos  DDL,  Comandos DML. Ambientes de Desenvolvimento.");

---------- USERS | USUÁRIOS
insert into users(first_name, last_name, email, phone, type) values 
    ("Adriana",   "Carniello",              null, null, "PROFESSOR"),
    ("Andreia",   "Carniello",              null, null, "PROFESSOR"),
    ("Augusto",   "Luengo Pereira Nunes",   null, null, "PROFESSOR"),
    ("Diogo",     "Roberto Olsen",          null, null, "PROFESSOR"),
    ("Fernando",  "Accorsi",                null, null, "PROFESSOR"),
    ("Flávio",    "Navarro Fernandes",      null, null, "PROFESSOR"),
    ("Luciana",   "M. Vieira Pöttker",      null, null, "PROFESSOR"),
    ("Marlene",   "A. Ferrarini Bigareli",  null, null, "PROFESSOR"),
    ("Angela ",   "Meneghelo Passos",       null, null, "PROFESSOR"),
    ("Serafina",  "Ferreira Machado",       null, null, "PROFESSOR"),
    ("Anaclea",   "Celeste Ribeiro",        "anaclea_ribeiro@email.com",    "5543912345679", "STUDENT"),
    ("Riandro",   "da Silva Proença",       "riandro_proença@email.com",    "5543915245213", "STUDENT"),
    ("Douglas",   "Duarte Medeiros",        "douglas_medeiros@email.com",   "5543912482132", "STUDENT"),
    ("Bruno",     "Fernandes Polli",        "bruno_polli@email.com",        "5543911321321", "STUDENT"),
    ("Danilo",    "Guimarães de Oliveira",  "danilo_oliveira@email.com",    "5543981532233", "STUDENT"),
    ("Carlos",    "Henrique de Souza",      "carlos_souza@email.com",       "5543915121023", "STUDENT"),
    ("Guilherme", "Henrique Rosa Pereira",  "guilherme_pereira@email.com",  "5543988655296", "STUDENT"),
    ("Felipe",    "Luiz Borges de Lima",    "felipe_lima@email.com",        "5543985153201", "STUDENT"),
    ("Mateus",    "Macial Ferreira",        "mateus_ferreira@email.com",    "5543985184454", "STUDENT"),
    ("Luciano",   "Weslen da Silva",        "luciano_weslen@email.com",     "5543987405184", "STUDENT");

---------- CLASSES | TURMAS
insert into classes(slug, name, description, start_date) values 
    ("tads-2021", "Turma 2021", "Está é a turma 2021 do curso de Tecnologia em Analise e Desenvolvimento de Sistemas", "2021-08-12"),
    ("tads-2020", "Turma 2020", "Está é a turma 2020 do curso de Tecnologia em Analise e Desenvolvimento de Sistemas", "2020-02-01"),
    ("tads-2019", "Turma 2019", "Está é a turma 2019 do curso de Tecnologia em Analise e Desenvolvimento de Sistemas", "2019-02-01"),
    ("tads-2018", "Turma 2018", "Está é a turma 2018 do curso de Tecnologia em Analise e Desenvolvimento de Sistemas", "2018-02-01"),
    ("tads-2017", "Turma 2017", "Está é a turma 2017 do curso de Tecnologia em Analise e Desenvolvimento de Sistemas", "2017-02-01"),
    ("tads-2016", "Turma 2016", "Está é a turma 2016 do curso de Tecnologia em Analise e Desenvolvimento de Sistemas", "2016-02-01"),
    ("tads-2015", "Turma 2015", "Está é a turma 2015 do curso de Tecnologia em Analise e Desenvolvimento de Sistemas", "2015-02-01"),
    ("tads-2014", "Turma 2014", "Está é a turma 2014 do curso de Tecnologia em Analise e Desenvolvimento de Sistemas", "2014-02-01"),
    ("tads-2013", "Turma 2013", "Está é a turma 2013 do curso de Tecnologia em Analise e Desenvolvimento de Sistemas", "2013-02-01"),
    ("tads-2012", "Turma 2012", "Está é a turma 2012 do curso de Tecnologia em Analise e Desenvolvimento de Sistemas", "2012-02-01");

---------- STUDENTS | ESTUDANTES
insert into students(registration, institutional_email, is_active, is_representative, class_id, user_id) values 
    ("20200000001", "20200000001@alunos.ifpr.edu.br", true, false, 2, 11),
    ("20200000002", "20200000002@alunos.ifpr.edu.br", true, true, 2, 12),
    ("20200000003", "20200000003@alunos.ifpr.edu.br", true, false, 2, 13),
    ("20200000004", "20200000004@alunos.ifpr.edu.br", true, false, 2, 14),
    ("20200000005", "20200000005@alunos.ifpr.edu.br", true, false, 2, 15),
    ("20200000006", "20200000006@alunos.ifpr.edu.br", true, false, 2, 16),
    ("20200000007", "20200000007@alunos.ifpr.edu.br", true, false, 2, 17),
    ("20200000008", "20200000008@alunos.ifpr.edu.br", false, false, 2, 18),
    ("20200000009", "20200000009@alunos.ifpr.edu.br", true, false, 2, 19),
    ("20200000010", "20200000010@alunos.ifpr.edu.br", true, true, 2, 20);

---------- PROFESSORS | PROFESSORES
insert into professors(institutional_email, graduate_area, search_areas, user_id) values 
    ("adriana.carniello@ifpr.edu.br", "Ciência da Computação", "Engenharia de Software", 1),
    ("andreia.carniello@ifpr.edu.br", "Ciência da Computação", "Engenharia de Software", 2),
    ("augusto.nunes@ifpr.edu.br", "Ciência da Computação", "Computação gráfica", 3),
    ("diogo.olsen@ifpr.edu.br", "Ciência da Computação", not null, 4),
    ("fernando.accorsi@ifpr.edu.br", "Ciência da Computação", "Interface Humano Computador", 5),
    ("flávio.fernandes@ifpr.edu.br", "Ciência da Computação", "Aplicativos mobiles", 6),
    ("luciana.pottker@ifpr.edu.br", "Ciência da Computação", not null, 7),
    ("marlene.bigareli@ifpr.edu.br", "Letras", not null, 8),
    ("angela.passos@ifpr.edu.br", "Matemática", not null, 9),
    ("serafina.machado@ifpr.edu.br", "Letras", not null, 10);

---------- SCHEDULES | HORÁRIOS
insert into schedules(class_id, subject_id, professor_id, semester_id, weekday, start_time, end_time) values 
    (2,  1,  4, 4, "Monday", "08:15", "09:00"),
    (2,  2,  2, 4, "Tuesday", "10:50", "11:35"),
    (2,  3,  3, 4, "Wednesday", "09:00", "09:40"),
    (2,  4,  5, 4, "Thursday", "08:15", "09:00"),
    (2,  5,  9, 4, "Friday", "10:50", "11:35"),
    (2,  6, 10, 4, "Monday", "09:00", "09:40"),
    (2,  7,  6, 3, "Friday", "10:50", "11:35"),
    (2,  8,  1, 3, "Wednesday", "08:15", "09:00"),
    (2,  9,  6, 2, "Thursday", "09:00", "09:45"),
    (2, 10,  7, 2, "wednesday", "09:00", "09:45");

/*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>*/

-------------------- QUERIES IN THE TABLES | CONSULTAS NAS TABELAS

---------- ALL DATA
-- select * from semesters;
-- select * from subjects;
-- select * from users;
-- select * from classes;
-- select * from students;
-- select * from professors;
-- select * from schedules;

---------- QUERY 1 | CONSULTA 1
-- Selecionar todos os semestre que inicia no dia 12.
-- Select all semesters starting on the 12th.

-- select * 
--   from semesters 
--   where day(semesters.start_date) = 12;

---------- QUERY 2 | CONSULTA 2
-- Selecionar todas as materias do primeiro ou segundo periodo.
-- Select all subjects from the first or second period.

-- select * 
--   from subjects 
--   where (time_course = 1) or (time_course = 2);

---------- QUERY 3 | CONSULTA 3
-- Selecionar o primeiro nome e email insticional de todos os alunos.
-- Select the first name and institutional email of all students.

-- select users.first_name, students.institutional_email 
--   from users, students 
--   where (users.id = students.user_id);

---------- QUERY 4 | CONSULTA 4
-- Selecionar o primeiro nome e área de graduação de todos os professores.
-- Select the first name and graduation area of all professors.

-- select users.first_name, professors.graduate_area 
--   from users, professors 
--   where (users.id = professors.user_id);

---------- QUERY 5 | CONSULTA 5
-- Selecionar o nome completo dos professores que são são graduados em letras.
-- Select the full name of teachers who are graduated in "Letras".

-- select concat(users.first_name, " ", users.last_name) as "Nome completo"
--   from users, professors 
--   where (users.id = professors.user_id) 
--     and (lower(professors.graduate_area) = lower("letras"));

---------- QUERY 6 | CONSULTA 6
-- Selecionar o nome das disciplinas do semestre com nome 2020.1 que começam ás 9hrs da manhã.
-- Select the name of the semester's subjects named 2020.1 that start at 9am.

-- select subjects.name
--   from schedules, semesters, subjects 
--   where (schedules.subject_id = subjects.id) 
--     and (schedules.semester_id = semesters.id) 
--     and (semesters.name = "2020.1")
--     and (schedules.start_time like "09%");

---------- QUERY 7 | CONSULTA 7
-- Selecionar o nome completo e matricula dos estudantes da turma com slug tads-2020. Ordenar por ordem decrescente do primeiro nome.
-- Select the full name and registration of students in the class with slug "tads-2020". Sort in descending order of first name.

-- select concat(users.first_name, " ", users.last_name) as "Nome completo", students.registration as "Matricula"
--   from users, students, classes 
--   where (users.id = students.user_id) 
--     and (classes.id = students.class_id) 
--     and (classes.slug = "tads-2020")
--   order by users.first_name desc;

---------- QUERY 8 | CONSULTA 8
-- Selecionar o nome das disciplinas, dia da semana da aula e data de inicio de semestre em que o semestre começa no ano 2021. Ordenar em ordem crescente pela data de inicio do semestre.
-- Select the name of the subjects, day of the week of class schedules and start date of the semester in which the semester starts in the year 2021. Sort in ascending order by the start date of the semester.

-- select subjects.name, semesters.start_date, schedules.weekday
--   from schedules, semesters, subjects 
--   where (schedules.subject_id = subjects.id) 
--     and (schedules.semester_id = semesters.id) 
--     and (year(semesters.start_date) = 2021)
--   order by semesters.start_date;

---------- QUERY 9 | CONSULTA 9
-- Selecionar o primeiro nome e matricula dos alunos ativos. Ordenar por ordem decrescente da matricula.
-- Select the first name and registration of active students. Sort in descending order of registration.

-- select users.first_name, students.registration
--   from users, students
--   where (students.user_id = users.id)
--     and (students.is_active = true)
--   order by students.registration desc;

---------- QUERY 10 | CONSULTA 10
-- Selecionar o nome da disciplina, horário de ínicio e horário de término dos horários de segunda-feira. Ordenar por ordem crescente do nome da disciplina.
-- Select the subject name, start time and end time from Monday's schedules. Sort in ascending order of the subject name.

-- select subjects.name, schedules.start_time, schedules.end_time
--   from subjects, schedules
--   where (subjects.id = schedules.subject_id)
--     and (lower(schedules.weekday) = lower("monday"))
--   order by subjects.name;

---------- QUERY 11 | CONSULTA 11
-- Selecionar o nome completo dos professores que começam com letra A. Ordenar por ordem crescente do primeiro nome.
-- Select the full name of teachers starting with letter A. Sort in ascending order of the first name.

-- select concat(users.first_name, " ", users.last_name) as "Nome completo"
--   from users, professors
--   where (professors.user_id = users.id)
--     and (users.first_name like "A%")
--   order by users.first_name;

---------- QUERY 12 | CONSULTA 12
-- Selecionar o nome e data de ínicio de todos os semestre queainda vão começar.
-- Select the name and start date of all semesters that are yet to begin.

-- select semesters.name, semesters.start_date
--   from semesters
--   where (semesters.start_date <= now());

---------- QUERY 13 | CONSULTA 13
-- Selecionar o nome das disciplinas que possuem a palavra "Programação" no nome.
-- Select the name of the courses that have the word "Programação" in the name.

-- select subjects.name
--   from subjects 
--   where (subjects.name like "%Programação%");

---------- QUERY 14 | CONSULTA 14
-- Selecionar o primeiro nome dos usuários com email e telefone nulos. Ordenar por ordem crescente do primeiro nome.
-- Select the first name of users with null email and null phone. Sort in ascending order of first name.

-- select users.first_name
--   from users 
--   where (users.email is null)
--     and (users.phone is null)
--   order by users.first_name;

---------- QUERY 15 | CONSULTA 15
-- Selecionar o nome das disciplinas do segundo semestre.
-- Select the name of the disciplines for the second semester.

-- select subjects.name
--   from subjects 
--   where (subjects.time_course = 2);