CREATE DATABASE EsercizoDB;

CREATE TABLE public.clienti (
	numero_cliente serial NOT NULL UNIQUE PRIMARY KEY,
	nome varchar NOT NULL,
	cognome varchar NOT NULL,
	anno_nascita int NOT NULL,
	regione_di_residenza varchar NOT NULL
);

CREATE TABLE public.prodotti (
	id_prodotto int NOT NULL UNIQUE PRIMARY KEY,
	descrizione text NULL,
	in_produzione boolean NOT NULL,
	in_commercio boolean NOT NULL,
	data_attivazione date NOT NULL,
	data_disattivazione date NULL
);

CREATE TABLE public.fornitori (
	numero_fornitore int NOT NULL UNIQUE PRIMARY KEY,
	denominazione varchar NOT NULL,
	regione_di_residenza varchar NULL
);

CREATE TABLE public.fatture (
	numero_fattura serial NOT NULL UNIQUE PRIMARY KEY,
	tipologia varchar NOT NULL, 
	importo int NOT NULL,
	iva int NOT NULL,
	id_cliente int NOT NULL,
	data_fattura date NOT NULL,
	numero_fornitore int NOT NULL,

	CONSTRAINT fatture_cliente_fk FOREIGN KEY (id_cliente)
				REFERENCES clienti(numero_cliente),
	CONSTRAINT fatture_fornitore_fk FOREIGN KEY (numero_fornitore)
				REFERENCES fornitori (numero_fornitore)
);

INSERT INTO public.clienti (nome, cognome, anno_nascita, regione_di_residenza)
			VALUES 	('Mario', 'Rossi', 1982, 'Lombardia'),
					('Luisa', 'Verdi', 1990, 'Lazio'),
					('Anna', 'Bianchi', 1978, 'Toscana'),
					('Giorgio', 'Neri', 2000, 'Sicilia'),
					('Elena', 'Galli', 1995, 'Veneto');

INSERT INTO public.fornitori (numero_fornitore, denominazione, regione_di_residenza)
			VALUES  (1, 'Tech Supply', 'Lombardia'),
					(2, 'Green Agro', 'Veneto'),
					(3, 'Electro World', 'Lazio'),
					(4, 'Food Distributors', 'Emilia-Romagna'),
					(5, 'Construction Hub', 'Sicilia');
					
INSERT INTO public.prodotti (id_prodotto, descrizione, in_produzione, in_commercio, data_attivazione, data_disattivazione)
			VALUES  (1, 'Smartphone XYZ', true, true, '2025-01-01', NULL),
					(2, 'Laptop ABC', true, false, '2024-12-01', '2025-01-15'),
					(3, 'Frigorifero 3000', true, true, '2024-11-15', NULL),
					(4, 'Lavatrice Turbo', false, false, '2024-10-01', '2024-12-01'),
					(5, 'Televisore UltraHD', true, true, '2025-01-10', NULL);
					
INSERT INTO public.fatture (tipologia, importo, iva, id_cliente, data_fattura, numero_fornitore)
			VALUES 	('Elettronica', 1200, 22, 1, '2025-01-01', 1),
					('Elettrodomestici', 800, 22, 2, '2025-01-05', 2),
					('Alimentari', 300, 10, 3, '2025-01-10', 3),
					('Arredamento', 1500, 22, 4, '2025-01-15', 4),
					('Tecnologia', 1000, 22, 5, '2025-01-20', 5);




SELECT * FROM public.clienti;
SELECT * FROM public.fatture;
SELECT * FROM public.fornitori;
SELECT * FROM public.prodotti;

--Estrai tutti i clienti con nome Mario: 
SELECT * FROM public.clienti WHERE nome = 'Mario';
--Estrai nome e cognome dei clienti nati nel 1982:
SELECT nome, cognome FROM public.clienti WHERE anno_nascita = 1982; 
--Estrai il numero delle fatture con iva al 22%: 
SELECT numero_fattura FROM public.fatture WHERE iva = 22;
--Estrai le fatture con importo inferiore a 1000 e i dati dei clienti ad esse collegate:
SELECT * FROM public.fatture WHERE importo < 1000;



