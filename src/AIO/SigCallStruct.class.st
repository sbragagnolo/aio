Class {
	#name : #SigCallStruct,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_SIGVAL_T',
		'OFFSET__ATTRIBUTE'
	],
	#category : #AIO
}

{ #category : #'field definition' }
SigCallStruct class >> fieldsDesc [ 
"	self rebuildFieldAccessors "
^
	#( void* sigval_t;
	    void *_attribute; )
]

{ #category : #'accessing structure variables' }
SigCallStruct >> _attribute [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET__ATTRIBUTE) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
SigCallStruct >> _attribute: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET__ATTRIBUTE put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
SigCallStruct >> sigval_t [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_SIGVAL_T) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
SigCallStruct >> sigval_t: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SIGVAL_T put: anObject getHandle.
]
