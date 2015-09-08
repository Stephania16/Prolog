% REPRESENTACIÓN DE ESTADOS DEL PROBLEMA:
% estado(numeroMisioneros, numeroCaníbales, estaBarco)
% 	donde numeroMisioneros es el número de misioneros en la orilla izquierda
% 	      numeroCanibales es el número de caníbales en la orilla izquierda
% 	      estaBarco puede ser 1, si el barco está en la orilla izquierda, o 0 si está en la derecha



% ESTADOS INICIAL Y OBJETIVO:
inicial(estado(3, 3, 1)).
objetivo(estado(0, 0, 0)).



% MOVIMIENTOS:
% Un misionero
movimiento(estado(NM, NC, 1), estado(NNM, NC, 0), M):- NM > 0, NNM is NM-1, not(peligro(estado(NNM, NC, 0))).
movimiento(estado(NM, NC, 0), estado(NNM, NC, 1), M):- NM < 3, NNM is NM+1, not(peligro(estado(NNM, NC, 1))).

% Un caníbal
movimiento(estado(NM, NC, 1), estado(NM, NNC, 0), C):- NC > 0, NNC is NC-1, not(peligro(estado(NM, NNc, 0))).
movimiento(estado(NM, NC, 0), estado(NM, NNC, 1), C):- NC < 3, NNC is NC+1, not(peligro(estado(NM, NNc, 1))).

% Dos misioneros
movimiento(estado(NM, NC, 1), estado(NNM, NC, 0), MM):- NM > 1, NNM is NM-2, not(peligro(estado(NNM, NC, 0))).
movimiento(estado(NM, NC, 0), estado(NNM, NC, 1), MM):- NM < 2, NNM is NM+2, not(peligro(estado(NNM, NC, 1))).

& Dos caníbales
movimiento(estado(NM, NC, 1), estado(NM, NNC, 0), CC):- NC > 1, NNC is NC-2, not(peligro(estado(NM, NNC, 0))).
movimiento(estado(NM, NC, 0), estado(NM, NNC, 1), CC):- NC < 2, NNC is NC+2, not(peligro(estado(NM, NNC, 1))).

% Un misionero y un caníbal
movimiento(estado(NM, NC, 1), estado(NNM, NNC, 0), MC):- NM > 0, NC > 0, NNM is NM-1, NNC is NC-1, not(peligro(estado(NNM, NNC, 0))).
movimiento(estado(NM, NC, 0), estado(NNM, NNC, 1), MC):- NM < 3, NC < 3, NNM is NM+1, NNC is NC+1, not(peligro(estado(NNM, NNC, 1))).



% PREDICADOS AUXILIARES:
peligro(estado(NM, NC, _)):- NC > NM.


% BÚSQUEDA
puede(Estado, _, []):- objetivo(Estado).
puede(Estado, Visitados, [Operador|Operadores]):- movimiento(Estado, Estadoi, Operador), \+ member(Estadoi, Visitados), 
	puede(Estadoi, [Estadoi|Visitados], Operadores).


% CONSULTA:
consulta:- inicial(Estado), puede(Estado, [Estado], Camino), write('SOLUCIÓN ENCONTRADA sin repetición de estados: '), 
	nl, write(Camino).