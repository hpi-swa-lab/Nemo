as yet unclassified
initialize

		super initialize.
		self layoutPolicy: NemoListLayout new.
		self imageMorphs: OrderedCollection new.
		FileDirectory default fullNamesOfAllFilesInSubtree do: [ :fileName |
				(fileName endsWith: '.jpg') ifTrue: [
						self imageMorphs add: ((SketchMorph fromFile: fileName) keepAspectRatio: true; extent: 300@300). ] ].
		self currentIndex: self imageMorphs size.
		self stepAt: 2000; startStepping.