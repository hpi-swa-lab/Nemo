public
newTemplateIn: categoryString
	^String streamContents: [:stream |
		stream
			nextPutAll: 'Trait named: #NameOfTrait';
			cr; tab;
			nextPutAll: 'uses: {}';
			cr; tab;
			nextPutAll: 'category: ';
			nextPut: $';
			nextPutAll: categoryString;
			nextPut: $' ]