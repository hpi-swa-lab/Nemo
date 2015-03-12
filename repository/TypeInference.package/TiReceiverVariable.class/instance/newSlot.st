accessing
newSlot
	"Cuando se agrega un slot a self, deberia agregarse un slot a cada una de las variables de instancia y sincronizarlas "
	"self halt."
"	(thisContext sender selector = #initialize or: [ thisContext sender selector = #argumentResultSlot ]) ifFalse: [ self halt ]."
	^super newSlot.