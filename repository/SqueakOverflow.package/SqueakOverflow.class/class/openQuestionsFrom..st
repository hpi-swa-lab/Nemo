filters
openQuestionsFrom: aQuestionList
	"Returns a list of answered questions with their titles and their ID, from a list of questions"
	
	^aQuestionList asPipe
		select: [ :q | (q at: 'is_answered') not ];
		select: [ :q | (q at: 'answer_count') > 0];
		collect: [ :q | Dictionary new 
			add: 'title' -> (q at: 'title');
			add: 'id' -> (q at: 'question_id');
			yourself ];
		do.