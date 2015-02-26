operations
notifyOfRecategorizedSelector: element from: oldCategory to: newCategory
	super notifyOfRecategorizedSelector: element from: oldCategory to: newCategory.
	self users do:[:each| each classify: element under: newCategory from: oldCategory trait: self].