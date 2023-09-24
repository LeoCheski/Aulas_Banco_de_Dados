USE HotelSaintGermain;

	INSERT INTO cliente
		(IdCliente, Nome, Sexo, CPF, CIDADE, CEP, DtaNasc)
		VALUES
		(1, 'Evandro Zatti', 'M', 123456789 , 'Curitiba' , 8115070, '1976-01-22');
    
	INSERT INTO cliente
		(IdCliente, Nome, Sexo, CPF, CIDADE, CEP, DtaNasc)
		VALUES
		(2, 'Matheus Mello', 'M', 000000000 , 'Curitiba' , 8115080, '2002-02-27');
    
	INSERT INTO cliente
		(IdCliente, Nome, Sexo, CPF, CIDADE, CEP, DtaNasc)
		VALUES
		(3, 'Gabriela Aires', 'F', 987654321 , 'Rio de Janeiro' , 8115000, '2004-10-11');
    
	INSERT INTO cliente
		(IdCliente, Nome, Sexo, CPF, CIDADE, CEP, DtaNasc)
		VALUES
		(4, 'Hiaga Mayer', 'F', 658748921 , 'Lapa' , 8110578, '2005-07-13');
    
	INSERT INTO cliente
		(IdCliente, Nome, Sexo, CPF, CIDADE, CEP, DtaNasc)
		VALUES
		(5, 'Rafael Pelado', 'M', 6587487987 , 'São José' , 7845896 , '2010-03-01');
    
    INSERT INTO ClienteEstrangeiro
		(IdCliente,Passaporte)
		VALUES
		('1','123456789');
    
	INSERT INTO ClienteEstrangeiro
		(IdCliente,Passaporte)
		VALUES
		('2','147258369');
    
	INSERT INTO ClienteEstrangeiro
		(IdCliente,Passaporte)
		VALUES
		('3','321654987');
    
	INSERT INTO ClienteEstrangeiro
		(IdCliente,Passaporte)
		VALUES
		('4','852147963');
    
	INSERT INTO ClienteEstrangeiro
		(IdCliente,Passaporte)
		VALUES
		('5','369857412');
    
	SELECT IdCliente,Passaporte FROM ClienteEstrangeiro;
    
    INSERT INTO Quarto
		(IdNroQuarto, Andar, Tipo, Descrição, ValorDiaria)
		VALUES
		(10, 5, 'luxo', 'Quarto amplo e confortável com vista para o jardim', 500);

	INSERT INTO Reserva
		(IdCliente,IdNroReserva, IdNroQuarto, DataHora, Periodo)
		VALUES
		(1, 1, 10, '2023-09-25 12:00:00', 3);
    
	INSERT INTO Quarto
		(IdNroQuarto, Andar, Tipo, Descrição, ValorDiaria)
		VALUES
		(20, 6, 'casal', 'Quarto com cama de casal e suíte', 300);

	INSERT INTO Reserva
		(IdCliente,IdNroReserva, IdNroQuarto, DataHora, Periodo)
		VALUES
		(2, 2, 20, '2023-08-22 14:00:00', 2);
    
    INSERT INTO Quarto
		(IdNroQuarto, Andar, Tipo, Descrição, ValorDiaria)
		VALUES
		(30, 2, 'comum', 'Quarto com cama de solteiro para uma pessoa', 100);

	INSERT INTO Reserva
		(IdCliente,IdNroReserva, IdNroQuarto, DataHora, Periodo)
		VALUES
		(3, 3, 30, '2023-05-10 10:00:00', 10);
    
    INSERT INTO Quarto
		(IdNroQuarto, Andar, Tipo, Descrição, ValorDiaria)
		VALUES
		(40, 3, 'casal', 'Quarto com cama de casal e hidromassagem', 400);

	INSERT INTO Reserva
		(IdCliente,IdNroReserva, IdNroQuarto, DataHora, Periodo)
		VALUES
		(4, 4, 10, '2023-04-25 09:00:00', 5);
    
    INSERT INTO Quarto
		(IdNroQuarto, Andar, Tipo, Descrição, ValorDiaria)
		VALUES
		(50, 5, 'luxo', 'Quarto amplo e confortável com vista para o mar', 550);

	INSERT INTO Reserva
		(IdCliente,IdNroReserva, IdNroQuarto, DataHora, Periodo)
		VALUES
		(5, 5, 30, '2023-09-25 07:00:00', 10);
		
    INSERT INTO Gerente
		(IdMatriculaGerente, Nome)
		VALUES
		(100, 'João Silva');
    
   INSERT INTO Aprovação
		(IdNroReserva, IdMatriculaGerente)
		VALUES
		(1, 100);
    
	INSERT INTO Ocupacao
		(IdNroReserva, Entrada, Saida)
		VALUES
		(1, '2023-09-25 14:00:00', '2023-09-26 12:00:00');
        
	INSERT INTO Ocupacao
		(IdNroReserva, Entrada, Saida)
		VALUES
		(2, '2023-08-22 14:00:00', '2023-08-23 12:00:00');    

    INSERT INTO Restaurante
		(IdRestaurante, Prato, Preco)
		VALUES
		(1, 'Feijoada', 25);
    
    INSERT INTO Restaurante
		(IdRestaurante, Prato, Preco)
		VALUES
		(2, 'Frango Parmegiana', 30);
    
    INSERT INTO OcupacaoRestaurante
		(IdNroReserva, IdRestaurante, DataHora, Quantidade)
		VALUES
		(1, 1,'2023-09-25 14:00:00', 2);

	INSERT INTO OcupacaoRestaurante
		(IdNroReserva, IdRestaurante, DataHora, Quantidade)
		VALUES
		(2, 2,'2023-08-22 14:00:00', 1);
        
	INSERT INTO Pagamento
		(IdTipoPagamento, Descrição)
		VALUES
		(1, 'Cartão de crédito');

	INSERT INTO PagamentoOcupacao
		(IdNroReserva, IdTipoPagamento, DataHora, ValorTotal)
		VALUES
		(1, 1, '2023-09-28 13:00:00', 10);
        
        
    INSERT INTO Pagamento
		(IdTipoPagamento, Descrição)
		VALUES
		(2, 'Dinheiro');

	INSERT INTO PagamentoOcupacao
		(IdNroReserva, IdTipoPagamento, DataHora, ValorTotal)
		VALUES
		(2, 2, '2023-08-24 14:00:00', 15);
        
	SELECT Cpf, Cep FROM Cliente WHERE Cidade = @cidade;
    
    SELECT IdCliente, Nome, Sexo, CPF, CIDADE, CEP, DtaNasc FROM cliente;
    
    SELECT Nome, Sexo FROM Cliente ORDER BY Nome;

    SELECT IdNroQuarto FROM Quarto ORDER BY Andar DESC, ValorDiaria ASC;

	SELECT IdNroQuarto FROM Quarto WHERE ValorDiaria BETWEEN 100 AND 150;
    
    SELECT * FROM Reserva
		WHERE IdCliente = 1 AND IdNroQuarto IN
		(SELECT IdNroQuarto FROM Quarto WHERE ValorDiaria BETWEEN 100 AND 150);
        
	SELECT DISTINCT IdNroQuarto FROM Reserva;
    
    SELECT DISTINCT IdNroReserva FROM Aprovação;
    
    SELECT DISTINCT IdNroReserva FROM OcupacaoRestaurante;
    
    SELECT DISTINCT IdNroReserva FROM PagamentoOcupacao WHERE IdTipoPagamento = 2;

    






    
    
    
    
    
    