search
simpleSearch
	"Run through first arg's class' selectors, looking for one that works."

	| class supers listOfLists |
	class := thisData first first class.
	"Cache the selectors for the receiver class"
	(class == cachedClass and: [cachedArgNum = ((argMap size) - 1)]) 
		ifTrue: [listOfLists := cachedSelectorLists]
		ifFalse: [supers := class withAllSuperclasses.
			listOfLists := OrderedCollection new.
			supers do: [:cls |
				listOfLists add: (cls selectorsWithArgs: (argMap size) - 1)].
			cachedClass := class.
			cachedArgNum := (argMap size) - 1.
			cachedSelectorLists := listOfLists].
	listOfLists do: [:selectorList |
		selectorList do: [:aSel |
			resultsList detect: [:row | row first == aSel] ifNone: [
				((Approved includes: aSel) or: [AddAndRemove includes: aSel]) ifTrue: [
					(self testPerfect: aSel) ifTrue: [
						resultsList add: 
							{ aSel.   self expressionText: aSel.  (thisData at: 1) }.
							"  selector.    'data1 + data2'.   the first set of receiver and arg objects  "
						]]]]].
