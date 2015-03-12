spanish documentation
primitivas
"
Inicialmente pensaba que se podia determinar si una primitiva iba a fallar o no, segun (el tipo de) los argumentos que tuviera. Pero esto no es asi: la primitiva de division falla segun el valor de uno de los argumentos (cuando el divisor es cero). 

Hay ciertas primitivas que no dependen en absoluta del tipo del argumento.  (primitiveEqual, primitiveClass).

Las primitivas estan llenas de casos especiales:

[] primitiveNextPut [5/19/2000]
	Normalmente se pregunta por el tipo del receptor o el argumento. El exito de esta primitiva tambien depende del tipo de una de sus variables de instancia. Si la variable collection no es un Array o un String, la primitiva falla.

[] primitiveNewWithArg
	No interesa el tipo del receptor. Interesa que el tipo del argumento sea un entero (small o large). 

[] primitiveValueWithArgs
	Los argumentos para evaluar el bloque vienen en un array. Es importante conservar el orden de los tipos dentro del array.

[] algunos de los que me acuerdo ahora (y hay que completar)
- primitiveValue
- 
- primitivePerform


"