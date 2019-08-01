"
mapping:= TalkFFIExamples libClang31Mapping.

parser := CLangDumpParser new .
stream := parser preparse: '/home/santiago/git-repositories/aio-git/bla' asFileReference readStream.


Gofer it
    smalltalkhubUser: 'CipT' project: 'TalkFFI';
    package: 'ConfigurationOfTalkFFI';
    load.
(Smalltalk at: #ConfigurationOfTalkFFI) loadDevelopment.
"
Class {
	#name : #CLangDumpParser,
	#superclass : #Object,
	#category : #'AIO-aio'
}
