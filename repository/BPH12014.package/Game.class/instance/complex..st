accessing
complex: collection
	
	^ collection asPipe
		select: [ :q | | temp |
			temp := (q at: 'is_answered').
			temp ];
		collect: [ :q | Dictionary new 
			add: 'title' -> (q at: 'title');
			add: 'id' -> (q at: 'accepted_answer_id');
			yourself ];
		do.