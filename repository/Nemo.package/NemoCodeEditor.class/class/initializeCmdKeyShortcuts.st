keyboard shortcut tables
initializeCmdKeyShortcuts
	super initializeCmdKeyShortcuts.
	cmdActions at: $q asciiValue + 1 put: #comboSuggest:.
	
	cmdActions at: 32 + 1 put: #noop:

	"self initialize"