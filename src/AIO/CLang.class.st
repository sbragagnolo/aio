Class {
	#name : #CLang,
	#superclass : #FFILibrary,
	#category : #'AIO-aio'
}

{ #category : #'accessing platform' }
CLang >> unixModuleName [
	^ 'libclang.so.1'
]
