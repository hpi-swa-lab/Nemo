instance creation
resetUniqueInstance
	"self resetUniqueInstance"

	UniqueInstance
		ifNotNil: [:u | UniqueInstance := nil]