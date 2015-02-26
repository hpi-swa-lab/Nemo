load-unload
convertClassToTrait: aClass
	"Convert the given class to a trait"
	| aTrait |
	"Move the class out of the way"
	aClass environment removeKey: aClass name.

	"Create the trait in its place"
	aTrait := Trait named: aClass name
				uses: {}
				category: aClass category.

	aClass organization commentRemoteStr ifNotNil:[
		aTrait classComment: aClass organization classComment 
				stamp: aClass organization commentStamp].

	aClass selectorsAndMethodsDo:[:sel :meth|
		aTrait compile: (aClass sourceCodeAt: sel)
			classified: (aClass organization categoryOfElement: sel)
			withStamp: (aClass compiledMethodAt: sel) timeStamp
			notifying: nil].

	aClass classSide selectorsAndMethodsDo:[:sel :meth|
		aTrait classSide compile: (aClass classSide sourceCodeAt: sel)
			classified: (aClass classSide organization categoryOfElement: sel)
			withStamp: (aClass classSide compiledMethodAt: sel) timeStamp
			notifying: nil].

	aClass obsolete.
	^aTrait
