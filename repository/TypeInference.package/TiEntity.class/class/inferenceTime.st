spanish documentation
inferenceTime
"
- Con la idea de producir templates mas compactos, seria bueno llegar a algo asi:
	TObject>>assignFromParameter: t1
		| t2 |
		t2 := t1.
		^ t2
	se 'compile' a
		[:rcvr :t1 | t1]


- El equivalente a las primitivas de run-time serian los metodos que retornan siempre los mismos valores (ej TObject returnOne). 
	TObject>>returnOne
		^ 1
	=> [:rcvr | 1 type]
	=> TObject>>returnOne [] :- [SmallInteger]

- Otro ejemplo:
	TPoint>>changeX
		x := #fruit
	=> TPoint>>changeX [:rcvr | (rcvr typeAt: #x) replaceWith: #fruit type]

- En caso que esto sea posible... como se crean los bloques dinamicamente? 
- Tambien esta la posibilidad de generar el codigo e 'instalarlo' en un metodo. Esto tiene la ventaja que luego se puede corregir a mano.


---

- TiCompiledMethod: tiene la primitiva y el typeFlowGraph, donde typeFlowGraph es un TiMethodNode (incluyendo los argumentos). Aunque la primitiva podria estar en el TiMethodNode, es mejor ponerlo en el TiCompiledMethod para aquellos casos donde no se necesite el type flow graph. (Nuevamente esto es equivalente a aquellos CompiledMethod que solo tiene un header y no poseen bytecodes).  En este caso el interprete abstracto sera el encargado de ver si fallara la primitiva (en el caso que haya).
	- TiCompiler:  es el que construye los TiCompiledMethod (para eso usa el visited)
	- TiContext: se crea a partir de un TiCompiledMethod. Si el compiled method tiene tiene una primitiva, entonces se crean slots iniciales; si es un metodo normal, entonces los slots iniciales son los del type flow graph. Ver TiAnalyzedContext buildMethod:arguments:temporaries:block:primitive:.
- Las variables de instancia agregadas al template ( primitive initialSlots returnSlot ) se necesitan cuando hay un primitiva que nunca falla y entonces la variable method queda en nil.

-Run-time vs ti-time
	- source code 				= ti-tree 
	- bytecodes					= nodos del ti-tree

	- bytecodes 					= type flow graph o (ti-tree conectado)
	- ejecucion de bytecodes		= propagacion de tipos 
	- compilacion( source code ) = conexion( ti-tree ) aunque esta conexion puede desencadenar la propagacion de tipos (con lo cual a los bloques hay que dejarlos sin conectar, hasta que le llegue el mensaje que dispare la evaluacion).
	- instruction pointer del bloque apuntando a los bytecodes del metodo = tipo del bloque con una referencia al subgrafo dentro del type flow graph.

La 'compilacion' tiene algunos efectos de ejecucion.

- En run-time la ejecucion puede tener efectos colaterales, en ti-time la interpretacion abstracta es idempotente (ie. ejecutarla varias veces da el mismo resultado, entonces puedo ir cacheandolos).

"