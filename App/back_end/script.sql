CREATE TABLE Jogador(
	jog_id INTEGER NOT NULL,
    jog_nome VARCHAR(50) NOT NULL,
    jog_experiencia INTEGER NOT NULL,
    jog_nivel INTEGER NOT NULL,
    jog_email VARCHAR(50) NOT NULL,
    jog_senha VARCHAR(50) NOT NULL,
    PRIMARY KEY (jog_id)
);

CREATE TABLE ListaJogadores(
	jog_id INTEGER NOT NULL,
    jog_nome VARCHAR(50) NOT NULL,
    jog_email VARCHAR(50) NOT NULL,
    lis_origem VARCHAR(50) NOT NULL,
    lis_idade VARCHAR(50) NOT NULL,
    FOREIGN KEY (jog_id) REFERENCES Jogador(jog_id)
);

CREATE TABLE Ingrediente(
	ing_id INTEGER NOT NULL,
    ing_nome VARCHAR(25) NOT NULL,
    ing_descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY (ing_id)
);

CREATE TABLE ListaIngredientes(
	ing_id INTEGER NOT NULL,
    lis_ing_nome VARCHAR(25) NOT NULL,
    lis_ing_descricao VARCHAR(100) NOT NULL,
    FOREIGN KEY (ing_id) REFERENCES Ingrediente(ing_id)
);

CREATE TABLE Receita(
	rec_id INTEGER NOT NULL,
    rec_nome VARCHAR(25) NOT NULL,
    rec_dificuldade VARCHAR(10) NOT NULL,
    rec_recompensa VARCHAR(100) NOT NULL,
    PRIMARY KEY (rec_id)
);

CREATE TABLE Preparo(
	rec_id INTEGER NOT NULL,
    pre_id INTEGER NOT NULL,
    pre_descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY (pre_id),
    FOREIGN KEY (rec_id) REFERENCES Receita(rec_id)
);

DELIMITER $$
CREATE PROCEDURE InserirJogador(id INT, nome VARCHAR(50), experiencia INTEGER, nivel INTEGER, email VARCHAR(50),
    senha VARCHAR(50))
	BEGIN
    INSERT INTO Jogador VALUES(id, nome, experiencia, nivel, email, senha);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE InserirListaJogadores(id INTEGER, nome VARCHAR(50), email VARCHAR(50), origem VARCHAR(50),
    idade VARCHAR(50))
	BEGIN
    INSERT INTO ListaJogadores VALUES(id, nome, email, origem, idade);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE InserirIngrediente(id INTEGER, nome VARCHAR(25), descricao VARCHAR(100))
	BEGIN
    INSERT INTO Ingrediente VALUES(id, nome, descricao);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE InserirListaIngredientes(id INTEGER, nome VARCHAR(25), descricao VARCHAR(100))
	BEGIN
    INSERT INTO ListaIngredientes VALUES(id, nome, descricao);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE InserirReceita(id INTEGER, nome VARCHAR(25), dificuldade VARCHAR(10), recompensa VARCHAR(100))
	BEGIN
    INSERT INTO Receita VALUES(id, nome, dificuldade, recompensa);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE InserirPreparo(id INTEGER, pre_id INTEGER, descricao VARCHAR(100))
	BEGIN
    INSERT INTO Preparo VALUES(id, pre_id, descricao);
END $$
DELIMITER ;