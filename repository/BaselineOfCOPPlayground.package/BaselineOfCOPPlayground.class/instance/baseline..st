as yet unclassified
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec project: 'ContextS2' with: [
			spec
				className: 'ConfigurationOfContextS';
				repository: 'http://www.squeaksource.com/MetacelloRepository'].

		spec project: 'SwaUtil' with: [
			spec
				className: 'ConfigurationOfSwaUtil';
				repository: 'http://www.hpi.uni-potsdam.de/hirschfeld/squeaksource/MetacelloRepository'].

		"Internal packages."
		spec package: 'COPPlayground' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository';
				requires: #(ContextS2 SwaUtil)].

		spec
			group: 'default' with: #('core');
			group: 'core' with: #('COPPlayground')].