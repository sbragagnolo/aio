"
struct sigaction {
	__sighandler_t sa_handler;
	unsigned long sa_flags;
#ifdef SA_RESTORER
	__sigrestore_t sa_restorer;
#endif
	sigset_t sa_mask;		/* mask last for extensibility */
};
"
Class {
	#name : #SigAction,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_SA_FLAGS',
		'OFFSET_SA_HANDLER',
		'OFFSET_SA_MASK',
		'OFFSET_SA_RESTORER'
	],
	#category : #'AIO-Signal'
}

{ #category : #'field definition' }
SigAction class >> fieldsDesc [
"self rebuildFieldAccessors"
	^#(
	FFICallback sa_handler;
	ulong sa_flags;
	FFICallback sa_restorer;
	SigSet sa_mask;
	)

]

{ #category : #'accessing structure variables' }
SigAction >> callbackFrom: aBlock [
	^  FFICallback 
		signature: #(void (int, void*, void*))
		block: aBlock.
]

{ #category : #'accessing structure variables' }
SigAction >> sa_flags [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SA_FLAGS
]

{ #category : #'accessing structure variables' }
SigAction >> sa_flags: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SA_FLAGS put: anObject
]

{ #category : #'accessing structure variables' }
SigAction >> sa_handler [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_SA_HANDLER) asInteger)
]

{ #category : #'accessing structure variables' }
SigAction >> sa_handler: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_SA_HANDLER
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
SigAction >> sa_mask [
	"This method was automatically generated"
	^ SigSet fromHandle: (handle referenceStructAt: OFFSET_SA_MASK length: SigSet byteSize)
]

{ #category : #'accessing structure variables' }
SigAction >> sa_mask: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_SA_MASK put: anObject getHandle length: SigSet byteSize
]

{ #category : #'accessing structure variables' }
SigAction >> sa_restorer [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_SA_RESTORER) asInteger)
]

{ #category : #'accessing structure variables' }
SigAction >> sa_restorer: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_SA_RESTORER
		put: (anObject 
			ifNotNil: [ ExternalAddress fromAddress: anObject thunk address ]
			ifNil: [ ExternalAddress null ])
]

{ #category : #'accessing structure variables' }
SigAction >> sigaction: signal [
	^ self sigaction: signal oldHandler: nil
]

{ #category : #'accessing structure variables' }
SigAction >> sigaction: signal oldHandler: action [
	^ self ffiCall: #(int sigaction (int signal, self, SigAction* action))  module: LibC.
]
