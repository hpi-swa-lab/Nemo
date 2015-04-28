keyboard shortcut tables
initializeCmdKeyShortcuts
	super initializeCmdKeyShortcuts.
	cmdActions at: $j asciiValue + 1 put: #suggestHelpAST:.
	cmdActions at: $f asciiValue + 1 put: #suggestHelp:.
	cmdActions at: $q asciiValue + 1 put: #comboSuggest:.
	
	cmdActions at: 27 + 1 put: #noop:

	"self initialize"