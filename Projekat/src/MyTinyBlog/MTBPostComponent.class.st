Class {
	#name : #MTBPostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #initialization }
MTBPostComponent >> date [
	^ post date
]

{ #category : #initialization }
MTBPostComponent >> initialize [ 
	super initialize.
	post:= MTBPost new 
]

{ #category : #initialization }
MTBPostComponent >> post: aPost [
	post := aPost
]

{ #category : #initialization }
MTBPostComponent >> renderContentOn: html [
	html heading level: 2; with: self title.
	html heading level: 6; with: self date.
	html text: self text
]

{ #category : #initialization }
MTBPostComponent >> text [
	^ post text
]

{ #category : #initialization }
MTBPostComponent >> title [
	^ post title
]
