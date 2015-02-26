accessing
category
	"Answer the system organization category for the receiver. First check whether the
	category name stored in the ivar is still correct and only if this fails look it up
	(latter is much more expensive)"

	| result |
	category ifNotNilDo: [ :symbol |
		((SystemOrganization listAtCategoryNamed: symbol) includes: self name)
			ifTrue: [ ^symbol ] ].
	category := (result := SystemOrganization categoryOfElement: self name).
	^result