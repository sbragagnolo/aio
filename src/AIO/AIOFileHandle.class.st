Class {
	#name : #AIOFileHandle,
	#superclass : #FFIExternalStructure,
	#instVars : [
		'read',
		'write',
		'buffer'
	],
	#classVars : [
		'OFFSET_AIO_BUF',
		'OFFSET_AIO_FILDES',
		'OFFSET_AIO_LIO_OPCODE',
		'OFFSET_AIO_NBYTES',
		'OFFSET_AIO_OFFSET',
		'OFFSET_AIO_REQPRIO',
		'OFFSET_AIO_SIGEVENT'
	],
	#category : #AIO
}

{ #category : #'field definition' }
AIOFileHandle class >> ffiLibraryName [
	^ AIO
]

{ #category : #'field definition' }
AIOFileHandle class >> fieldsDesc [
"self rebuildFieldAccessors"
	^ 
#(int aio_fildes;
  int64 aio_offset;
  void*  aio_buf;
  size_t aio_nbytes;
  int aio_reqprio;
  SigEvent aio_sigevent;
  int aio_lio_opcode;)
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_buf [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_AIO_BUF) type: ExternalType void asPointerType
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_buf: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_AIO_BUF put: anObject getHandle.
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_fildes [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_AIO_FILDES
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_fildes: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_AIO_FILDES put: anObject
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_lio_opcode [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_AIO_LIO_OPCODE
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_lio_opcode: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_AIO_LIO_OPCODE put: anObject
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_nbytes [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_AIO_NBYTES
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_nbytes: anObject [
	"This method was automatically generated"
	^handle platformSizeTAt: OFFSET_AIO_NBYTES put: anObject
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_offset [
	"This method was automatically generated"
	^handle signedLongLongAt: OFFSET_AIO_OFFSET
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_offset: anObject [
	"This method was automatically generated"
	handle signedLongLongAt: OFFSET_AIO_OFFSET put: anObject
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_reqprio [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_AIO_REQPRIO
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_reqprio: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_AIO_REQPRIO put: anObject
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_sigevent [
	"This method was automatically generated"
	^ SigEvent fromHandle: (handle referenceStructAt: OFFSET_AIO_SIGEVENT length: SigEvent byteSize)
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> aio_sigevent: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_AIO_SIGEVENT put: anObject getHandle length: SigEvent byteSize
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> beReadOnly [ 
	read := true.
	write := false.
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> beWriteOnly [
	read := false.
	write := true
]

{ #category : #'accessing structure variables' }
AIOFileHandle >> initialize [
	super initialize.
	self aio_buf: (ExternalAddress allocate: 1024 * 1024)
]
