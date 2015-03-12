logging
example
" self new example. "

" default configuration uses TranscriptLogWriter "
	Transcript open.
" default configuration use levels and is setted in warn level. So, you must see just the error log "
	self debug:'something #debug'.
	self info:'something #info'.
	self logError:[ 'something #error' ].
" If you want to change the configuration of your class, your class already have a resetConfiguration :) 'cause of TLogger trait :)  "	
	self class resetConfiguration.
	
	
	
	
	