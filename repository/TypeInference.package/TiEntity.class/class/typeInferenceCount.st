queries
typeInferenceCount
	"
	TiEntity typeInferenceCount
	"
	| counts |
	Smalltalk garbageCollect.
	counts := SortedCollection sortBlock: [:x :y | (x at: 1) > (y at: 1)].
	Cursor wait showWhile: 
		[self allSubclasses do: 
			[:class | counts add: (Array with: class instanceCount with: class name)]].
	(StringHolder new 
		contents: (String streamContents:
					[:stream | 
					counts do: [:each |
						stream
							tab; print: (each at: 1);
							tab; tab; nextPutAll: (each at: 2);
							cr]]))
		openLabel: 'Instance Count'

