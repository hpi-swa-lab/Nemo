initialization
reset
	Transcript 
		cr; 	nextPutAll: '---- Reseting Type Inference State ----'; endEntry.
	compiler := TiCompiler new.
	interpreter := TiInterpreter new.
	classes := Dictionary new.
	typeMemory := Set new.
	"self installMethods"