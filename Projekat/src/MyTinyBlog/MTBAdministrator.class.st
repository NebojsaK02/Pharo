Class {
	#name : #MTBAdministrator,
	#superclass : #Object,
	#instVars : [
		'login',
		'password'
	],
	#category : #MyTinyBlog
}

{ #category : #'as yet unclassified' }
MTBAdministrator class >> login: login password: password [
	^ self new
	login: login;
	password: password;
	yourself
]

{ #category : #accessing }
MTBAdministrator >> login [
	^ login
]

{ #category : #accessing }
MTBAdministrator >> login: anObject [ 
	login:=anObject
]

{ #category : #accessing }
MTBAdministrator >> password [
	^ password
]

{ #category : #accessing }
MTBAdministrator >> password: anObject [
	password:=SHA256 hashMessage: anObject
]
