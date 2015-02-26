accessing
removeTraitUser: aTrait
	users := users copyWithout: aTrait.
	subject removeTraitUser: aTrait.