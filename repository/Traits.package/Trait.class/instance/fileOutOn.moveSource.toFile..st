fileIn/Out
fileOutOn: aFileStream moveSource: moveSource toFile: fileIndex
	super fileOutOn: aFileStream moveSource: moveSource toFile: fileIndex.
	self classSide hasMethods ifTrue:[
		aFileStream cr; nextPutAll: '"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!'; cr; cr.
			self classSide
				fileOutOn: aFileStream
				moveSource: moveSource
				toFile: fileIndex].