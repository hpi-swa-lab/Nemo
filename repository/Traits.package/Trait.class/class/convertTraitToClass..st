load-unload
convertTraitToClass: aTrait
	"Convert the given trait to a class"
	| aClass |
	"Move the trait out of the way"
	aTrait environment removeKey: aTrait name.
	"Create the class in its place"
	aClass := Object subclass: aTrait name
				instanceVariableNames: ''
				classVariableNames: ''
				poolDictionaries: ''
				category: aTrait category.

	aTrait organization commentRemoteStr ifNotNil:[
		aClass classComment: aTrait organization classComment 
				stamp: aTrait organization commentStamp].

	aTrait selectorsAndMethodsDo:[:sel :meth|
		aClass compile: (aTrait sourceCodeAt: sel)
			classified: (aTrait organization categoryOfElement: sel)
			withStamp: (aTrait compiledMethodAt: sel) timeStamp
			notifying: nil].

	aTrait classSide selectorsAndMethodsDo:[:sel :meth|
		aClass classSide compile: (aTrait classSide sourceCodeAt: sel)
			classified: (aTrait classSide organization categoryOfElement: sel)
			withStamp: (aTrait classSide compiledMethodAt: sel) timeStamp
			notifying: nil].

	aTrait obsolete.
	^aClass
