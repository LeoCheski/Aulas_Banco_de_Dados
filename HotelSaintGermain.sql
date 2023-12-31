CREATE DATABASE HotelSaintGermain;
	USE HotelSaintGermain;
    
		CREATE TABLE Cliente 
			(IdCliente INT PRIMARY KEY,
			Nome VARCHAR(100),
			Sexo CHAR(1),
            Cpf VARCHAR(11),
            Cep VARCHAR (10),
            Cidade VARCHAR (50),
			DtaNasc DATETIME NOT NULL);
            
		CREATE TABLE ClienteEstrangeiro
            (idCliente INT PRIMARY KEY,
            Passaporte VARCHAR(50),
            FOREIGN KEY (idCliente)
               REFERENCES Cliente(IdCliente));
               
		CREATE TABLE Quarto
			(IdNroQuarto INT PRIMARY KEY,
			Andar VARCHAR(20),
            Tipo VARCHAR(20),
            Descrição VARCHAR(200),
            ValorDiaria DECIMAL(10,2));
            
	     CREATE TABLE Reserva 
			(IdNroReserva INT PRIMARY KEY,
            IdCliente INT,
            IdNroQuarto INT,
			FOREIGN KEY (IdCliente)
              REFERENCES Cliente(IdCliente),
			FOREIGN KEY(IdNroQuarto)
              REFERENCES Quarto(IdNroQuarto),
			DataHora DATETIME NOT NULL,
			Periodo TINYINT NOT NULL);
            
		 CREATE TABLE Aprovação
         (IdNroReserva INT,
         IdMatriculaGerente INT,
		 PRIMARY KEY (IdNroReserva),
         FOREIGN KEY (IdNroReserva)
		   REFERENCES Reserva(IdNroReserva),
		FOREIGN KEY (IdMatriculaGerente)
           REFERENCES Gerente(IdMatriculaGerente));
           
		CREATE TABLE Gerente
        (IdMatriculaGerente INT PRIMARY KEY,
        Nome VARCHAR(100));
        
		CREATE TABLE Ocupacao
			(IdNroReserva INT PRIMARY KEY,
			Entrada DATETIME,
			Saida DATETIME,
			FOREIGN KEY (IdNroReserva)
			  REFERENCES Reserva(IdNroReserva));
              
		CREATE TABLE Restaurante 
			(IdRestaurante INT PRIMARY KEY,
			Prato VARCHAR(50), Preco DECIMAL(5,2));
            
		CREATE TABLE OcupacaoRestaurante (
            IdNroReserva INT,
            IdRestaurante INT,
            DataHora DATETIME,
            Quantidade TINYINT,
            PRIMARY KEY (IdNroReserva, IdRestaurante, DataHora),
            FOREIGN KEY (IdNroReserva)
              REFERENCES Ocupacao(IdNroReserva),
            FOREIGN KEY (IdRestaurante)
              REFERENCES Restaurante(IdRestaurante));
              
		CREATE TABLE Frigobar
			(IdFrigobar INT PRIMARY KEY,
			Item VARCHAR(50), Preco DECIMAL(5,2));
            
		CREATE TABLE OcupacaoFrigobar (
            IdNroReserva INT,
            IdFrigobar INT,
            DataHora DATETIME,
            Quantidade TINYINT,
            PRIMARY KEY (IdNroReserva, IdFrigobar, DataHora),
            FOREIGN KEY (IdNroReserva)
              REFERENCES Reserva(IdNroReserva),
            FOREIGN KEY (IdFrigobar)
              REFERENCES Frigobar(IdFrigobar));
              
	    CREATE TABLE Massagem
			(IdMassagem INT PRIMARY KEY,
			Tipo VARCHAR(50), Preco DECIMAL(5,2));
		CREATE TABLE OcupacaoMassagem (
            IdNroReserva INT,
            IdMassagem INT,
            DataHora DATETIME,
            Produtos TINYINT,
            PRIMARY KEY (IdNroReserva, IdMassagem, DataHora),
            FOREIGN KEY (IdNroReserva)
              REFERENCES Reserva(IdNroReserva),
            FOREIGN KEY (IdMassagem)
              REFERENCES Massagem(IdMassagem));
              
		CREATE TABLE Pagamento
           (IdTipoPagamento INT PRIMARY KEY,
           Descrição VARCHAR(200));
           
         CREATE TABLE PagamentoOcupacao (
            IdNroReserva INT,
            IdTipoPagamento INT,
            DataHora DATETIME,
            ValorTotal DECIMAL(5,2),
            PRIMARY KEY (IdNroReserva, IdTipoPagamento, DataHora, ValorTotal),
            FOREIGN KEY (IdNroReserva)
              REFERENCES Reserva(IdNroReserva),
            FOREIGN KEY (IdTipoPagamento)
              REFERENCES Pagamento(IdTipoPagamento));