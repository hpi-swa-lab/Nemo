spanish documentation
esqueletoTesis
"
[] Reconocimientos

[] Por que Squeak
	- Es un proyecto colaborativo. 
		- No esta destinado a quedar 'archivado'
		- Hay un marco para compartir e intercambiar ideas
	- Queda para que pueda ser reutilizado por la comunidad mundial
	- Hay mucha gente interesada
		- En seguir investigando
		- En utilizarlo para otro provecho
		- Puede conocerlo a traves de un swiki
	- Utilize los MorphicWrappers
	- Dwight (squeak.org)
	- Idea central: es malo tener soporte tecnico.
		- invita a los usuarios a crear herramientas.	

[] Por que no los tipos
	[] Tecnica
		- Ejemplo que limite el reuso (ejemplo de David N Smith)

	[] Filosofica
		- El formalismo aleja al usuario final
		- 'The purpose of the Smalltalk project is to provide computer support for the creative spirit in everyone' Daniel HH Ingalls. Design Principles behind Smalltalk. 
		- Lo que se interpone entre la maquina y el hombre se llame formalismo.
		- Un lenguaje con menos reglas es mas accesible. Un obstaculo menos.
		- Requiere la anticipacion de los tipos que llevaran las variables en tiempo de ejecucion. Hay que imaginarse por adelantado *toda* la solucion.
		- drawOn: seed: (no tengo que preocuparme) analogia con construccion. Tener todos los materiales (incluso medidos) antes de tener los planos.

[] Inferencia de tipos
	- Introduccion.
	- Necesitamos un sistema de inferencia de tipos 

[] Describir algoritmo CPA
	- variables de tipo
	- templates
	- idea del algoritmo (no mezclar tipos)
	- analogia sugerida entre runtime y ti

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
		

	 
      [] Diff con Ole
	- Que es lo que nos dice Ole
		- Ole nos da un algoritmo 

	- Limitaciones practicas de la teoria.
		- No hay implementaciones funcionando
			- Complejidad. Es posible??
		- Problemas propios de Smalltalk. (minimizados en ciertos papers con respecto a Self)

	- Mejoras 
	- Cambios
	- Simplificaciones
	- Aporte Teorico: tratamiento de las variables de instancia.
		Sin esto es impensable 
		Descartamos la hipotesis implicita que las variables no cambian su tipo.
		En Smalltalk las variables nacen como nil.
	- Cambios de estado

	- Idea central del CPA.

[] Aportes
	- Slot (Valeria)
		- Habilita mas de una aplicacion distinta para TI.

	- Variables de instancia
	- Implementacion 
		- no hay ninguna disponible

[] Aplicaciones
	- nuevas
	- interpretacion abstracta

[] Ideas sueltas
	- Desde el punto de vista academico se lo considera resuelto, pero no hay implemtaciones satisfactorias. 


"