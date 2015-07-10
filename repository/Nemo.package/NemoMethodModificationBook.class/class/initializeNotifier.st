class initialization
initializeNotifier
	"self initializeNotifier"
	"SystemChangeNotifier uniqueInstance noMoreNotificationsFor: self"

	SystemChangeNotifier uniqueInstance notify: self ofSystemChangesOfItem: #method using: #methodEvent:.