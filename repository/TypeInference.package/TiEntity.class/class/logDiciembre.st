spanish documentation
logDiciembre
"
---
fg 1/7/2000 12:19


- Durante la etapa de armado del arbol, se crean los slots vacios para todas las expresiones. En el caso de las variables locales el primer slot nace inseminado con <UndefinedObject>. 
- Es en la etapa de conexion (#makeConnections) cuando se crean los nuevos slots a las variables (#newSlot). 

- Por que cambia el identityHash de ni???
	nil identityHash -> 1727
	String new becomeForward: nil
	nil identityHash -> 2194

- Si en lugar de un array de argumentos tuvieramos un objeto (TiArgumentKit) parecido al TiResult (pero con receiver y arguments), entonces podria evitarse el #becomeForward: de TiSystem mutateType:performing:. Cuando se expande un tipo y se llega a otro que ya existia en el sistema, deseamos quedarnos con la existente y descartar el nuevo. Para eso se usa el #becomeForward:. La tarea del become es reemplazar las referencias al nuevo tipo por referencias al tipo existente. No estoy seguro si el unico que tiene una referencia al tipo que se expandio es el array de los argumentos... me parece que no:
	- Podran existir inseminaciones anteriores que se hayan quedado con el array de argumentos referenciando el nuevo tipo??
	- Chequear esto con aTPoint indirectX

- Smalltalk browseAllObjectReferencesTo: aType except: #() ifNone: [].
---
4/1/00
- Habria que ver si valdria la pena sacar el slot de TiParseNode y en su lugar poner el typeSet y las conexiones. 

---
30/12/99
- self es una pseudovariable y no se le puede asignar valores (es decir que no puede participar como lado izquierdo en una asignacion). Esta variable solo puede existir adentro de un CompiledMethod y es el Interprete el encargado de hacer apuntar dicha variable al receptor del mensaje.
- Se puede cambiar el tipo de self, si el receptor del mensaje interviene en 

---
29/12/99
- Me parece que cuando los bloques no tienen argumentos, no es necesario inseminar las copias. Y en el diccionario de las evaluaciones habra una sola entrada #() >- return: {<...>}

- El tipo de un bloque es el tipo de su ultima sentencia. Si la ultima sentencia es un 'return', entonces estamos en el caso de un non-local return. 

- Hay que pensar algo para el BlockContext valueWithArguments:. El problema es que como recibe como parametro un Array, en su tipo se mezclan los tipos de todos sus elementos. Mas aun, si en el bloque se modifica alguno de los parametros, no hay forma de propagar este cambio al tipo del argumento. (comparar TPoint changeXUsingValue contra TPoint changeXUsingValueWithArguments)

- Para poder evaluar un perform: haria falta tener disponible el valor del simbolo. Si hicieramos esto, entonces dos simbolos distintos tendrian distinto tipo (<Symbol #pp> <Symbol #kk>), con la consiguiente proliferacion de tipos que eso ocasionaria.

- Cuando se analiza una expresion desde el workspace, que involucre un send a #ifTrue: (o #ifFalse:), no se lo transforma a #ifTrue:ifFalse: como sucede si es analizado en un metodo. 
	true ifTrue: [1]

---
28/12/99
- Los bytecodes no guardan estado. Para guardar el estado de la ejecucion se utilizan los contextos. En cambio, el type flow graph, guarda en sus slots el estado (parcial) de la inferencia. Es parcial porque es lo inferido 'localmente' luego que el metodo fuera inseminado monomorficamente en sus argumentos.

- El tipo especial de los bloques no es agregado a la type memory. Como tiene una referencia al parse node (TiBlockNode) y el mismo es copiado antes de inseminarlo, entonces tambien hay que copiar el tipo. (ver TiBlockNode makeConnections y TiBlockType veryDeepCopyWith:)

- El compilador de Squeak permite hacer referencia a los argumentos de un bloque afuera del mismo. Esta variable vive dentro de la definicion del TiCompiledBlock (es un argumento del TiBlockNode). Dichas definiciones se copian, luego inseminan y finalmente se extraen los resultados. Logicamente los cambios producidos a las variables locales del bloque no se propagan afuera de el. 
	blockWithArgument
		[:t1 | t1] value: 1.0.
		^ t1
Para respetar la semantica (incorrecta) del compilador, se podria tomar los argumentos del bloque como referencias al home.

---
14/12/99
- Decidimos no guardar los templates. Las asignaciones que ocurren dentro de un metodo (TPoint uselessChange) se 'pierden', pero se puede reconstruir....

---
8/12/99

- Hay que pensar en otra forma de indexar los templates inseminados. Ahora esta asi:
	TPoint>>changeX
<TPoint x:<SmallInt> y:<SmallInt>> => <TPoint x:<Symbol> y:<SmallInt>>
<TPoint x:<Float> y:<Float>> => <TPoint x:<Symbol> y:<Float>>
obviamente el receptor sera un TPoint o alguna de sus subclases, esto me lo asegura el interprete al hacer el lookup del selector.
 
- Preguntas
- como hacer para incrementar la cantidad de memoria disponible
	memory			16,761,192 bytes
		used		8,459,944 bytes (50.5%)
		free		8,301,248 bytes (49.5%)

- El analisis de la expresion 
	6 max: (SmallInteger maxVal + 1)
dejo sin espacio al Squeak. En el archivo Colgada-LowSpaceDebug.log esta el dump del stack. Hay 32611 llamadas. Numero sospechoso pues 16r7FFF (= 32767). Habra algun limite a la cantidad de llamadas en el stack???

- TiScript typeInferenceCount 
		11404	TiSlot
		3770	TiMessageNode
		2586	TiSlotForArgument
		2474	TiBlockNode
		2457	TiBlockType*
		1291		TiSlotForSelf*
		1270		TiVariableNode
		1269		TiLiteralNode
		1263		TiReturnNode
		1261		TiAnalyzedContext*
		1260		TiVariableForSelf
		1260		TiMethodNode
		1240		TiMethod*

		18		TiAssignmentNode
		10		TiObjectType
		10		TiClass
		8		TiVariableForSuper
		3		TPoint
		3		TiIndexedType
		1		TObject



- para hacer simulaciones 
	MessageTally tallySends: [5.0 max: 16rFFFFFFFF]
	MessageTally tallySends: [Smalltalk do: [:e | ] ]
---
7/12/99
- Para no perder precision
	- VerySmallInteger
	- SmallArray (para A x B)
- Que hacer en TiPrimitiveAnalyzer primitiveSignal??
	- La semantica que tiene en run-time es hacer un resume del proceso que esta esperando en el semaforo. ver Semaphore signal.

- La implementacion de las primitivas es un poco rapida...
	- TiPrimitveAnalyzer primitiveEqual falla si ambos argumentos no son SmallInteger, pero la implementacion real en Interpreter primitiveEqual termina llamando a compare31or32Bits:equal: (??)

	- (SmallInteger maxVal + 1)  [<SmallInteger>]
	cuando deberia retornar tambien <LargePositiveInteger>

---
6/12/99

- No se hace lookup sobre el mensaje ==. Entre estas dos expresiones equivalentes:
	a == nil 
	a isNil
La primera es mas eficiente ya que no se realiza el lookup del metodo. Si pudieramos bindear estaticamente el send del isNil a Object>>isNil
	self == nil
y ponerlo inline (por lo reducido del metodo), entonces la segunda expresion seria equivalente a la primera en terminos de eficiencia (ejecutarian la misma secuencia de bytecodes), aunque mucho mas legible para un ser humano.

---
5/12/99
- Estructuras recursivas
	<TestNode
		name:<Symbol>
		connections:<OrderedCollection
						lastIndex:<SmallInteger>
						firstIndex:<SmallInteger>
						array:<Array (<TestNode ?>)>>>

-En realidad el array seria <Array (<UndefinedObject> <TestNode ?>)>. Como hacer para diferenciar los nil que aparecen en el array de una OrderedCollection. Son equivalentes a las variables locales sin inicializar. Se podria redefinir Behavior typeOf: en OrderedCollection class typeOf:


- instalar los tipos en la TiMemory.

Necesitaba alguien que fuese 'guardando' los tipos que se van creando durante la interpretacion abstracta. Pense la TiMemory como paralelo a la ObjectMemory, pero en lugar de tener objetos tiene tipos. 

---
4/12/99
- crear los tipos recursivamente

- No se pueden representar tipos de la forma Char x Int. Para eso hay que usar <Array (<SmallInteger> <Character>)>. Si quisiera distinguirlos habria que hacer dataflow analysis.

---
3/12/99
- Nueva jerarquia de implementation types (TiType)

- Puedo tener varias instancias de TiMemory, pero quien tiene cada una de esas instancias???

- patricia@dc.uba.ar
- acukier@dc.uba.ar
- gmatich@dc.uba.ar  14/12 19hs final
o marta@dc.uba.ar
---
2/12/99

- ver porque no analiza el 2do bloque en TObject blockAssignements.


- Si quisiera inferir tipos sobre todo lo que hay en mi imagen, evaluo cada expresion posible???
	- Se podria activar un Profiler que vaya mirando lo que hay en el stack (onda Type feedback).
	- Hay que aprovechar la correspondencia entre run-time y ti-time.
	- Suponiendo que todo posible mensaje que se pueda enviar en una imagen tiene su correspondiente 

"