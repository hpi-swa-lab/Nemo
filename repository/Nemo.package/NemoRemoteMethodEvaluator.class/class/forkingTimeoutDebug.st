preferences
forkingTimeoutDebug
	<preference: 'Forking timeout (debugging)'
	category: 'Nemo Browser'
	description: 'The time in milliseconds the Nemo system will wait synchronous to evaluate statements in the forked VM. When timeout expires, the forked process will be terminated. This timout is used when debugging the forked VM with a graphical Squeak interface, i.e. when the "Fork headless" is false.'
	type: #Number>
	^ ForkingTimeoutDebug ifNil: [ 5 * 60 * 1000 ]