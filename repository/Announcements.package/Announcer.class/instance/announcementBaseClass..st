accessing
announcementBaseClass: aClass
	"Set the base class of the classhierarchy which can be used as announcements in this announcer. Changing it while having registered subscriptions is very dangerous."

	(aClass ~= announcementBaseClass
		and: [ registry isEmpty not ])
			ifTrue: [
				Warning signal: 'Changing the base class of the announcement hierarchy may hang the image!'].
	announcementBaseClass := aClass