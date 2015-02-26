printing
printHierarchy
	"For hierarchy view in the browser; print the users of a trait"
	^String streamContents:[:s| self printUsersOf: self on: s level: 0].