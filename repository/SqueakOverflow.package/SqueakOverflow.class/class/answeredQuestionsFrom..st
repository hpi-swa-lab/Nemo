filters
answeredQuestionsFrom: aQuestionList
	"Returns a list of answered questions with their titles and their ID, from a list of questions"
	
	^aQuestionList asPipe
		select: [ :q | q at: 'is_answered' ];
		collect: [ :q | Dictionary new 
			add: 'title' -> (q at: 'title');
			add: 'id' -> (q at: 'accepted_answer_id');
			yourself ];
		do.