announcements
mayAnnounce: anAnnouncementClass
	"Decide if this announcer may announce an instance of anAnnanAnnouncementClass."

	^anAnnouncementClass == announcementBaseClass or: 
		[ anAnnouncementClass inheritsFrom: announcementBaseClass ]