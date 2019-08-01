Class {
	#name : #ConfigurationOfTalkFFI,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : #ConfigurationOfTalkFFI
}

{ #category : #'development support' }
ConfigurationOfTalkFFI class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfTalkFFI class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #private }
ConfigurationOfTalkFFI class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfTalkFFI class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfTalkFFI class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfTalkFFI class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfTalkFFI class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfTalkFFI class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfTalkFFI class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfTalkFFI class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfTalkFFI >> baseline10: spec [
	<version: '1.0-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/CipT/TalkFFI/main'.
		spec 
			project: 'NativeBoost' with: [
				spec
					className: 'ConfigurationOfNativeBoost';
					versionString: #'1.9';
					repository: 'http://www.squeaksource.com/NativeBoost' ];
			project: 'LibClang' with: [
				spec
					className: 'ConfigurationOfLibClang';
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/CipT/LibClang/main' ].
		spec 
			package: 'TalkFFI-Runtime' with: [
				spec requires: #('NativeBoost' ). ];
			package: 'TalkFFI-AST-Core';
			package: 'TalkFFI-AST-Generation' with: [
				spec requires: #('LibClang' 'TalkFFI-AST-Core' );
				postLoadDoIt: #postloadForASTGeneration ];
			package: 'TalkFFI-SmalltalkBinding' with: [
				spec requires: #('TalkFFI-AST-Core' ). ];
			package: 'TalkFFI-NativeBoostBinding' with: [
				spec requires: #('NativeBoost' 'TalkFFI-SmalltalkBinding' ). ].
		spec 
			group: 'default' with: #('Core' );
			group: 'Core' with: #('TalkFFI-Runtime' 'TalkFFI-AST-Core' 'TalkFFI-AST-Generation' 'TalkFFI-SmalltalkBinding' 'TalkFFI-NativeBoostBinding' );
			group: 'Runtime' with: #('TalkFFI-Runtime' ). ].

]

{ #category : #baselines }
ConfigurationOfTalkFFI >> baseline11: spec [
	<version: '1.1-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/CipT/TalkFFI/main'.
		spec 
			project: 'NativeBoost' with: [
				spec
					className: 'ConfigurationOfNativeBoost';
					versionString: #'2.0';
					repository: 'http://www.smalltalkhub.com/mc/Pharo/NativeBoost/main' ];
			project: 'LibClang' with: [
				spec
					className: 'ConfigurationOfLibClang';
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/CipT/LibClang/main' ].
		spec 
			package: 'TalkFFI-Runtime' with: [
				spec requires: #('NativeBoost' ). ];
			package: 'TalkFFI-AST-Core';
			package: 'TalkFFI-AST-Generation' with: [
				spec requires: #('LibClang' 'TalkFFI-AST-Core' );
				postLoadDoIt: #postloadForASTGeneration ];
			package: 'TalkFFI-SmalltalkBinding' with: [
				spec requires: #('TalkFFI-AST-Core' ). ];
			package: 'TalkFFI-NativeBoostBinding' with: [
				spec requires: #('NativeBoost' 'TalkFFI-SmalltalkBinding' ). ];
			package: 'TalkFFI-Examples' with: [
				spec requires: #('TalkFFI-NativeBoostBinding')];
			package: 'TalkFFI-Tests' with: [
				spec requires: #('TalkFFI-NativeBoostBinding')].
		spec 
			group: 'default' with: #('Core' );
			group: 'Core' with: #('TalkFFI-Runtime' 'TalkFFI-AST-Core' 'TalkFFI-AST-Generation' 'TalkFFI-SmalltalkBinding' 'TalkFFI-NativeBoostBinding' 'TalkFFI-Examples' );
			group: 'Runtime' with: #('TalkFFI-Runtime' );
			group: 'Tests' with: #('TalkFFI-Tests'). ].

]

{ #category : #baselines }
ConfigurationOfTalkFFI >> baseline12: spec [
	<version: '1.2-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/CipT/TalkFFI/main'.
		spec 
			project: 'NativeBoost' with: [
				spec
					className: 'ConfigurationOfNativeBoost';
					versionString: #'2.0';
					repository: 'http://www.smalltalkhub.com/mc/Pharo/NativeBoost/main' ];
			project: 'LibClang' with: [
				spec
					className: 'ConfigurationOfLibClang';
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/CipT/LibClang/main' ].
		spec 
			package: 'TalkFFI-Runtime' with: [
				spec requires: #('NativeBoost' ). ];
			package: 'TalkFFI-Announcements';
			package: 'TalkFFI-AST-Core';
			package: 'TalkFFI-AST-Generation' with: [
				spec requires: #('LibClang' 'TalkFFI-AST-Core' );
				postLoadDoIt: #postloadForASTGeneration ];
			package: 'TalkFFI-SmalltalkBinding' with: [
				spec requires: #('TalkFFI-AST-Core' ). ];
			package: 'TalkFFI-NativeBoostBinding' with: [
				spec requires: #('NativeBoost' 'TalkFFI-SmalltalkBinding' ). ];
			package: 'TalkFFI-Examples' with: [
				spec requires: #('TalkFFI-NativeBoostBinding')];
			package: 'TalkFFI-Tests' with: [
				spec requires: #('TalkFFI-NativeBoostBinding')].
		spec 
			group: 'default' with: #('Core' );
			group: 'Core' with: #('TalkFFI-Runtime' 'TalkFFI-Announcements' 'TalkFFI-AST-Core' 'TalkFFI-AST-Generation' 'TalkFFI-SmalltalkBinding' 'TalkFFI-NativeBoostBinding' 'TalkFFI-Examples' );
			group: 'Runtime' with: #('TalkFFI-Runtime' );
			group: 'Tests' with: #('TalkFFI-Tests'). ].

]

{ #category : #baselines }
ConfigurationOfTalkFFI >> baseline13: spec [
	<version: '1.3-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/CipT/TalkFFI/main'.
		spec 
			project: 'LibClang' with: [
				spec
					className: 'ConfigurationOfLibClang';
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/CipT/LibClang/main' ].
		spec 
			package: 'TalkFFI-Runtime';
			package: 'TalkFFI-Announcements';
			package: 'TalkFFI-AST-Core';
			package: 'TalkFFI-AST-Generation' with: [
				spec requires: #('LibClang' 'TalkFFI-AST-Core' );
				postLoadDoIt: #postloadForASTGeneration ];
			package: 'TalkFFI-SmalltalkBinding' with: [
				spec requires: #('TalkFFI-AST-Core' ). ];
			package: 'TalkFFI-NativeBoostBinding' with: [
				spec requires: #('TalkFFI-SmalltalkBinding' ). ];
			package: 'TalkFFI-Examples' with: [
				spec requires: #('TalkFFI-NativeBoostBinding')];
			package: 'TalkFFI-Tests' with: [
				spec requires: #('TalkFFI-NativeBoostBinding')].
		spec 
			group: 'default' with: #('Core' );
			group: 'Core' with: #('TalkFFI-Runtime' 'TalkFFI-Announcements' 'TalkFFI-AST-Core' 'TalkFFI-AST-Generation' 'TalkFFI-SmalltalkBinding' 'TalkFFI-NativeBoostBinding' 'TalkFFI-Examples' );
			group: 'Runtime' with: #('TalkFFI-Runtime' );
			group: 'Tests' with: #('TalkFFI-Tests'). ].

]

{ #category : #baselines }
ConfigurationOfTalkFFI >> baseline14: spec [
	<version: '1.4-baseline'>

	spec for: #'common' do: [
		spec blessing: #'baseline'.
		spec repository: 'http://smalltalkhub.com/mc/CipT/TalkFFI/main'.
		spec 
			project: 'LibClang' with: [
				spec
					className: 'ConfigurationOfLibClang';
					versionString: #'bleedingEdge';
					repository: 'http://smalltalkhub.com/mc/CipT/LibClang/main' ].
		spec 
			package: 'TalkFFI-Runtime';
			package: 'TalkFFI-Announcements';
			package: 'TalkFFI-AST-Core';
			package: 'TalkFFI-AST-Generation' with: [
				spec requires: #('LibClang' 'TalkFFI-AST-Core' );
				postLoadDoIt: #postloadForASTGeneration ];
			package: 'TalkFFI-SmalltalkBinding' with: [
				spec requires: #('TalkFFI-AST-Core' ). ];
			package: 'TalkFFI-NativeBoostBinding' with: [
				spec requires: #('TalkFFI-SmalltalkBinding' ). ];
			package: 'TalkFFI-Examples' with: [
				spec requires: #('TalkFFI-NativeBoostBinding')];
			package: 'TalkFFI-Tests' with: [
				spec requires: #('TalkFFI-NativeBoostBinding')].
		spec 
			group: 'default' with: #('Core' );
			group: 'Core' with: #('TalkFFI-Runtime' 'TalkFFI-Announcements' 'TalkFFI-AST-Core' 'TalkFFI-AST-Generation' 'TalkFFI-SmalltalkBinding' 'TalkFFI-NativeBoostBinding' 'TalkFFI-Examples' );
			group: 'Runtime' with: #('TalkFFI-Runtime' );
			group: 'Tests' with: #('TalkFFI-Tests'). ].

]

{ #category : #'symbolic versions' }
ConfigurationOfTalkFFI >> development: spec [
	<symbolicVersion: #'development'>

	spec for: #'common' version: '1.4-baseline'.
	spec for: #'pharo2.x' version: '1.4'.
	spec for: #'pharo3.x' version: '1.5'

]

{ #category : #'post load' }
ConfigurationOfTalkFFI >> postloadForASTGeneration [

	(Smalltalk at: #CLPrimaryBinding) initialize.
]

{ #category : #accessing }
ConfigurationOfTalkFFI >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfTalkFFI >> stable: spec [
	<symbolicVersion: #'stable'>

	spec for: #'common' version: '1.0'.
	spec for: #'pharo2.x' version: '1.3.1'.

]

{ #category : #versions }
ConfigurationOfTalkFFI >> version10: spec [
	<version: '1.0' imports: #('1.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'initial version'.
		spec author: 'CiprianTeodorov'.
		spec timestamp: '12/27/2012 14:26'.
		spec 
			project: 'NativeBoost' with: '1.9';
			project: 'LibClang' with: '1.0'.
		spec 
			package: 'TalkFFI-Runtime' with: 'TalkFFI-Runtime-CiprianTeodorov.1';
			package: 'TalkFFI-AST-Core' with: 'TalkFFI-AST-Core-CiprianTeodorov.1';
			package: 'TalkFFI-AST-Generation' with: 'TalkFFI-AST-Generation-CiprianTeodorov.1';
			package: 'TalkFFI-SmalltalkBinding' with: 'TalkFFI-SmalltalkBinding-CiprianTeodorov.1';
			package: 'TalkFFI-NativeBoostBinding' with: 'TalkFFI-NativeBoostBinding-CiprianTeodorov.4'. ].

]

{ #category : #versions }
ConfigurationOfTalkFFI >> version11: spec [
	<version: '1.1' imports: #('1.0-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'initial pharo 2.0 version'.
		spec author: 'CiprianTeodorov'.
		spec timestamp: '01/06/2013 15:20'.
		spec 
			project: 'NativeBoost' with: '1.9';
			project: 'LibClang' with: '1.0'.
		spec 
			package: 'TalkFFI-Runtime' with: 'TalkFFI-Runtime-CiprianTeodorov.1';
			package: 'TalkFFI-AST-Core' with: 'TalkFFI-AST-Core-CiprianTeodorov.1';
			package: 'TalkFFI-AST-Generation' with: 'TalkFFI-AST-Generation-CiprianTeodorov.1';
			package: 'TalkFFI-SmalltalkBinding' with: 'TalkFFI-SmalltalkBinding-CiprianTeodorov.3';
			package: 'TalkFFI-NativeBoostBinding' with: 'TalkFFI-NativeBoostBinding-CiprianTeodorov.6'. ].

]

{ #category : #versions }
ConfigurationOfTalkFFI >> version12: spec [
	<version: '1.2' imports: #('1.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'development version'.
		spec author: 'CiprianTeodorov'.
		spec timestamp: '01/06/2013 15:20'.
		spec 
			project: 'NativeBoost' with: '1.9';
			project: 'LibClang' with: '1.1'.
		spec 
			package: 'TalkFFI-Runtime' with: 'TalkFFI-Runtime-CiprianTeodorov.3';
			package: 'TalkFFI-AST-Core' with: 'TalkFFI-AST-Core-CiprianTeodorov.3';
			package: 'TalkFFI-AST-Generation' with: 'TalkFFI-AST-Generation-CiprianTeodorov.4';
			package: 'TalkFFI-SmalltalkBinding' with: 'TalkFFI-SmalltalkBinding-CiprianTeodorov.8';
			package: 'TalkFFI-NativeBoostBinding' with: 'TalkFFI-NativeBoostBinding-CiprianTeodorov.11';
			package: 'TalkFFI-Examples' with: 'TalkFFI-Examples-CiprianTeodorov.3'. ].

]

{ #category : #versions }
ConfigurationOfTalkFFI >> version131: spec [
	<version: '1.3.1' imports: #('1.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'development version'.
		spec author: 'CiprianTeodorov'.
		spec timestamp: '06/02/2013'.
		spec 
			project: 'NativeBoost' with: '2.1';
			project: 'LibClang' with: '1.2'.
		spec 
			package: 'TalkFFI-Runtime' with: 'TalkFFI-Runtime-CiprianTeodorov.7';
			package: 'TalkFFI-AST-Core' with: 'TalkFFI-AST-Core-CiprianTeodorov.6';
			package: 'TalkFFI-AST-Generation' with: 'TalkFFI-AST-Generation-CiprianTeodorov.7';
			package: 'TalkFFI-SmalltalkBinding' with: 'TalkFFI-SmalltalkBinding-CiprianTeodorov.12';
			package: 'TalkFFI-NativeBoostBinding' with: 'TalkFFI-NativeBoostBinding-CiprianTeodorov.16';
			package: 'TalkFFI-Examples' with: 'TalkFFI-Examples-CiprianTeodorov.7'. ].

]

{ #category : #versions }
ConfigurationOfTalkFFI >> version13: spec [
	<version: '1.3' imports: #('1.1-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'development version'.
		spec author: 'CiprianTeodorov'.
		spec timestamp: '06/02/2013'.
		spec 
			project: 'NativeBoost' with: '2.1';
			project: 'LibClang' with: '1.2'.
		spec 
			package: 'TalkFFI-Runtime' with: 'TalkFFI-Runtime-CiprianTeodorov.5';
			package: 'TalkFFI-AST-Core' with: 'TalkFFI-AST-Core-CiprianTeodorov.6';
			package: 'TalkFFI-AST-Generation' with: 'TalkFFI-AST-Generation-CiprianTeodorov.7';
			package: 'TalkFFI-SmalltalkBinding' with: 'TalkFFI-SmalltalkBinding-CiprianTeodorov.12';
			package: 'TalkFFI-NativeBoostBinding' with: 'TalkFFI-NativeBoostBinding-CiprianTeodorov.16';
			package: 'TalkFFI-Examples' with: 'TalkFFI-Examples-CiprianTeodorov.7'. ].

]

{ #category : #versions }
ConfigurationOfTalkFFI >> version14: spec [
	<version: '1.4' imports: #('1.2-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'development version'.
		spec author: 'CiprianTeodorov'.
		spec timestamp: '07/04/2013'.
		spec 
			project: 'NativeBoost' with: '2.1';
			project: 'LibClang' with: '1.2'.
		spec 
			package: 'TalkFFI-Runtime' with: 'TalkFFI-Runtime-CiprianTeodorov.7';
			package: 'TalkFFI-Announcements' with: 'TalkFFI-Announcements-CiprianTeodorov.1';
			package: 'TalkFFI-AST-Core' with: 'TalkFFI-AST-Core-CiprianTeodorov.6';
			package: 'TalkFFI-AST-Generation' with: 'TalkFFI-AST-Generation-CiprianTeodorov.9';
			package: 'TalkFFI-SmalltalkBinding' with: 'TalkFFI-SmalltalkBinding-CiprianTeodorov.16';
			package: 'TalkFFI-NativeBoostBinding' with: 'TalkFFI-NativeBoostBinding-CiprianTeodorov.23';
			package: 'TalkFFI-Examples' with: 'TalkFFI-Examples-CiprianTeodorov.16'. ].

]

{ #category : #versions }
ConfigurationOfTalkFFI >> version15: spec [
	<version: '1.5' imports: #('1.3-baseline' )>

	spec for: #'common' do: [
		spec blessing: #'development'.
		spec description: 'development version'.
		spec author: 'CiprianTeodorov'.
		spec timestamp: '03/16/2014'.
		spec 
			project: 'LibClang' with: '1.4'.
		spec 
			package: 'TalkFFI-Runtime' with: 'TalkFFI-Runtime-CiprianTeodorov.7';
			package: 'TalkFFI-Announcements' with: 'TalkFFI-Announcements-CiprianTeodorov.1';
			package: 'TalkFFI-AST-Core' with: 'TalkFFI-AST-Core-CiprianTeodorov.6';
			package: 'TalkFFI-AST-Generation' with: 'TalkFFI-AST-Generation-CiprianTeodorov.9';
			package: 'TalkFFI-SmalltalkBinding' with: 'TalkFFI-SmalltalkBinding-CiprianTeodorov.16';
			package: 'TalkFFI-NativeBoostBinding' with: 'TalkFFI-NativeBoostBinding-CiprianTeodorov.24';
			package: 'TalkFFI-Examples' with: 'TalkFFI-Examples-CiprianTeodorov.17'. ].

]
