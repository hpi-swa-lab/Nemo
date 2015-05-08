as yet unclassified
baseline: spec
	<baseline>
	
	spec for: #common do: [
		spec package: 'VB-Regex' with: [
			spec
				repository: 'http://www.squeaksource.com/Regex'].
			
		spec package: 'AST-Core' with: [
			spec
				repository: 'http://www.squeaksource.com/rb'].

		spec project: 'CommandShell' with: [
			spec
				className: 'ConfigurationOfCommandShell';
				repository: 'http://www.squeaksource.com/MetacelloRepository'].
			
		spec project: 'RoelTyper' with: [
			spec
				className: 'ConfigurationOfRoelTyper';
				repository: 'http://www.squeaksource.com/MetacelloRepository'].

		spec package: 'Nemo' with: [
			spec
				repository: 'github://HPI-SWA-Lab/BP2014H1:master/repository';
				requires: #('AST-Core' 'VB-Regex' 'CommandShell' 'RoelTyper')].
		
		spec postLoadDoIt: #postLoadNemoCodeEditorKeyboardShortcuts.

		spec
			group: 'default' with: #('core');
			group: 'TravisCI' with: #('core');
			group: 'core' with: #('Nemo') ]