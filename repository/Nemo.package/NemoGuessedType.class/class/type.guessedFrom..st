instance creation
type: aClass guessedFrom: aGuessingSourceSelector

	^ self new
		type: aClass;
		guessingSource: aGuessingSourceSelector;
		yourself