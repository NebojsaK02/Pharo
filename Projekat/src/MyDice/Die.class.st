Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #MyDice
}

{ #category : #accessing }
Die >> faces [
	^ faces
]

{ #category : #initialization }
Die >> initialize [ 
	super initialize.
	faces :=6
]

{ #category : #accessing }
Die >> roll [
	^ faces atRandom 
]
