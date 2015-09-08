frase --> pronombre(Persona,Numero), verbo(_ , _ , Persona, Numero).

verbo(Infinitivo, Tiempo, Persona, Numero) -->
                  [V],
                  { name(V, VerboCadena),
                    append(RaizCad, TerminacionCad, VerboCadena),
                    name(Raiz, RaizCad),
                    es_verbo(Raiz, Infinitivo),
                    name(Terminacion, TerminacionCad),
                    es_terminacion(Terminacion, Tiempo, Persona, Numero)
                  }.


% DICCIONARIO



es_verbo(pint, pintar).
es_verbo(habl, hablar).
es_verbo(am, amar).


es_terminacion(aré, futuro, 1, singular).
es_terminacion(arás, futuro, 2, singular).
es_terminacion(ará, futuro, 3, singular).
es_terminacion(aremos, futuro, 1, plural).
es_terminacion(aréis, futuro, 2, plural).
es_terminacion(arán, futuro, 3, plural).


% Pronombre

pronombre(1,singular) --> [yo].
pronombre(2,singular) --> [tu].
pronombre(3,singular) --> [el].
pronombre(3,singular) --> [ella].
pronombre(1,plural) --> [nosotros].
pronombre(2,plural) --> [vosotros].
pronombre(3,plural) --> [ellos].
pronombre(3,plural) --> [ellas].
