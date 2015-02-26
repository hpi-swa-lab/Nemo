accessing
addTraitUser: aTrait
	users := users copyWith: aTrait.
	subject addTraitUser: aTrait.
