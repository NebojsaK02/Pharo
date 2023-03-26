Class {
	#name : #MTBPost,
	#superclass : #Object,
	#instVars : [
		'title',
		'text',
		'date',
		'category',
		'visible'
	],
	#category : #MyTinyBlog
}

{ #category : #'as yet unclassified' }
MTBPost class >> title: aTitle text: aText [
^ self new 
	title: aTitle; 
	text: aText;
	yourself
]

{ #category : #'as yet unclassified' }
MTBPost class >> title: aTitle text: aText category: aCategory [
^ (self title: aTitle text: aText) 
	category: aCategory;
	yourself
]

{ #category : #'as yet unclassified' }
MTBPost class >> unclassifiedTag [
^ 'Unclassified'
]

{ #category : #accessing }
MTBPost >> beVisible [ 
self visible: true
]

{ #category : #accessing }
MTBPost >> category [ 
^ category
]

{ #category : #accessing }
MTBPost >> category: anObject [  
category := anObject 
]

{ #category : #accessing }
MTBPost >> date [ 
^ date
]

{ #category : #accessing }
MTBPost >> date: aDate [ 
date := aDate
]

{ #category : #initialization }
MTBPost >> initialize [
super initialize.
self category: MTBPost unclassifiedTag.
self date: Date today.
self notVisible
]

{ #category : #testing }
MTBPost >> isUnclassified [
^ self category = MTBPost unclassifiedTag 
]

{ #category : #testing }
MTBPost >> isVisible [ 
^ self visible 
]

{ #category : #accessing }
MTBPost >> notVisible [ 
self visible: false
]

{ #category : #accessing }
MTBPost >> text [ 
^ text
]

{ #category : #accessing }
MTBPost >> text: aString [  
text := aString
]

{ #category : #accessing }
MTBPost >> title [ 
^ title
]

{ #category : #accessing }
MTBPost >> title: aString [ 
title := aString
]

{ #category : #accessing }
MTBPost >> visible [ 
^ visible
]

{ #category : #accessing }
MTBPost >> visible: aBoolean [
visible := aBoolean 
]
