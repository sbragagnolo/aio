Class {
	#name : #AIOTests,
	#superclass : #TestCase,
	#category : #AIO
}

{ #category : #tests }
AIOTests >> testFileCanBeOpenForRead [
	| handle |
	handle := AIO uniqueInstance openForRead: 'pharo-local/iceberg/sbragagnolo/aio/file.test' asFileReference .
	self assert: handle aio_fildes > 0.
	 AIO uniqueInstance close: handle aio_fildes.
	
]

{ #category : #tests }
AIOTests >> testFileCanBeOpenForWrite [
	| handle |
	handle := AIO uniqueInstance openForWrite:'pharo-local/iceberg/sbragagnolo/aio/file.test' asFileReference .
	self assert: handle aio_fildes > 0.
	 AIO uniqueInstance close: handle aio_fildes.
	
]

{ #category : #tests }
AIOTests >> testReadFileNonEventCommunication [
	| handle buffer |
	handle := AIO uniqueInstance
		openForRead: 'pharo-local/iceberg/sbragagnolo/aio/file.test' asFileReference.
	handle aio_sigevent sigev_notify: SigEvent SIGEV_NONE.
	buffer := ExternalAddress allocate: 512.
	buffer autoRelease.
	
	handle aio_buf: buffer.
	handle read.
	
	[handle isInProgress] whileTrue: [ 100 milliSeconds wait ].
	
	self halt.


]
