challenging
score
	| score |
	score := success / (success + fail).
	^ (score * 100) rounded