operations
includesSelector: selector
	"Answers true if the receiver provides the selector"
	^(subject includesSelector: selector) or:[aliases anySatisfy:[:assoc| assoc key == selector]]