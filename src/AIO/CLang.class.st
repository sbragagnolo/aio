Class {
	#name : #CLang,
	#superclass : #FFILibrary,
	#category : #'AIO-aio'
}

{ #category : #'accessing platform' }
CLang >> unixModuleName [
	^ '/usr/lib/x86_64-linux-gnu/libclang-3.8.so'
]
