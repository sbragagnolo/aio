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
	| handle |
	handle := AIO uniqueInstance
		openForRead: 'pharo-local/iceberg/sbragagnolo/aio/file.test' asFileReference.
	self assert: handle aio_fildes > 0.
	AIO uniqueInstance close: handle aio_fildes
]
