composition
includesSelector: selector
	"Answers true if the receiver provides the selector"
	^(subject includesSelector: selector) and:[(exclusions includes: selector) not]