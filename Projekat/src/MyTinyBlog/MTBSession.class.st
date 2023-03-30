Class {
	#name : #MTBSession,
	#superclass : #WAComponent,
	#instVars : [
		'currentAdmin'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #accessing }
MTBSession >> currentAdmin [
^ currentAdmin
]

{ #category : #accessing }
MTBSession >> currentAdmin: anObject [
currentAdmin := anObject
]

{ #category : #accessing }
MTBSession >> isLogged [
^ self currentAdmin notNil
]

{ #category : #initialization }
MTBSession >> reset [
currentAdmin := nil.
self requestContext redirectTo: self application url.
self unregister.

]
