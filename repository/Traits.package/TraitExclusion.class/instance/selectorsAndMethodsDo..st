composition
selectorsAndMethodsDo: aBlock
	"enumerates all selectors and methods in a trait composition"
	^subject selectorsAndMethodsDo:[:sel :meth|
		(exclusions includes: sel) ifFalse:[aBlock value: sel value: meth].
	].