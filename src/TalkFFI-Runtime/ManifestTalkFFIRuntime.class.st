Class {
	#name : #ManifestTalkFFIRuntime,
	#superclass : #Object,
	#category : #'TalkFFI-Runtime'
}

{ #category : #'meta data' }
ManifestTalkFFIRuntime class >> rejectClasses [
^ #()
]

{ #category : #'meta data' }
ManifestTalkFFIRuntime class >> rejectRules [
^ #()
]

{ #category : #'meta data' }
ManifestTalkFFIRuntime class >> ruleClassInstVarNotInitializedRuleV1TruePositive [
^ #(#(#(#RGClassDefinition #(#CLExternalLibraryWrapper)) #'2013-02-02T20:20:52.855+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIRuntime class >> ruleInconsistentMethodClassificationRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#'CLLibraryMap class' #at: #true)) #'2013-02-02T20:50:25.692000001+01:00') #(#(#RGMethodDefinition #(#'CLLibraryMap class' #initialize #true)) #'2013-02-02T20:50:25.731+01:00') #(#(#RGMethodDefinition #(#'CLExternalLibraryWrapper class' #initialize #true)) #'2013-02-02T20:52:11.08+01:00') #(#(#RGMethodDefinition #(#CLExternalLibraryWrapper #libraryNameOrHandle #false)) #'2013-02-02T20:52:11.117000001+01:00') #(#(#RGMethodDefinition #(#'CLExternalLibraryWrapper class' #new #true)) #'2013-02-02T20:52:11.157+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIRuntime class >> ruleSendsDifferentSuperRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#'CLExternalLibraryWrapper class' #uniqueInstance #true)) #'2013-02-02T20:27:31.016+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIRuntime class >> ruleUnclassifiedMethodsRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#'CLExternalLibraryWrapper class' #initialize #true)) #'2013-02-02T21:02:19.246+01:00') #(#(#RGMethodDefinition #(#'CLExternalLibraryWrapper class' #new #true)) #'2013-02-02T21:02:19.281000001+01:00') #(#(#RGMethodDefinition #(#'CLLibraryMap class' #at:ifAbsent: #true)) #'2013-02-02T21:02:19.318+01:00') #(#(#RGMethodDefinition #(#'CLLibraryMap class' #libraryNameOrHandle #true)) #'2013-02-02T21:02:19.583+01:00') #(#(#RGMethodDefinition #(#'CLLibraryMap class' #at: #true)) #'2013-02-02T21:02:19.618000001+01:00') #(#(#RGMethodDefinition #(#'CLExternalLibraryWrapper class' #uniqueInstance #true)) #'2013-02-02T21:02:19.797000001+01:00') #(#(#RGMethodDefinition #(#'CLLibraryMap class' #initialize #true)) #'2013-02-02T21:02:19.832000001+01:00') #(#(#RGMethodDefinition #(#'CLLibraryMap class' #typeMap #true)) #'2013-02-02T21:02:19.976000001+01:00') #(#(#RGMethodDefinition #(#'CLExternalLibraryWrapper class' #reset #true)) #'2013-02-02T21:02:20.194+01:00') #(#(#RGMethodDefinition #(#CLExternalLibraryWrapper #libraryNameOrHandle #false)) #'2013-02-02T21:02:20.338+01:00') #(#(#RGMethodDefinition #(#'CLLibraryMap class' #initializeTypeMap #true)) #'2013-02-02T21:02:20.373000001+01:00') )
]
