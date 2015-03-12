subscribing
removeSubscriptions: aCollection

	aCollection do: [:each | self removeSubscription: each ]