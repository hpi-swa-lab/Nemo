type propagation
makeConnections

	results := Dictionary new.
	receiver makeConnections.
	arguments do: [:each | each makeConnections].
	"I dont need to connect the arguments to me, since 
	the TiArgumentNodes are built with a reference to me"
