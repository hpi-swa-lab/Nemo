arg maps
generatePermutationsOfInputArguments 
	"Calculate and store all permutations of argMap in mapList"

	| ii |
	mapList := Array new: argMap size factorial.
	ii := 1.
	argMap permutationsDo: [:perm |
		mapList at: ii put: perm copy.
		ii := ii + 1].
	mapStage := 1.	"about to be bumped"