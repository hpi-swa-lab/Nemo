spanish documentation
logNoviembre
"
---
29/11/99
- Cada vez que se infieren tipos de una expresion, se resetea el estado general y se abre un explores. Todo eso hay que hacerlo mas customizable en:
	- ParagraphEditor analyzeSelection

- Refinando lo dice Ole (3.2.1.3), podemos decir:
	- object 					= implementation type
	- activation record 		= template
	- contents of variable	= implementation type of slot
	- result of expression	= implementation type of expresion
	- data flow				= type flow

- En la tesis de Ole queda confuso que es un concrete type.
En 2.1.1 dice:
	Concrete types describe implementations of objects, including machine-level properties, such as how objects are laid out in memory and the code they execute to perform operations. Hence, the concrete type of an object is the exact class that it has been instantiated from.
Y en otro parrafo:
	For expressions that may evaluate to instances of more than one class and for variables that may hold instances of more than one class, concrete types are not single classes but sets of classes.

Con lo cual el termino 'concrete type' tiene dos acepciones: 
1) cuando se trata de un objeto, el 'concrete type' es su clase 
2) cuando hablamos de una variable, el 'concrete type' se forma tomando la clase de todos los objetos que pueden ocurrir en la variable.

Propongo reemplar por: 
1) 'implementation type'. Estoy acostumbrado a que un tipo sea una sola cosa (y no varias). Me resulta anti-intuitivo que un tipo sea un conjunto.
2) 'concrete type' (aunque en el codigo voy a hablar de implementationTypes). La mayor parte de las veces en la tesis de Ole, se utiliza esta acepcion.

- Haciendo una comparacion con otros lenguajes:
	- C: se declaran implementation types. Ej: int a; informa al compilador que a es un entero de 32 bits (y nunca podra se otra cosa...).
	- C++: se declaran generic types. Ej: Graph* g; informa que 'g' va a apuntar a un Graph o cualquiera de sus subclases. Con esto no sabemos los implementation types a los cuales 'g' va a apuntar en determinado programa. Aca tenemos el mismo problema que se presenta en Smalltalk para el delivery de aplicaciones; si Graph se distribuye en un libreria y queremos hacer uso de una parte de ella (x ej, solo usamos Rectangle), la tenemos que distribuir toda -ya que no podemos saber cual es la porcion que realmente se utiliza-.
	- Java: se declaran interface types. Ej: Streamable s;. El implementation type de 's' puede ser cualquier clase que implemente la interface Streamable. Volvemos a tener el problema de application delivery.



--- 
26/11/99
- Renombro TiSlot a TypeFlowNode? o TypeSlot?
- Tocar el compilador para que cada vez que se grabe un metodo existente, se borren los templates que ya habia 'cacheados'
---
25/11/99
- Hacer un test suite de pruebas basicas. (ver el ChangeSet Type-Inference.0.2.cs (TestCase))
- Un bloque es como un 'inlined method'. 
- Problemas:
	- Argumentos. Un bloque puede tener argumentos, con estos no se presenta problema, el tema es poder transformar las referencias al 'home' en argumentos normales.
	- Non-Local returns
	- si uno busca los senders de ContextPart blockCopy: , apareceran los 4885 metodos donde se utilizan bloques. Este mensaje los inserta el compilador, y no es parte del parse tree. Como resultado, no es necesario implementar. TiPrimitiveAnalyzer primitiveBlockCopy.
- BlockContext value

- Refactorizar los AtomicTypes
	- tipo especial para el bloque??
	- Tipo especial para errores de ejecucion

- Run-time vs Ti-time:
Asi como los bytecodes del bloque estan adentro del CompiledMethod, el subgrafo del bloque estara adentro del grafo del template (o TiAnalyzedMethodContext). Y asi como se inserta un jump para saltear los bytecodes del bloque (hasta que al mismo le llegue un #value), no se realizaran las conexiones de tipos (que representan la ejecucion) hasta que se analize el #value. En otras palabras... no conectar los slots de los statements del bloque es equivalente a no ejecutarlo.
Mas sinteticamente:
	- source code 				= ti-tree 
	- compilacion( source code ) = conexion( ti-tree ) aunque esta conexion puede desencadenar la propagacion de tipos
	- bytecodes 					= type flow graph
	- ejecucion de bytecodes		= propagacion de tipos 
	- instruction pointer del bloque apuntando a los bytecodes del metodo = tipo del bloque con una referencia al subgrafo dentro del type flow graph.

Donde: ti-tree replica la estructura de un parse tree, pero en cuyos nodos tenemos los slots que seran conectados mas adelante. Este ti-tree puede obtenerse recorriendo el parse tree y replicandolo, o decompilando los bytecodes del metodo.	


- El interprete necesita de un Context para ir guardando el estado de la ejecucion de los bytecodes pertenecientes a un CompiledMethod. Por otro lado los slots (el equivalente a un bytecode) tienen la inteligencia como para propagar sus tipos; por consiguiente el interprete abstracto no necesita guardar ningun estado (simplemente insemina los slots iniciales y ellos hacen el resto).
- Contrariamente con lo que le pasa al interprete normal, al interpretre abstracto le 'cuesta' mas analizar un metodo que tenga una primitiva que uno que no tenga (pues tiene que crear un contexto especial).

- Las variables de instancia agregadas al template ( primitive initialSlots returnSlot ) se necesitan cuando hay un primitiva que nunca falla y entonces la variable method queda en nil.

- Renombro #makeConnections a #compile?, #makeTypeFlowGraph? #buildTypeFlow?

---
24/11/99

- Cada instancia de un TiAnalyzer representa un thread de ejecucion. Con esto puedo tener varios analisis al mismo tiempo. El problema es que lo tengo en una variable global de TiMessageNode, y no se resetea su estado interno cuando se aborta el analisis por algun error. Deberia pasarse un nuevo analizador por cada analisis que quisiera realizar (es como si estuviera creando un nuevo proceso).
- Si hago lo anterior, entonces tengo que sacar el diccionario de las clases analizadas del TiAnalyzer, iria mas bien a TiSystem?? (el equivalente al SystemDictionary Smalltalk).

--- 
23/11/99

- Eliminar la variable visited del template. Usar transitoriamente a connectionGraph (ahora method).

- Hacer un Debugger que muestre los registros de activacion analizados hasta el momento.

- Cambiarle el nombre al template??? TiActivationRecord o TiMethodContext. o TiContext o TiAnalyzedContext 

- Ole 3.2.1.3 dice:
Templates are created to analyze methods, whereas activation records are created to evaluate methods.
Any given activation record will still be represented by one template, and each template will in general still represent many activation records (the many-to-one correspondence is necessary since an unbounded number of activation records may be created during executions, whereas only a finite number of templates can be created during type infer-ence). This is why we use the word “template”: they are templates for activation records.

- Siguiendo con el paralelo entre runtime y type-inference time:
	- El MethodContext tiene el metodo que esta ejecutando.
	- El TiTemplate tiene el grafo de conexiones (type flow graph??) que representa el flujo de tipos durante la ejecucion.
	- El grafo de conexiones de tipo es el equivalente a los bytecodes del metodo ( es mas, se obtiene a partir de los bytecodes). De alguna forma 'sintetiza' el comportamiento que pueden tener los tipos.
- Los TiContexts son mas 'historicos' que los MethodContexts. El TiContext es el equivalente a un MethodContext ejecutado, pero necesita guardar el resultado del analisis de tipo... donde?? en si mismo, pero el TiMethod es el que lleva el registro de los diferentes tipos de invocacion que tuvo (una vez con <SmallInteger>,<SmallInteger> otra vez con <Float>,<Float> etc.)

- La primitiva podria estar en el TiMethodNode y ser el TiAnalyzer el encargado de crear los templates e inseminarlos. Teniendo cuidado que si el metodo tiene una primitiva, entonces analizar si fallaria.

- Los seededTemplates podrian llamarse analyzedContexts

--- 
21/11/99
- Para ver la simulacion del interprete fijarse en las siguientes categorias:
	- ContextPart system simulation
		- ContextPart step
		- ContextPart completeCallee: (el que hace uso de esto es Debugger doStep)
	- Interpreter message sending
		- Interpreter normalSend
		- Interpreter superclassSend
	
- La busqueda de un selector en los method dictionaries (y el consiguiente raise del #doesNotUnderstand) esta en:
	- Interpreter lookupMethodInClass: 
	- ContextPart send:to:with:super: 
	- ContextPart send:super:numArgs: (fijarse en los senders de este mensaje especialmente en InstructionStream interpretExtension:in:for:).


---
20/11/99
- Relacionado con el comentario del 16/11 estuve pensando acerca de los errores que se pueden presentar en tiempo de ejecucion (se acaba la memoria, hay un error al escribir un archivo, etc) y que estan 'determinados' por el ambiente de ejecucion. No tiene sentido tratar de analizar estos posibles errores cuando se realiza la inferencia de tipos. Simplemente asumimos que corremos en un ambiente ideal donde no se producen estos errores.

Me tengo que ir... dejo pendiente:
- muchos metodos que utilizan primitivas terminan llamando a #primitiveFailed. Estos son candidatos a ser catalogados como errores de runtime.

- Viendo #primitiveNextObject me hizo repensar todo el concepto de tipos. Quienes usan #nextObject?? Los que hacen uso de #nextObject saben que les puede venir cualquier objeto. Reformulando la pregunta:
	- Cual es el tipo de Object #nextObject?
	Rta: es el conjunto de todas las clases que tengan instancias.
Cada vez veo mas claro que no se puede utilizar el interprete para deducir el tipo de un primitiva.

- Si voy a hacer un tratamiento especial para ciertos objetos fijarse en:
	SystemDictionary recreateSpecialObjectsArray
	Smalltalk specialObjectsArray
	Smalltalk compactClassesArray

- Todas las variables globales estan definidas en el Diccionario Smalltalk (incluso la variable #Smalltalk). Quizas se podria hacer un tratamiento especial para estas variables... Como hay una unica instancia entonces su tipo es su clase (y no necesito mirar las variables de instancia que tiene).

- De las 1159 variables globales, 1147 tienen una unica instancia (pues son clases) . Las 12 restantes son diccionarios y algunas variables especiales 
	(Smalltalk select: [:e | e class allInstances size ~= 1]) size -> 12
	(Smalltalk select: [:e | e isBehavior]) size -> 1142
	Smalltalk size -> 1159

(Smalltalk select: [:e | e isBehavior not and: [e isKindOf: Dictionary]]) keys 
->	Set (Undeclared TextConstants AliceConstants B3DEngineConstants Smalltalk ImageImports BalloonEngineConstants WonderlandConstants )
	
(Smalltalk select: [:e | e isBehavior not and: [(e isKindOf: Dictionary) not]]) keys
-> Set (Display World Processor ScriptingSystem SystemOrganization ScheduledControllers Transcript SourceFiles Sensor )

- No se si tiene que ver pero, aca va la lista de las clases que no descienden de Object
	(Smalltalk select: [:e | e isBehavior and:[e superclass == nil]]) keys 
-> Set (ObjectTracer ImageSegmentRootStub Object ObjectOut PseudoContext )

---
19/11/99
- Hay ciertos metodos que 'hacen' al run-time:
	- Behavior new 
	- Object halt o Halt signal o Error devDefaultAction o Debugger openContext:label:contents:
Esos metodos conviene tenerlos analizados de antemano.

- Estaba manteniendo las claves de los templates inseminados solamente con el selector y el tipo del receptor. Esto no alcanza cuando en una clase y alguna  de sus subclases se implementa el mismo metodo, y en la subclase existe otro metodo que hace referencia al metodo de la superclase utilizando la pseudovariable 'super'. 
Ej:
	TObject | returnFive	{ ^ 5 }
	TPoint | returnFive { ^ 5.0 }
	TPoint | superReturnFive { super returnFive }

Si se evalua:
	TPoint new superReturFive 

Se creara la siguiente entrada en el repositorio 
(<TPoint> returnFive) : template [TObject | returnFive <TPoint>] -> <SmallInteger> 

Cuando mas adelante quiera averiguar el tipo de TPoint returnFive, me retornara la correspondiente al metodo TObject | returnFive.

---
18/11/99
- Arregle las variables e incorpore TiVariableForSuper.
- Todavia no utilizo el PrimitiveSimulator para evaluar el resultado de una primitiva
	| vm |
	vm := (PrimitiveSimulator new initialize).
	vm primitiveAdd: 3 and: 5000
	vm primitiveAdd: 0 and: 16r3FFFFFFF
	vm primitiveAdd: 1 and: 16r3FFFFFFF
	vm successFlag

---
17/11/99
- TiVariableForSuper ( selfNode methodClass )
- Incorporar class y selector a TiTemplate
- Mover TiTemplateRepository a una variable de clase dentro de TiTemplate, organizandolo por diccionarios de clases, selectores e inseminaciones.
- Modificar TiMessageNode argument:seededWith: para tener en cuenta los super-sends.

---
16/11/99
La primitiva 70 (primitiveNew) es utilizada para la creacion de nuevos objetos. Se utiliza en Behavior new, Behavior basiceNew e Interval class new. Como aqui se crean los objetos en runtime, entonces se crearan los AtomicTypes en type inference time.
Esta primitiva falla si no tiene suficiente memoria para alocar el objeto. No tiene sentido analizar este tipo de fallas cuando se realiza la inferencia de tipos. Por esta razon se crea un template especial para los mensajes donde se llama a la primitiva 70 (como nunca falla no tiene sentido armar el template sobre el resto del metodo).

- Tanto los slots iniciales como los finales de un template se obtienen a partir del los slots del metodo. Para el caso de la primitiva 70, donde no necesito construir un type inference tree, vendria bien que esos slots pertenecieran al template.
Ahora no puedo dejar el metodo en nil porque el printOn toma el selector del metodo.


---
15/11/99
- Las claves del diccionario de templates virgenes son pares (Arrays) con la clase y el selector. Cada vez que se realiza una busqueda se crea un nuevo par para ver si esta. Una alternativa es tener un diccionario con las clases y cada una de ellas con un diccionario de selectores.

---
13/11/99
- Las primitivas pueden cambiar el valor de los argumentos??
- Algoritmo para determinar caminos entre nodos de un grafo.
- La primitiva de suma Interpreter primitiveAdd 
	(PrimitiveSimulator new initialize) primitiveAdd: 3 and: 5
  no chequean la cantidad de parametros.

---
12/11/99

Script browsePrimitives
Script detailedBrowsePrimitives
Hay que retocar la tabla de las primitivas de la 20 a la 40 (LargePositiveInteger) porque el simulador las setea en #primitiveFailed
- super poner halt en TiMessageNode argument:seededWith: y seguir...
---
11/11/99
- La nueva jerarquia que estuve pensando seria:

- Los TiSlots seran los que tienen los tipos atomicos y las conexiones (en principio se llamaban TypeVariables y luego TypeHolder). Entienden basicamente #seed: anAtomicType y #connectTo: anObject (anObject debera entender #seed: anAtomicType). Sus variables de instancia seran 'type' (un conjunto de AtomicTypes)  y 'connections' (una OrderedCollection de objetos a los cuales propaga su tipo).

- Los TiParseNodes tendran un slot y la TiVariables tendran varios slots (obviamente instancias de TiSlot).

- Cuando termina de armarse el Template tenemos un 'type inference tree' cuya raiz es un TiMethodNode. Este arbol replica la estructura del 'parse tree', pero en sus nodos tenemos la informacion que nos interesa: los slots.

- La estructura que le da forma de arbol esta dada por los TiParseNodes. Pero en realidad no se trata de un arbol sino de un grafo ya que en varias ramas puede tener la misma hoja correspondiente a una variable (TiVariable).

- Todas las conexiones de este arbol tienen origen en un slot mientras que el destino de puede ser otro slot (en el caso de las asignaciones) u otro nodo  (instancia de alguna subclase de TiParseNode).

- Con el proposito de la optimizacion, el Template tendra los slots correspondientes a los estados iniciales y finales de los argumentos, asi como el slot del 'return value' (es el que corresponde al TiMethodNode). Con esta informacion puede requerir la ayuda de otro objeto para que lo recorra y deje solamente las conexiones necesarias entre slots (deshaciendome de toda la estructura del arbol)

- Por que armar todo el arbol si despues lo voy a terminar deshaciendo?
	- Permite separar en dos etapas (armado y optimizacion).
	- Facilita el debugging.
	- Podria agregarle un variable de instancia 'slot' a cada nodo del parse tree, pero me quedaria la logica de inferencia de tipos en nodos que se utilizan para otras cosas.
	- Si se quiere relacionar el slot correspondiente a una sentencia dentro de un metodo, entonces se puede construir completamente el arbol y no optimizar.

- Como se arma un Template:
	- A partir de una clase y selector se obtiene el CompiledMethod.
	* Se puede generar el ti tree Decompilando el CompiledMethod
	- Se decompila el metodo, obteniendose el parse tree.
	- Se espeja la estructura del parse tree en un nuevo arbol (type inference tree). Para esto se envia a cada uno de los parse nodes el mensaje #mirrorIn:, pasandole como parametro el template que se esta construyendo. Esto hace que cada parse node le envie de vuelta al template el mensaje de build correspondiente, quien termina creando los nodos del nuevo arbol.
	- Se recorre el nuevo arbol realizando las conexiones entre sus slots. #makeConnections
	- Se optimiza el arbol quedandose solamente con aquellos slots que participan en algun camino entre los slots iniciales y los finales.

- Optimizacion - Idea: el slot correspondiente a un TiLiteralNode nace inseminado, no puede recibir nuevas inseminaciones (se trata de un constante) y una vez que terminamos de conectarlo se podria eliminar ya que completo su 'trabajo'.

- Optimizacion - Idea: en los metodos que no se haga referencia a las variables de instancia es posible reemplazar los TiSlotForSelf por slots normales.

--- 
10/11/99
- Manejar 'super'
- Las tabla de las primitivas esta en Interpreter class initializePrimitiveTable, de MethodNode printOn: deduje cual era el rango de primitivas reales. Modifique SystemDictionary allPrimitiveMessages para saber donde se usan las primitivas. 
 	Smalltalk allPrimitiveMessages
	Object class whatIsAPrimitive
	La primitiva es lo primero que se evalua del metodo.

MethodNode va a tener la tabla PrimitiveTable

- Para probar el IntrepreterSimulator hay que partir de una imagen basica, y escribir un metodo parecido al #majorShrink pero que elimine TODAS las clases salvo las necesarias para ejecutar alguna expresion sencilla. Este #ultraShrink debe terminar grabando la imagen. Para probar hay que evaluar: 
	(InterpreterSimulatorLSB new openOn: 'D:\pancho\Projects\Squeak\images\Squeak2.6.ultra-shrinked.image') test

- Ahora estoy dejando en nil los modifiedActualArguments que no se utilizan. Ponerle un simbolo para indicar que no se utilizan. 

--- 
9/11/99
- Evaluar expresiones del tipo:
	a := TestObject new.
	a returnArg: 14.
- Tuve que tocar Compiler, ParagraphEditor (y su clase) y PluggableTextMorph.
- Funciona bien, pero creo que esta haciendo lio con las variables que aparecen 'sueltas' en el workspace. Las instala como shared y eso hace que se agreguen un monton de estados nuevos en el diccionario SharedVariables.
- Cada vez que se evalua la expresion a := TestObject new, se interpreta como que 'a' es una nueva variable global y por eso se crea una nueva entrada en el diccionario SharedVariables.
- Cada vez que se evalua la expresion ( a returnOne ), se le agrega un nuevo slot a la TiVariable de 'a' donde iran a parar los argumentos.  modificados. Como el metodo #returnOne no altera el receptor, 


--- 
8/11/99
- Reemplazar TypeVariable por TypeHolder
- Reemplazar #connect por #makeConnections
- Reemplazar #mirrorTreeIn: por #mirrorIn:

- Sincronizar self y las variables de instancia.

- Manejar los 'will not understand' TemplateRepository virginAt:forReceiver:.

--- 
5/11/99
- incoporar los resultados de la evaluacion del template en el send
- Pregunta: Se pude construir un BookMorph con todos los comentarios de las clases???

----
4/11/99
- LLego la hora de conectar los argumentos actuales al template....

- Ver el comentario en  TiVariable 

- El TiTemplate podria construirse optimizado, esto es, con todas las conexiones innecesarias removidas y tambien se podrian mergear estados (ej: cuando las variables participan como argumento de un send, se conecta su ultimo estado una variable de tipo especial para el  argumento; se podria colapsar estas dos variables de tipo a una sola)

- La construccion de un template es varios ordenes de magnitud mas rapido que la inseminacion del mismo. Ej: la siguiente expresion solo tarda 6 milisegundos en ejecutarse
	(TemplateBuilder new templateFor: #sevenMax: in: TestObject)

mientra que cada inseminacion que se realiza aumenta gradualmente el tiempo de ejecucion
	(TemplateBuilder new templateFor: #sevenMax: in: TestObject)
		seedArgumentsWithObjects: {1. 1/8} -> 130
y las subsiguientes tardaron: 282, 477, 614, 791, 978



--- 
3/11/99
- El TiTemplate es un TiNode al que le van a llegar los #connecTo: de los argumentos. El va a conectar cada argumento actual a sus argumentos formales y el estado final de cada uno de ellos 

- Hasta ahora los metodos constructores de los TiParseNodes tambien realizaban las conexiones de flujo de tipo. Decidi poner la logica de la conexion en un metodo separado #connect que recien se va a llamar cuando tenga todo el arbol construido. Si bien esto es mas ineficiente (pues tengo que recorrer el arbol otra vez) va a facilitar el debugging de las conexiones (y despues se puede cambiar facilmente...).

- Idea: hacer un TemplateExplorer que me permita recorrer comodamente los nodos de un template.

- Cualquier nodo puede participar como argumento. Como todos los pasajes de parametros son por referencia, entonces podria ser modificado; esto me llevo a pensar que todos los nodos deberian tener 2 estados. Pensando luego mas detenidamente, me di cuenta que ese estado modificado por el mensaje no puede ser accedido por nadie.
Veamos el ejemplo de la siguiente expresion:
	1@1 changeX changeY 

con las siguientes definiciones:
	Point>>changeX
		x := #hello.
		^ 5

en este caso el tipo del parametro 1@1 cambia de <Point x:I y:I> a <Point x:S y:I>, pero nadie puede acceder a ese objeto modificado porque se esta retornando el valor 5. Como nadie puede acceder a ese objeto modificado, su tipo no es relevante. 

Si en cambio
	Point>>changeX
		x := #hello.
		^ self

Aqui, el objeto modificado se esta retornando en el stack, luego el tipo resultante <Point x:S y:I> pasara a ser el tipo del mensaje (1@1 changeX). 
 
--- 
2/11/99
- Observacion: La inseminacion del metodo no controla que el tipo del receptor sea una subclase del metodo que se esta inseminando...

- el TiMethodNode tien que saber donde inseminar los argumentos y como obtener los resultados. 

---
1/11/99
| a |
a := TestObject new.
a sevenMax: 5.0.
a testMessage.
a multiReturn
method inheritance

| args |
args := Array 
			with: (TypeVariable new
					seed: (TestObject new atomicType);
					seed: (7 atomicType))
			with:  (TypeVariable new
					seed: #hola atomicType;
					seed: 'chau' atomicType).
(args collect: [:each | each atomicTypes asArray]) cartesianProduct  

OrderedCollection ((<SmallInteger> <Symbol> ) (<SmallInteger> <String> ) (<TestObject> <Symbol> ) (<TestObject> <String> ) )

{ #($a $b) asSet. #(1 2) asSet} asSet cartesianProduct
 OrderedCollection (($a 1 ) ($a 2 ) ($b 1 ) ($b 2 ) )


- Para quienes se 

- Reemplazar las OrderedCollection de los argumentos por Arrays.

"