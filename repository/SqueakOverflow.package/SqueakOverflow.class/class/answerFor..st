utilities
answerFor: aString
	"Do a feeling-lucky search on StackOverflow for tag smalltalk and the given term. Return text of the first answer."

	| allQuestions answeredQuestions openQuestions |
	
	allQuestions := self questionsFor: aString.
	
	answeredQuestions := allQuestions asPipe
		select: [ :q | q at: 'is_answered' ];
		collect: [ :q | Dictionary new 
			add: 'title' -> (q at: 'title');
			add: 'id' -> (q at: 'accepted_answer_id');
			yourself ];
		do.
		
	openQuestions := allQuestions asPipe
		select: [ :q | (q at: 'is_answered') not ];
		select: [ :q | (q at: 'answer_count') > 0];
		collect: [ :q | Dictionary new 
			add: 'title' -> (q at: 'title');
			add: 'id' -> (q at: 'question_id');
			yourself ];
		do.
	
	^('\Questions with accepted answers: \ - ', 
		((answeredQuestions collect: [ :q | q at: 'title' ]) join: '\ - '),
		'\Questions that have not been marked as answered: \ - ', 
		((openQuestions collect: [ :q | q at: 'title' ]) join: '\ - ')) withCRs.