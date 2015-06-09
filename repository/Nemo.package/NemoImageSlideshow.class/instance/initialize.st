as yet unclassified
initialize

	super initialize.
	self imageMorphs: OrderedCollection new.
	FileDirectory default fileNames do: [ :fileName |
		(fileName endsWith: '.png') ifTrue: [
			self imageMorphs add: (ImageReadWriter formFromFileNamed: fileName) asMorph]].