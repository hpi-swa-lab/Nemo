spanish documentation
listaDeTareas
"
Para la tesis:
	[fg 2/25/2000 18:11] Cambiar los nombres:
		- TiBlockNode a TiBlockDefinitionNode. 
		- TiBlockExpression a TiBlockNode.
		- TiCompiledMethod a TiAnalyzedMethod
		- TiCompiledBlock -> TiAnalyzedBlock

*Must*
[] Errores. El metodo Object error: termina llamando a una Exception que termina abriendo un Debugger. Queda claro que no hay que analizar el codigo del debugger. 

[] Modelar la clase JuegoDeArgumentos (o Contexto quizas) que distinga entre el receptor y demas. Aprovechar esto en los bloques (TiBlockDefinitionNode seedArguments:) y el perform (TiPrimitive primitivePerform).
 
[x] Sincronizar self y sus variables de instancia
	- No funciona correctamente. Falla la sincronizacion de self a las variables de instancia. Cuando se agrega un slot a self, deberia agregarse un slot a cada una de las variables de instancia y sincronizarlas. Ver TPoint changeSomething. 

[] Bloques:
	[] Escribiendo la tesis, llegue a la siguiente conclusion. Los bloques tienen pseudo argumentos que son las referencias a las variables del home. Cuando un bloque se envia como parametro, implicitamente se estan enviando estos pseudo-argumentos. Por ejemplo, en la expresion (x>0 ifTrue: [x_1. y_1] ifFalse: [x_'bye']), x e y son pseudo-argumentos del mensaje #ifTrue:ifFalse:. El producto cartesiano de este mensaje, debe realizarse tambien con los pseudo-argumentos. De esta forma, obtenemos en forma 'gratuita' la combinacion de los caminos de ejecucion. Es gratuita porque utilizamos el mecanismo de combinacion de resultados en el resultSlot de cada argumento. (fg 4/9/2001 17:57)

	[] Convertir en argumentos las referencias a las variables del home
		- Usar los siguientes metodos para probar:
		aTObject blockWithHomeRefs
		aTPoint changeXInsideBlock.
	[x] Instalar el bloque en el CompiledMethod
	[x] Agregarle el diccionario de inseminaciones al bloque.
	[] Ver por que TObject messageInsideABlock no infiere ningun tipo.
		- self es una referencia al home. Deberia solucionarse cuando esto se implemente.
	[BUG] No se genera correctamente el parse tree del bloque de sentencia del whileTrue:. ver como falta el nodo de return en  aTObject testWhileTrue.
	[x] Hacer que las asignaciones que se encuentran dentro de un bloque NO agregen nuevos slots a las variables. Ej: 
		TObject class assignementInsideBlock
		deberia devolver  [<Float><String>] 
		- Hay que tocar TiAssignmentNode makeConnections.
		[x] transformar las referencias a variables del metodo en parametros.
	[] Idem anterior para los argumentos de los mensajes
	[x] Contemplar los argumentos en los bloques
	[] Igualdad entre bloques
[] Revisar las shared variables. Mirar en TObject randomBoolean y TObject multiAssign
[] BraceNode y CascadeNode
[] Recursividad. Se detecta, pero como resolverla??
	- Hay que redefinir la igualdad de los bloques.	
[] Pensar que hacer con los valores ingresados por el usuario


*Should*
[] Primitiva perform:
	[] El problema es que al momento de analizar esta primitiva, uno cuenta con el tipo <Symbol>, pero no con el valor del mismo. Si para cada symbol tuviesemos un tipo distinto (ej: <Symbol #yourself> <Symbol #printOn> etc.), entonces tendriamos el valor para analizar el perform. Pero comenzarian a proliferar inseminaciones con los distintos tipos de symbol... 
	fg 2/25/2000 16:07 Algo estuve haciendo... 
	- Hice un tipo distinto para los simbolos. TiSymbolType.
	Quedo bastante parecido al TiBlockType. Quizas sea necesario hacer una superclase para todos los tipos provenientes de literales. La idea es conservar los literales todo lo posible dentro de los tipos. 
	- Tuve que retocar xxxLookupMethod y xxxSendMessage. Habria que hacerlo bien.
	- Queda pendiente investigar como hacer para no quedar con dos inseminaciones del tipo <#hello> size y <#bye> size. 
- Otras primitivas 
	- at: at:put: nextObject nextInstance etc...
	[] primitiveAdd
		Si esta habilitada la preferencia para que devuelva LargeIntegers, entonces se crea el tipo correspondiente. 
		Creo que esta mal hacerlo ahi. Segun el BlueBook si el resultado no puede representarse con un SmallInteger, entonces falla la primitiva.  Al fallar se termina analizando otro codigo que termina creando los LargeIntegers. 
[] Convertir el diccionario de variables de instancias de TiReceiverVariable en un array. 
	- El responsable de conocer instVarNames deberir ser TiClass (y no TiObjectType como ahora).
	[] Si tengo 2 tipos para los puntos (<Point x: <Float> y: <Float>> y  <Point x: <SmallInteger> y: <SmallInteger>>), entonces en cada TiType estoy repitiendo el array con los nombres de las variables de instancia. Esto deberia estar en TiClass y la exactClass de TiType una referencia a la misma.

	[] TiType exactClass deberia devolver una TiClass (y no una Class como ahora).
[x] Refactorizar TiTemplate, TiMethodNode y crear TiCompiledMethod
	ver TiNode class inferenceTime.
[] Indexacion de templates inseminados
	- Analliza p multiReturn isNil y luego fijarse las inseminaciones de Object>>isNil.... mucho desperdicio.
	- Sobre un Inferencer limpio analizar:
		p returnOne
		q returnOne
	donde p y q son TPoints. 
	TObject es el que implementa #returnOne, asi que en su methodDict van a quedar las inseminaciones correspondientes a <TPoint  ?> y <TPoint ?>. Claramente esto es ineficiente la forma de indexar los templates. Como returnOne no accede al estado del receptor, entonces bastaria con inseminarlo una vez y que su clave en el diccionario sea <*>. 
	Si p := TPoint x: 1 y: 1. q := TPoint x: 1.0 y: 1.0. y 
		p changeX
		q changeX
	se ingresaran dos entradas en el method dictionary de TPoint, uno para <TPoint x:<SmallInteger> y:<SmallInteger>> y otro para <TPoint x:<Float> y:<Float>>. La forma mas eficiente de expresarlo es:
	type => (type expand typeAt: #x) replaceWith: Symbol asType
	
	[] Tener cuidado con esto ultimo. 14/12/99 
		- No es tan facil el tema de los asteriscos. Los cambios pueden depender de otros argumentos que no son alterados.
		TPoint>>conditionalChangeX
			y isInteger ifTrue: [x := #tomatoe].
			y isFloat ifTrue: [x := 'potatoe'].
		- Point x: Int y: Int 		=> Point x: Symbol y: Int
		- Point x: Int y: Float 	=> Point x: String y: Float 
		[] Habria que llevar registro de las variables de instancia que se referencian a lo largo de la cadena de llamadas. Las variables que no son referenciadas pueden convertirse en asteriscos. Ej:
		TPoint>>x
			- TPoint x: Int y: Int 					=> Int
			- TPoint x: Int y: Float				=> Int
			- TPoint3D x: Int y: Int z: Int			=> Int
			- TPoint3D x: Int y: Float z: Float		=> Int
			etc, pueden ser reemplazadas por
			- TPoint x: Int => Int
		- Lo mismo pasaria con TPoint>>indirectX
		- TPoint>>conditionalChangeX referencia tambien a la variable 'y' entonces se conserva en las inseminaciones. Pero en el caso de una inseminacion con un TPoint3D, no hace falta conservar la 'z'. 
		- Con todo esto se plantea un problema cuando aparece '^ self'. Si sucede esto, pareceria que no se pueden utilizar los asteriscos. Ej: 		Object>>yourself 
			- TPoint x: Int y: Int 	=> Point x: Int y: Int
			- TPoint ?				=> Point ?
			- TPoint3D ?				=> TPoint3D ?			

[] Refactorizar TiPrimitive
	- separar el 'selector' de los argumentos y utilizar un diccionario con las primitivas ya analizadas.

	[x] Mejorar el manejo de primitvas
		- Mas 'descriptivas' en cuanto a la cantidad y tipo de los argumentos que espera, asi como si nunca fallara.
		- Hay que analizarla en el momento que se construye el TiMethodNode.
	- ...Ahora se me ocurre que podriamos tener 'templates' para las primitivas. Ej: 
	<primitiveAdd> SmallInteger SmallInteger => SmallInteger
	<primitiveMakePoint> SmallInteger SmallInteger => Point x:SmallInteger y:SmallInteger
	<primitiveMakePoint> Float Float => Point x:Float y:Float
	Algunas especiales como <primitiveClass> o <primtiveNew> varian segun el receptor. Hay dos posibilidades: tratarlas como templates (ie en un diccionario se guardan las inseminaciones y su resultado) o 'simularlas' como estoy haciendo ahora.
	[] Reemplazar las expresiones del tipo 1.0 type por Float asType (ej #primitiveAsFloat).

[] Optimizacion de las conexiones.
	Una vez que se tengan las conexiones necesaria entre los slots, seria bueno reemplazarlos por unos 'bytecodes' especiales. Con el objetivo que los templates sean mas compactos (dada la gran cantidad que existe), la idea es sacarle la logica de 'ejecucion' a los slots y ponerla en el interprete abstracto.
[] Investigar que pasa con los metodos recursivos
[] Nuevo tipo para que guarde el WillNotUnderstand
	- Hacer que el TiInterpreter re-envie el #doesNotUnderstand: 
[] Mejorar la forma de calcular el producto cartesiano
[x] El push y pop de los context deberia hacerlo el interprete y no el metodo (como esta ahora).
[] Variables globales.



*Nice to have*
[] Test suite
[] Optimizacion de los templates
[] Range Analysis 
	- Una alternativa seria VerySmallInteger (0..255)
	[x] Agregue la Preference inferLargeIntegers, que si esta deshabilitada solo trabaja con SmallIntegers.
[] Los pares ordenados normalmente se implementan con un Array. Para no perder precision en estos casos, seria bueno tener un VerySmallArray.
[] Implementar TypeSet heredando de Set y con un entero que sera interpretado como una mascara que indica si cierto tipo esta en el conjunto. 
[] Ampliar los tipos con los mensajes que entiende (para usar dentro de un MessageBrowser). Los tipos tendrian que tener una referencia al tipo de su superclase, para no tener que repetir los mensajes.
[] TiDebugger para ir viendo como avanza la inferencia de tipos
[] Soporte para acceder a los templates analizados desde la clase
[] Soporte para acceder a las inseminaciones desde el metodo.
[] Borrar los templates inseminados cuando se recompila el metodo correspondiente
[] Los CompiledMethods que envian algun mensaje a super tienen en su literal frame un Association cuyo value es la clase en cuyo method dictionary se encontro el CompiledMethod. Quizas convendria replicar este esquema para los TiCompiledMethod.
[] fg 1/7/2000 12:33. Hace un par de dias agregue la clase y el selector al TiCompiledMethod. Si el metodo puede conocer la clase, entonces la variable del receptor (self) podria tener un array con las variables de instancia (con el mismo orden que el que tienen en tiempo de ejecucion). Luego, para hacer el merge entre self y una de sus variables de instancia, no necesito acceder por nombre sino por posicion. Es decir que reemplazaria el argumento de TiObjectType instVarTypeAt: de un symbol a un entero.
	- Ahora, los nombres de las variables de instancia los conoce el tipo. Dicha responsabilidad deberia ser de la TiClass y tanto el TiType como el TiCompiledMethod deberian referenciar a TiClass (y no Class como esta ahora).


*Done*

[] Nueva jerarquia de TiType. 
A medida que van apareciendo nuevos tipos los voy agregando a la 'typeMemory' (que es un Set).  Para que esto funcione, las subclases de TiType tiene que redefinir #= y #hash. El problema es que en TiObjectType puede cambiar el hash... entonces tengo que sacarlo del Set y volverlo a agregar... otra solucion mas eficiente??

*Para escribir*

[] Analogia entre Send, bloque y primitiva.
	- Una primitiva se diferencia del send en que no hay method lookup (ie. el binding es estatico) y como siempre se encuentran al comienzo del metodo -y estos son inseminados monomorficamente-, no es necesario realizar el producto cartesiano. Sabemos que solamente basta con analizar el conjunto de argumentos con que fue inseminado el metodo.
	- Una primitiva puede fallar por otras razones mas alla del tipo de los argumentos. Ej: division por cero. Ver como se mezclan los tipos en TiCompiledMethod internalSeedArguments:.
	- Un bloque tiene mas que binding estatico... es como un metodo 'inlineado'. Al igual que los mensajes se los puede llamar con distintos parametros,  por lo que hay que llevar un registro de cada una de las inseminaciones por separado.

[] Una metrica de la eficiencia de TI es fijarse el grado de crecimiento con respecto al run-time (lineal, exponencial, etc)

[] Ideas para los hyperbrowsers:
	- Que la seleccion este guiada por el parse tree (argumento y mensaje)  y no por la representacion textual (palabra o linea).
	- Hacer un menu sensitivo a lo que este seleccionado del metodo. (Si selecciono un selector, su menu incluira senders e implementors)
	- El resultado de la inferencia de tipos podria mostrarse en un ballon.

"