as yet unclassified
inAConditionalContext: aBoolean.
	conditionalContext := aBoolean. 
	receiver inAConditionalContext: (self imAppearToBeConditional or: aBoolean ).
	arguments do: [:each | each inAConditionalContext: self imAppearToBeConditional].

