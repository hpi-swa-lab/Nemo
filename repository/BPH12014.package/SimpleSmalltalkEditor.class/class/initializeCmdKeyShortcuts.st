as yet unclassified
initializeCmdKeyShortcuts
	super initializeCmdKeyShortcuts.
	cmdActions at: $g asciiValue + 1 put: #guessIt:.
	cmdActions at: $h asciiValue + 1 put: #openMethodFinder:.
	cmdActions at: $j asciiValue + 1 put: #openFancyUi:.
	cmdActions at: $k asciiValue + 1 put: #guessItBySHParser:.
	cmdActions at: $f asciiValue + 1 put: #suggestHelp:.
	
	cmdActions at: 27 + 1 put: #noop:

	"self initialize"