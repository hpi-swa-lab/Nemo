spanish documentation
disenio
"
----
[] Tipos 
- Que es un tipo?
	El tipo de un objeto es la clase a la que pertenece. 
	En Squeak hay diferentes tipos de clases:
		- 
	- El tipo esta compuesto por los tipos de las variables de instancia.
		- puede ir cambiando
	- Relacion entre objetos y tipos
	- typeMemory

	- Aqui no es necesario el concepto de ordenamiento parcial entre tipos (ie. relacion 'subtipo de'), ya que nunca se realizan comparaciones entre ellos. 	

[] Temas de implementacion
	- Cuando un tipo se expande cambia su hash. Entonces es necesario eliminarlo y voverlo a agregar en la typeMemory (que es un Set).

----
[] Explicacion del disenio
	- Conceptos 
		- concepto de tipo. contar clase e interfaz.
		- memoria de tipos 
		- variable de tipo. slots.
		- conexion entre variables
			- generacion de slots
			- dibujos
		- Template:
			como se conectan los nodos (TiCompiler)
			- armado
			- conexion 
			- inseminacion
			- resultado
		- No se guarda el template, sino su resultado en el CompiledMethod.
		- Como se guardan los resultados (indexacion)
		

		- Variables globales
		- Sincronizacion de self y sus variables de instancia.

"