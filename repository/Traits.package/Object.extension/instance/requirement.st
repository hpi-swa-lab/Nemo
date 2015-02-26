*Traits
requirement
	| sender |
	sender := thisContext sender.
	^ NotImplemented signal: ('{1} or a superclass should implement {2} from trait {3}' format: {self className. sender selector. sender method originalTraitMethod methodClass})