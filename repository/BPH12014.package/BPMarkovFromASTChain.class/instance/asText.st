converting
asText
	| resultText |
	resultText := self selector asText.
	^ resultText append: ' (' , self count asString , ')'