Class {
	#name : #AIO,
	#superclass : #FFILibrary,
	#category : #'AIO-aio'
}

{ #category : #access }
AIO class >> EINPROGRESS [
	^ 36
]

{ #category : #'as yet unclassified' }
AIO class >> O_ACCMODE [
	^ 16r0003
]

{ #category : #'as yet unclassified' }
AIO class >> O_CREAT [
	^ 16r0200
]

{ #category : #'as yet unclassified' }
AIO class >> O_EXCL [      
	^ 16r0800
	
]

{ #category : #'as yet unclassified' }
AIO class >> O_NONBLOCK [        
	^ 16r0004

]

{ #category : #'as yet unclassified' }
AIO class >> O_RDONLY [        
	^ 16r0000

]

{ #category : #'as yet unclassified' }
AIO class >> O_RDWR [        
	^ 16r0002
]

{ #category : #'as yet unclassified' }
AIO class >> O_WRONLY [        
	^ 16r0001
]

{ #category : #'meta-object-protocol' }
AIO >> close: fd [
	^ self ffiCall: #(int close #(int fd)) module: LibC
]

{ #category : #'meta-object-protocol' }
AIO >> openFile: pathname option: flags [
	^ self
		ffiCall: #(int open #(const char * pathname , int flags))
		module: LibC
]

{ #category : #open }
AIO >> openForRead: aFileReference [
	| handle |
	handle := AIOFileHandle new.
	handle
		aio_fildes: (self openFile: aFileReference fullName option: AIO O_RDONLY);
		beReadOnly.
	^ handle
]

{ #category : #'meta-object-protocol' }
AIO >> openForWrite: aFileReference [
	| handle |
	handle := AIOFileHandle new.
	handle
		aio_fildes: (self openFile: aFileReference fullName option: AIO O_WRONLY);
		beWriteOnly.
	^ handle
]

{ #category : #'meta-object-protocol' }
AIO >> read: hand [
	^ self ffiCall: #(int aio_read #(AIOFileHandle * hand))
]

{ #category : #open }
AIO >> unixModuleName [
	^ 'librt.so.1'
]
