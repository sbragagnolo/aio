"
Extract of the SigInnerAnonymUnion Type. See The inner definition of it. 
"
Class {
	#name : #SigInnerAnonymStruct,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_SIGVAL_T',
		'OFFSET__ATTRIBUTE'
	],
	#category : #'AIO-Signal'
}

{ #category : #'field definition' }
SigInnerAnonymStruct class >> fieldsDesc [ 
"	self rebuildFieldAccessors "
^
	#( FFICallback sigval_t;
	    void *_attribute; )
]

{ #category : #'accessing structure variables' }
SigInnerAnonymStruct >> _attribute [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET__ATTRIBUTE) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
SigInnerAnonymStruct >> _attribute: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET__ATTRIBUTE put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
SigInnerAnonymStruct >> sigval_t [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_SIGVAL_T) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
SigInnerAnonymStruct >> sigval_t: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SIGVAL_T put: anObject getHandle.
]
