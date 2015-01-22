filtering
filterClasseNames: aClassNameList understanding: aMessage
	^ aClassNameList select: [ :className | (Smalltalk at: className) includesSelector: aMessage asSymbol ]
	