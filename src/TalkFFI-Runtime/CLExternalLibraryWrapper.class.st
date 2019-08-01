Class {
	#name : #CLExternalLibraryWrapper,
	#superclass : #NBExternalLibraryWrapper,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'TalkFFI-Runtime'
}

{ #category : #'class initialization' }
CLExternalLibraryWrapper class >> initialize [
	uniqueInstance := super new
]

{ #category : #'instance creation' }
CLExternalLibraryWrapper class >> new [
	self error: 'External library wrappers are singleton -- send uniqueInstance instead'
]

{ #category : #'class initialization' }
CLExternalLibraryWrapper class >> reset [
	^ uniqueInstance := nil
]

{ #category : #'instance creation' }
CLExternalLibraryWrapper class >> uniqueInstance [
	^ uniqueInstance
		ifNil: [ 
			self initialize.
			uniqueInstance ]
		ifNotNil: [ uniqueInstance ]
]

{ #category : #'as yet unclassified' }
CLExternalLibraryWrapper >> call: fnSpec options: callOptions [
	" you can override this method if you need to"

	^ (self ffiCalloutIn: thisContext sender)
		cdecl;
		options: callOptions;
		function: fnSpec module: self libraryNameOrHandle
]

{ #category : #utils }
CLExternalLibraryWrapper >> libraryNameOrHandle [
	^ self class nbLibraryNameOrHandle

]

{ #category : #utils }
CLExternalLibraryWrapper >> nbLibraryNameOrHandle [
	^ self class nbLibraryNameOrHandle

]
