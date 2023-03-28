Class {
	#name : #MTBScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #'as yet unclassified' }
MTBScreenComponent >> blog [
	"Vraca trenutni blog"
	^ MTBBlog current
]

{ #category : #'as yet unclassified' }
MTBScreenComponent >> children [
	^ { header }
]

{ #category : #initialization }
MTBScreenComponent >> createHeaderComponent [
	^ MTBHeaderComponent new 
]

{ #category : #initialization }
MTBScreenComponent >> initialize [
	super initialize.
	header:= self createHeaderComponent
]

{ #category : #'as yet unclassified' }
MTBScreenComponent >> renderContentOn: html [
	html render: header
]
