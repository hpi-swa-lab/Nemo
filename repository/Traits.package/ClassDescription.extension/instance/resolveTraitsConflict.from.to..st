*Traits-NanoKernel
resolveTraitsConflict: aSelector from: oldMethod to: newMethod
	"Resolve a traits conflict. Rules:
		- If one method is required the other one wins
		- Otherwise we compile a traits conflict
	"
	| marker selector |
	oldMethod methodHome == newMethod methodHome ifTrue:[^oldMethod].
	marker := oldMethod markerOrNil.
	(#(requirement explicitRequirement subclassResponsibility shouldNotImplement) includes: marker)
		ifTrue:[^newMethod].
	marker := newMethod markerOrNil.
	(#(requirement explicitRequirement subclassResponsibility shouldNotImplement) includes: marker)
		ifTrue:[^oldMethod].
	"Create a conflict marker"
	selector := #(conflict conflict: conflict:with: conflict:with:with: conflict:with:with:with:
	conflict:with:with:with:with: conflict:with:with:with:with:with: conflict:with:with:with:with:with:with:
	conflict:with:with:with:with:with:with:with:) at: oldMethod numArgs+1.
	^TraitDescription class compiledMethodAt: selector.