as yet unclassified
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec project: 'BaselineOfCOPPlayground' with: [
			spec
				className: 'BaselineOfCOPPlayground';
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec package: 'VB-Regex' with: [
			spec
				repository: 'http://www.squeaksource.com/Regex'].

		spec project: 'SqueakOverflow' with: [
			spec
				className: 'BaselineOfSqueakOverflow';
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].
		
		"spec project: 'SwaUtil' with: [
			spec
				className: 'ConfigurationOfSwaUtil';
				repository: 'http://www.hpi.uni-potsdam.de/hirschfeld/squeaksource/MetacelloRepository']."

		spec package: 'Traits' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		"spec package: 'Announcements' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository']."

		spec package: 'AST-Core' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		"spec package: 'AST-Core' with: [
			spec
				repository: 'http://www.squeaksource.com/rb']."

		spec package: 'Tools-MethodFinder' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository'].

		spec package: 'BPH12014' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository';
				requires: #('Traits' 'AST-Core' 'VB-Regex')].

		spec
			group: 'default' with: #('core');
			group: 'TravisCI' with: #('core');
			group: 'core' with: #('BPH12014' 'Tools-MethodFinder');
			group: 'cop' with: #('core' 'BaselineOfCOPPlayground');
			group: 'overflow' with: #('core' 'SqueakOverflow')].