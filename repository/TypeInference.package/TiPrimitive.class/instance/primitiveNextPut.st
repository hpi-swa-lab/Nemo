as yet unclassified
primitiveNextPut
	| collectionType |
	 (self matchOrFail: {{WriteStream. nil}. {ZipEncoder. nil}}) ifNotNil: [
			
		collectionType := self receiver instVarTypeAt: #collection.
		(collectionType isOfClass: String ) ifTrue: [ 
			(arguments first isOfClass: Character) ifTrue: [
				^ self createResult addReturn: Character createType
			] ifFalse: [
				^ nil
			]
		].
		(collectionType isOfClass: Array) ifTrue: [
			collectionType addType: arguments first.
			^ self createResult addReturn: arguments first
		].
	].
	^ nil.
		
