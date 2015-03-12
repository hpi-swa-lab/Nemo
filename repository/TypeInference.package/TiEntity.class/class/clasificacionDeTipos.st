spanish documentation
clasificacionDeTipos
"
[Un poco de historia]
[**citar mejor]
	En el principio estaban FORTRAN, ALGOL y Lisp. En todos ellos el programador solo debia decir lo que es necesario para ejecutar los programas. Como Lisp era interpretado, no se brindaba ninguna informacion de tipo. Como ALGOL y FORTRAN eran compilados, era necesario que los programadores especificaran informacion primitiva de tipos, como ser si una variable contenia un integer o un float, para que el compilador generase la instrucciones correctas. A medida que los lenguajes evolucionaron, se descubrio que agregando mas declaraciones estaticas de tipos, el compilador podria llegar a crear codigo mas eficiente. Por ejemplo, los procedimientos de PL/I tenian que ser explicitamente declarados como recursivos, asi el compilador podia usar una llamada mas rapida para los no-recursivos.

	Los programadores notaron que estas declaraciones estaticas podrian ser de gran valor en hacer mas entendible un programa. Hasta ese momento, el principal beneficiario de esas declaraciones era el compilador, pero con Simula y PASCAL nacio un movimiento; usar declaraciones para el beneficio tanto de humanos como de compiladores.

	Esta tendencia ha sido poco feliz. El problema es que la informacion que un humano necesita para entender un programa, o para razonar acerca de su correctitud, no es necesariamente la misma informacion que un compilador necesita para generar un programa mas eficiente. La mayoria de los lenguajes con declaraciones de tipos, confunden estas dos dimensiones, ya sea limitando la eficiencia que podria ganarse con las declaraciones, o mas frecuentemente, limitando el reuso de codigo a tal extremo que los algoritmos se duplican y los sistemas de tipos deben ser enganiados. [SMI/95]


[Un nuevo enfoque]
	
	Un programa tiene dos lectores de codigo fuente muy distintos: el compilador o un ser humano[** generalmente el mismo programador. ]. Para cada uno de ellos los tipos se referiran a diferente clase de informacion. Al compilador le interesara la informacion mas precisa y de bajo nivel posible, de manera tal que pueda realizar optimizaciones al codigo objeto que genere. Por otro lado al ser humano le interesa la informacion mas abstracta y generica posible, pues esta mas interesado en dejar documentado la intencion de disenio. 
	
	Al referirnos a los tipos que le interesan al compilador hablaremos de tipos de implementacion (implementation types) y al referirnos a los tipos que le interesan al lector humano hablaremos de tipos de interface (interface types). 

	Los problemas que genera no tener en claro esta distincion, llevaron a Graver [GRA/89] a proponer un sistema de tipos estatico a Smalltalk con el doble proposito de ayudar al compilador a generar codigo mas eficiente y brindar documentacion al lector humano. Es notable que en este mismo trabajo el autor introduzca como conceptos diferentes la herencia de implementacion y la herencia de especificacion, siendo que los mismos corresponden a los tipos de implementacion y los tipos de interface. Incluso identifica que 'los tipos de interface (specification-based type system) denotan un conjunto no acotado de posibles implementaciones, con lo cual no puede ser utilizarse para realizar optimizaciones'. A la luz de esta nueva perspectiva sabemos que el compilador podra obtener poca informacion para realizar optimizaciones a partir de los tipos de interface. 

	Ole Agensen es el primero en hacer la distincion entre tipos de implementacion y tipos de interface [AGE/94]. Pero no llega a clasificarlos segun el lector (compilador o humano), sino que en su tesis de doctorado [AGE/96] introduce dos espectros para analizar los tipos: de concreto a abstracto (con los tipos de implementacion como los mas concretos y los de interface como los mas abstractos) y de general a especifico.


[Implementation Types]

	La informacion que el compilador requiere debe ser lo mas precisa y de bajo nivel posible para poder generar codigo eficiente. Por ejemplo en Smalltalk, los envios de mensajes son vinculados (bound) a los metodos en tiempo de ejecucion; si el compilador supiera la clase especifica del receptor de un mensaje, entonces podria realizar la busqueda del metodo (method lookup) y asi vincularlo estaticamente o, mejor aun, dejar la definicion del metodo embebida (in-lined). Si la clase no implementara el selector que se esta enviando como mensaje, entonces estamos en condiciones de detectar los errores del tipo #doesNotUnderstand.

	* Application delivery
	* Optimization (Static binding and optimization) 
	* Static checking (#doesNotUnderstand)
	* hyper-browsing
	* un objeto pertenece a una sola categoria de estos tipos en cada instante de tiempo.

	Los tipos de implementacion sirven para comprender como un programa utiliza una porcion de codigo, pero para determinar como utilizar una porcion de codigo, los tipo de interface brindan una mejor ayuda.
		
 	Para ejemplicar con lenguajes existentes trazamos una linea, poniendo en un extremo los lenguajes no tipados (Smalltalk) ya que los mismos no pueden brindar ningun tipo de informacion util al compilador. En el otro extremo se encuentran los lenguajes tipados donde no existe el polimorfismo (C) y de esta forma no hay ambiguedad en el momento de generar codigo. En la mitad de estos extremos se ubican lenguajes que utilizan sistemas de tipos basados en clases (C++) donde la aparicion de una clase en una expresion de tipo implica que solamente instancias de esa clase o subclases pueden aparecer durante la ejecucion. Mas sinteticamente:

	1. Lenguajes no tipados (Smalltalk). 
	2. Lenguajes basados en clases (C++).
	3. Lenguajes sin polimorfismo (C).


[Interface Types]

	Recordando que aqui el lector es el ser humano, los tipos de interface son utiles para comunicar intenciones de disenio e incluso como documentacion. Por ejemplo, si en Java se define que una funcion recibe como parametro algun objeto que cumpla con la interface Streamable, entonces basta con leer la definicion de esa interface para saber cuales son los metodos que hay que implementar. Con esto aumenta el nivel de granularidad, ya que con Streamable estoy denotando un conjunto de operaciones. La desventaja es que el tipado estatico implica redundancia y perdida de flexibilidad.
	
	* Aqui no existe una categorizacion en grupos disjuntos, sino que un objeto puede cumplir con varias interfaces al mismo tiempo.
 
	Otra alternativa es denotar el tipo mediante la definicion por extension del conjunto de mensajes que recibira. Por ejemplo, en Magnitude>>max: el tipo de interface del receptor debera ser { #> }.

	Haciendo el paralelo con lenguajes existentes, nos movemos en un eje especifico-general:
	- C se declara el tipo de implementacion.
	- C++ se declaran clases de implementacion (se confunden las dos perspectivas)
	- Java es el primer lenguaje popular que separa la jerarquia de implementacion de la jeraquia de especificacion. Aqui existen las interfaces.
	- Smalltalk: no existen los tipos

[Misconceptions]

	Cuando se habla de sistema de tipos, normalmente hay varias nociones que se dan por sobreentendidas, pero que son contraproducentes cuando hablamos de tipos de implementacion.

	La primera nocion es la existencia de un orden parcial entre los tipos, lo cual posibilita reemplazar la union de dos tipos distintos por su supertipo comun mas cercano (nearest common supertype). Esto simplifica el sistema de tipos eliminando la necesidad de tipos de union explicitos, pero al mismo tiempo estamos perdiendo informacion que el compilador podria utilizar. Por ejemplo, si A es superclase de B y C, y 'v' una variable que pude tener instancias de B o C, su supertipo comun mas cercano es <A>; pero utilizando tipos de union explicitos, la misma variable tendra tipo <B> + <C>.  [GRA/89]

	La segunda nocion, es el 'encapsulamiento' de los tipos. Para ejemplificar, si Smalltalk fuera tipado, un metodo que recibiera un punto se declararia como <Point> y no como <Point x: <Integer> y: <Integer>> o <Point x: <Float> y: <Float>>. Esto es asi porque en el primer caso estamos pensando en tipos de interface, mientras que en el segundo en tipos de implementacion. Un sistema de tipos se describe a partir de tipos basicos (Integer, Character, Boolean), constructores de tipos (SxT, S->T, S+T), y tipos parametrizados (Array(Integer), Set(Character)). Para los tipos de implementacion, seria mucho mas preciso si todos ellos fueran parametrizados sobre sus variables de instancia (ej: <Point x: <Integer> y: <Integer>>).

	Relacionada con la nocion de 'encapsulamiento', tenemos la nocion de 'inmutabilidad'. Esto quiere decir que un objeto conserva su mismo tipo a lo largo de toda su vida (un punto es siempre <Point>). Pero con tipos parametrizados un punto nace como <Point x: <UndefinedObject> y: <UndefinedObject>> y luego de recibir el mensaje #initialize pasa ser <Point x: <Integer> y: <Integer>>.

	Al estar esta informacion dirigida al compilador, lo mas conveniente es que el programador no tenga que tipar esto estaticamente, sino que la misma sea generada automaticamente por un motor de inferencia de tipos (implementation type inference engine).

[Statically Typed, Dynamically Typed y Untyped] [Type Errors]

	En un lenguaje tipado estaticamente, los chequeos de tipo se realizan en tiempo de compilacion, en uno tipado dinamicamente los chequeos se hacen en tiempo de ejecucion y en un lenguaje no tipado, directamente no se hace ningun chequeo de tipos. 

	Tradicionalmente los sistemas de tipos han enfatizado la deteccion de los errores de tipo. Si los errores de tipo que se pueden detectar corresponde a posibles errores en tiempo de ejecucion, entonces cabe preguntarse cuales son esos errores que pueden ser detectados. Si solamente se trata de asegurar que todos los mensajes enviados tienen un metodo que lo responde (es decir que no surgiran #doesNotUnderstand), entonces lo mismo se puede lograr en forma mas efectiva utilizando tipos de implementacion (que como vimos el programador nunca los explicita). 

	La hipotesis anterior se reafirma al encontrar la definicion de 'type-safe' en la tesis de Graver [GRA/89]. Alli explica que su sistema de tipos es seguro pues evita que un objeto reciba un mensaje que no entendera. 

	Si el tipado estatico se realiza sobre tipos de implementacion, se reducen las posibilidades de reuso de codigo a lo previsto inicialmente por el programador.

	El tipado estatico sobre tipos de interface tiene mucho mas sentido, y es una ayuda para que el lector humano sepa cuales son las operaciones que debe implementar cuando quiera reusar un codigo ya existente. A mi entender estas declaraciones estaticas introducen redundancia, pero al mismo tiempo aumentan el nivel de granularidad. 


[Implementation-Type Inference]

	[Introduccion]
	En los programas orientados a objetos el flujo de control y el flujo de datos estan acoplados a traves del uso extensivo de envio de mensajes que son dinamicamentes despachados [AGE/94].

	[Descripcion]
	Para implementar el motor de inferencia de tipos, se utilizo la tecnica de la interpretacion abstracta sobre el dominio de los tipos de implementacion. Es por eso que tenemos un TiAbstractInterpreter, y quizas mas adelante un TiAbstractDebugger



[Smalltalk]
	
	El hecho que Smalltalk sea no tipado implica que lo hace flexible pero al mismo tiempo dificil de aprender. Como no hay declaraciones para las variables, hay que averiguar que tipos de objetos se esperan. [GRA/89]
	
	[Aplicaciones de Type Inference - Browsing]
	Para realizar tareas de mantenimiento, el programador debe entender el codigo que realiza la tarea. Usualmente, este codigo esta dispersado en diferentes metodos, requiriendo que el programador siga el flujo de control a traves de las llamadas a los metodos. Esto lleva mucho tiempo y favorece los errores (error prone). En los programas orientados a objetos, este seguimiento puede ser aun mas dificil. [AGE/96]


[Ideas sueltas]

	[Static typing]
- Segun Graver [GRA/89] los dos principales problemas de Smalltalk causados por el uso uniforme del binding dinamico son:
	- codigo tradicionalmente no polimorfico y computation-intensive, no puede ser optimizado
	- errores de linkeo no pueden ser detectados estaticamente
	Ambos problemas pueden ser resueltos con inferencia de tipos de implementacion, sin necesidad de introducir declaraciones estaticas de tipos.
	
	[Problemas del tipado]
	Cuando hay una sola manera de hacer las cosas, es mas facil modificar y reusar codigo. Cuando hay reuso de codigo, los programas son mas faciles de cambiar y mas importante aun, se achican. Cuando un programa se achica, se necesitan menos personas para su construccion y mantenimiento, lo que permite encontrar nuevas posibilidades de reusar codigo. La consistencia lleva al reuso, el reuso lleva a la concisitud (de conciso...), la concisitud lleva al entendimiento. Por los autores de Self creen que es dificil justificar cualquier sistema de tipos que impida la reusabilidad; la duplicacion resultante lleva a un programa mas grande que luego es mas dificil de entender y corregir. [SMI/95]

	[Analisis de sistemas de tipos existentes]
	Al enfocar los sistemas de tipo existentes desde esta nueva perspectiva, se veran mas claramente los problemas que surgen al confundir estas dos dimensiones ortogonales. 

		Smalltalk no utiliza sistema de tipos.
		C++ utiliza un sistema de tipos basado en clases.
		C tiene un sistema de tipos de implementacion. 
		Java tiene un sistema de tipos de interface.


==================
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




[Bibliografia]

[AGE/94] Ole Agensen [1994] Constraint-Based Type Inference and Parametric Polymorphism. In First International Static Analysis Symposium, SAS'94, Springer-Verlag LNCS 864.

[AGE/96] Ole Agensen [1996] Concrete Type Inference: Delivering Object-Oriented Applications. Phd thesis Standford University. SMLI TR-96-52. http://www.cs.ucsb.edu/oocsb/self/

[AIK/90] Alexander Aiken, Brian R. Murphy [1990] Static Type Inference in a Dynamically Typed Language. ACM Trans, 279-290.

[SMI/95] Randall B. Smith and David Ungar [1995] Programming as an Experience: The Inspiration for Self. ECOOP '95 Conference Proceedings, Aarhus, Denmark, August, 1995. http://www.cs.ucsb.edu/oocsb/self/papers/programming-as-experience.html

[GRA/89] Justin Owen Graver [1989] Type-Checking and Type-Inference for Object-Oriented Programming Languages. Phd thesis - University of Illinois at Urbana-Champaign.

"


