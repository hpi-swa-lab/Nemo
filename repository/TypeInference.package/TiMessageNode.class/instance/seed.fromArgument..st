type propagation
seed: aType fromArgument: anInteger
"	selector = #setContents: ifTrue:[ self halt ]."
	
	self refreshCartesianProductWith: aType forArgument: (anInteger + 1).
	cartesianProduct isNil ifTrue: [^ self].
	cartesianProduct do: [ :argTypes | 
		self seedResult: 
			(results at: argTypes ifAbsentPut: [
				[(TiSystem current interpreter
									sendMessage: selector
									withArgs: argTypes
									receiverNode: self receiverNode
									from: conditionalContext )]
					on: Error do: [:ex |
						self flag: #tfel.
						TiMessageResult new
							setReceiver: {argTypes first} asSet
							arguments: argTypes allButFirst asOrderedCollection
							return: {argTypes first} asSet
					]
			])
].
"	selector = #setContents: ifTrue:[ self halt ]."
	
					
							
								
							