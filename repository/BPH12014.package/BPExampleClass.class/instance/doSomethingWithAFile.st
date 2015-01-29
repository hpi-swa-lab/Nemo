as yet unclassified
doSomethingWithAFile

	| fileContents |
	fileContents := (FileStream readOnlyFileNamed: '/root/test') contentsOfEntireFile.
	^ fileContents