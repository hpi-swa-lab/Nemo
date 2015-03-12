browsing
detailedBrowsePrimitives
	"
	TiEntity detailedBrowsePrimitives
	"
	| aColl method prim |
	aColl := OrderedCollection new: 200.
	Cursor execute
		showWhile: 
			[Smalltalk allBehaviorsDo: [:class | class
					selectorsDo: 
						[:sel | 
						method := class compiledMethodAt: sel.
						(method primitive ~= 0 and: [method isQuick not])
							ifTrue: 
								[prim := String
											streamContents: 
												[:s | 
												s nextPutAll: class name;
												 space;
												 nextPutAll: sel;
												 space.
												method printPrimitiveOn: s].
								aColl addLast: method primitive -> prim]]].
			aColl := aColl asSortedCollection collect: [:assoc | assoc value]].
	Smalltalk browseMessageList: aColl name: 'primitive messages'