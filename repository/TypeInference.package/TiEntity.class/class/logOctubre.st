spanish documentation
logOctubre
"
--- 
31/10/99

- Idea: se podria optimizar el template para que queden solo las conexiones necesarias. Se podrian eliminar las conexiones que van a parar a estados 'sin salida' iterativamente hasta que queden solo las conexiones necesarias.

- Variables Globales
Por cada variable global que se analiza en un metodo, se construye la correspondiente TiVariable (que tambien sera global). 
Problema: cada vez que se construye el template de un metodo que contiene una referencia a una variable global, se le agrega un estado y la correspondiente conexion a los nodos del nuevo template. 
Ahora se me ocurre que los metodos tambien son objetos globales..., entonces tambien habria que guardar los templates analizados junto con las variables de tipo de los objetos globales y todo lo que represente el estado inicial del sistema.
Igualmente habria que pensar como hacer para que la variable global no propage al template virgen.
Tampoco habria que duplicarla cuando se genera un nuevo template. Hacer algo similar a TiConstantNode veryDeepCopyWith:.

- cambiar a Set el atomicTypes de TypeVariable
- Renombrar TiConstantNode como TiLiteralNode

MyPoint -> 1@1
MyPoint atomicType identityHash
 <Point y: <SmallInteger> x: <SmallInteger>>
SmallInteger allInstVarNames
IdentitiyDictionary

Date today atomicType
(TemplateBuilder class: AtomicType selector: #test) halt template

((TiVariable name: #hola) addState seed: (1@3) atomicType) yourself


--- 
30/10/99

La idea es ir representando los cambios de estado sobre el tipo atomico.
Hay ciertos mensajes como Object error: que deberian estar preanalizados. En general esto deberia pasar con todos los mensajes que terminan llamando a Debugger>>openContext: label:contents:.

- Done.. Cuando se copia el template virgen, el tipo atomico correspondiente a un TiConstantNode puede ser compartido entre todos los templates. Ver TiConstantNode veryDeepCopyWith:.  

- Done. En lugar de construir los AtomicTypes como:
	AtomicType fromObject: 1@3
  seria mejor tener:
	(1@3) atomicType name: #x
	Point atomicType 
	#(1.0  2.0 3 #hola) atomicType
	(Rectangle origin: 0@0 extent: 100@100) atomicType
nil atomicType

----
29/10/99

{1@3}

1 halt 

seedArgumentsWithObjects: {1@3. #hola}
seedArgumentsWithObjects: {#hola}
SmallInteger maxVal 1073741823
 -1073741824

--- 
28/10/99 

seedWithObject: 2@3
seedArgumentsWithObjects: (Array with: 2@3)
seedArgumentsWithObjects: (Array with: #hola with: 2@3)

--- 
26/10/99
Saque la TiVariableNode de la jerarquia de TiNode, para lograr que los estados fueran TypeVariables.
(TemplateBuilder class: Point selector: #x) template

---
24/10/99

- Self NO es una variable. No puede participar en una asignacion. Se la insemina con un unico tipo atomico (esta es la idea central del CPA: analizar cada template en forma independiente).
-Para una variable de instancia, su estado inicial es 'heredado'
del estado inicial del receptor (self). 
- Para una variable temporal, el estado inicial es nil.
- Que pasa con las variables locales a los bloques???

(1@5) changeX -> 'hello'@5
(1@5) indirectChange -> 'hello'@(5/3)

Si la variable es un argumento, entonces no tiene que inicializarse a nil

(Array new: 4) asOrderedCollection halt printString

---
21/10/99
Ahora se envia el mensaje MethodNode asTypeInferenceNode para obtener el template virgen.
Ciertos objetos como nil, true y false son inmutables; los trato como si fueran constantes. (ver VariableNode asTypeInferenceNodeUsing:)

El objetivo para hoy es lograr conectar las variables de tipo para el mensaje Point setX:setY: pues ahi no hay envio de mensajes sino solo asignaciones.


----
20/10/99
Decidi no usar un nuevo DecompilerConstructor porque me parecio mas sencillo recorrer el parse tree generando un nuevo arbol de TiNodes (este mismo approach se utiliza en MethodNode asTMethodFromClass: ). 
Estuve viendo el metodo DecompilerConstructor codeConstants y en la implementacion de Leandro, no se toman en cuenta estas constantes, ni tampoco los ReturnNodes que se generan en cada bloque.
Me parecio mas sencillo generar el arbol de TiNodes a partir del parse tree. Mas que un arbol es un grafo donde los unicos nodos compartidos son las variables (cierto??). La idea es enviarle a la raiz del parse tree el mensaje asTypeInferenceNode para que genere el template virgen ( ver la jerarquia de ParseNode asTypeInferenceNodeUsing:). Dicho template se copiara cada vez que se necesite inseminarlo con nuevos parametros actuales (el tema de la copia de este grafo se soluciona con Object veryDeepCopy ).

"