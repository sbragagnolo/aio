"
parser := CLangDumpParser new .
stream := parser preparse: '/home/santiago/git-repositories/aio-git/bla' asFileReference readStream
"
Class {
	#name : #CLangDumpParser,
	#superclass : #Object,
	#category : #'AIO-aio'
}
