as yet unclassified
testCollectionMaker
" self new testCollectionMaker"
CollectionInferenceBaseTest allSubclassesDo: [
	:sc | 
	(CollectionInferenceBaseTest methodDict keys select: [ :each | each beginsWith: 'size' ])do: [
		:sl | 
			('*:*' match:sl) ifFalse:[
				sc compile: 'test', sl capitalized, Character cr asString,  ' ^self baseTypeTest: ''', sc name, ' new ', sl, '.''.'   classified: 'testing'.
			].
	]
]
