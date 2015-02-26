instance creation
named: aSymbol uses: aTraitComposition category: aString env: anEnvironment
	| trait oldTrait systemCategory |
	systemCategory := aString asSymbol.
	trait := anEnvironment at: aSymbol ifAbsent: [nil].
	(trait == nil or:[trait isMemberOf: Trait]) ifFalse: [
		^self error: trait name , ' is not a Trait'].

	oldTrait := trait shallowCopy.
	trait ifNil:[trait := Trait new].

	trait
		setName: aSymbol
		andRegisterInCategory: systemCategory
		environment: anEnvironment.

	trait uses: aTraitComposition.
	
	"... notify interested clients ..."
	oldTrait ifNil:[
		SystemChangeNotifier uniqueInstance classAdded: trait inCategory: systemCategory.
	] ifNotNil:[
		SystemChangeNotifier uniqueInstance traitDefinitionChangedFrom: oldTrait to: trait.
		systemCategory = oldTrait category  ifFalse:[
			SystemChangeNotifier uniqueInstance class: trait 
				recategorizedFrom: oldTrait category to: systemCategory].
	].
	^ trait