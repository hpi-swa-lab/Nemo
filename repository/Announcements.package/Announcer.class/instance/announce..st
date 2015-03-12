announcements
announce: anObject
	"Deliver anObject to the registered subscribers. anObject should respond to #asAnnouncement and return with an instance of announcementBaseClass. The return value is the announcement which can be modified by the subscribers."

	| announcement actualClass |
	announcement := anObject asAnnouncement.
	actualClass := announcement class.
	registry subscriptionsFor: actualClass announce: announcement.
	[ actualClass == announcementBaseClass ]
		whileFalse: [
			actualClass := actualClass superclass.
			registry subscriptionsFor: actualClass announce: announcement ].
	^announcement