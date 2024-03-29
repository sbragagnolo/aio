Class {
	#name : #ManifestTalkFFIASTCore,
	#superclass : #Object,
	#category : #'TalkFFI-AST-Core'
}

{ #category : #'meta data' }
ManifestTalkFFIASTCore class >> rejectClasses [
^ #()
]

{ #category : #'meta data' }
ManifestTalkFFIASTCore class >> rejectRules [
^ #()
]

{ #category : #'meta data' }
ManifestTalkFFIASTCore class >> ruleCascadedNextPutAllsRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLArgument #printOn: #false)) #'2013-02-02T20:29:37.258000001+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIASTCore class >> ruleCollectSelectNotUsedRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#'CLNode class' #createAccessors #true)) #'2013-02-02T20:11:37.292+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIASTCore class >> ruleImplementedNotSentRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#'CLNode class' #generateAll #true)) #'2013-02-02T20:56:06.258000001+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIASTCore class >> ruleInconsistentMethodClassificationRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLStructure #initialize #false)) #'2013-02-02T20:47:57.195+01:00') #(#(#RGMethodDefinition #(#CLEnumeration #at:put: #false)) #'2013-02-02T20:47:57.249+01:00') #(#(#RGMethodDefinition #(#CLEnumeration #initialize #false)) #'2013-02-02T20:47:57.691+01:00') #(#(#RGMethodDefinition #(#CLArray #clPrintOn: #false)) #'2013-02-02T20:47:57.726000001+01:00') #(#(#RGMethodDefinition #(#CLFunctionSignature #initialize #false)) #'2013-02-02T20:49:16.4+01:00') #(#(#RGMethodDefinition #(#CLTypeAlias #printOn: #false)) #'2013-02-02T20:49:16.464+01:00') #(#(#RGMethodDefinition #(#CLFunctionSignature #printOn: #false)) #'2013-02-02T20:49:16.522+01:00') #(#(#RGMethodDefinition #(#CLFunctionDeclaration #printOn: #false)) #'2013-02-02T20:49:16.578+01:00') #(#(#RGMethodDefinition #(#CLNode #clPrintOn: #false)) #'2013-02-02T20:49:16.617000001+01:00') #(#(#RGMethodDefinition #(#CLArgument #printOn: #false)) #'2013-02-02T20:49:16.676+01:00') #(#(#RGMethodDefinition #(#CLNode #printOn: #false)) #'2013-02-02T20:49:16.713000001+01:00') #(#(#RGMethodDefinition #(#CLUnsupported #clPrintOn: #false)) #'2013-02-02T20:49:16.767+01:00') #(#(#RGMethodDefinition #(#CLPointer #printOn: #false)) #'2013-02-02T20:49:16.821+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIASTCore class >> ruleLawOfDemeterRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLArgument #printOn: #false)) #'2013-02-02T20:33:53.629+01:00') )
]

{ #category : #'meta data' }
ManifestTalkFFIASTCore class >> ruleUnclassifiedMethodsRuleV1TruePositive [
^ #(#(#(#RGMethodDefinition #(#CLArgument #printOn: #false)) #'2013-02-02T21:02:19.393000001+01:00') #(#(#RGMethodDefinition #(#CLStructure #initialize #false)) #'2013-02-02T21:02:19.546000001+01:00') #(#(#RGMethodDefinition #(#CLNode #printOn: #false)) #'2013-02-02T21:02:19.654000001+01:00') #(#(#RGMethodDefinition #(#CLTypeAlias #printOn: #false)) #'2013-02-02T21:02:19.87+01:00') #(#(#RGMethodDefinition #(#CLFunctionSignature #initialize #false)) #'2013-02-02T21:02:19.905000001+01:00') #(#(#RGMethodDefinition #(#CLEnumeration #initialize #false)) #'2013-02-02T21:02:19.941000001+01:00') #(#(#RGMethodDefinition #(#CLFunctionSignature #printOn: #false)) #'2013-02-02T21:02:20.013000001+01:00') #(#(#RGMethodDefinition #(#CLUnsupported #clPrintOn: #false)) #'2013-02-02T21:02:20.049000001+01:00') #(#(#RGMethodDefinition #(#CLFunctionDeclaration #printOn: #false)) #'2013-02-02T21:02:20.084000001+01:00') #(#(#RGMethodDefinition #(#CLNode #clPrintOn: #false)) #'2013-02-02T21:02:20.122000001+01:00') #(#(#RGMethodDefinition #(#CLPointer #printOn: #false)) #'2013-02-02T21:02:20.230000001+01:00') #(#(#RGMethodDefinition #(#CLEnumeration #at:put: #false)) #'2013-02-02T21:02:20.411000001+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #arrayNamed:elementType:size:sourceLocation: #false)) #'2013-02-02T21:03:24.412+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #headerNamed:types:functions:unmappable:sourceLocation: #false)) #'2013-02-02T21:03:24.453+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #structNamed:sourceLocation: #false)) #'2013-02-02T21:03:24.491+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #unionNamed:sourceLocation: #false)) #'2013-02-02T21:03:24.528+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #pointerTo:sourceLocation: #false)) #'2013-02-02T21:03:24.565000001+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #primaryNamed:using: #false)) #'2013-02-02T21:03:24.604+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #primaryNamed: #false)) #'2013-02-02T21:03:24.642+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #arguments:returnType:sourceLocation: #false)) #'2013-02-02T21:03:24.679+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #aliasNamed:of:sourceLocation: #false)) #'2013-02-02T21:03:24.715000001+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #functionNamed:signature:sourceLocation: #false)) #'2013-02-02T21:03:24.752000001+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #enumNamed:type:sourceLocation: #false)) #'2013-02-02T21:03:24.790000001+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #argumentNamed:type:sourceLocation: #false)) #'2013-02-02T21:03:24.829+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #unsupportedNamed:type:sourceLocation: #false)) #'2013-02-02T21:03:24.866000001+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #addField:toRecord: #false)) #'2013-02-02T21:03:24.911+01:00') #(#(#RGMethodDefinition #(#CLNodeBuilder #enum:at:put: #false)) #'2013-02-02T21:03:24.954+01:00') )
]
