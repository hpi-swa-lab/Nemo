search
expressionText: aSel
	"Generate the expression for one call (data2 extent: data1) as text"
	^String streamContents: [:strm | 
		strm nextPutAll: self newData1.
		aSel keywords doWithIndex: [:key :ind |
			strm space; nextPutAll: key.
			(key last == $:) | (key first isLetter not) ifTrue: [
				strm space; nextPutAll: (self newDataN: ind+1)]]]
