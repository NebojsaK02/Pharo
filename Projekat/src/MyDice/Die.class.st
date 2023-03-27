Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #MyDice
}

{ #category : #'instance creation' }
Die class >> withFaces: anInteger [ 
	|d|
	d:=Die new.
	d faces: anInteger .
	^ d
]

{ #category : #accessing }
Die >> faces [
	^ faces
]

{ #category : #accessing }
Die >> faces: anInteger [ 
	faces := anInteger
]

{ #category : #initialization }
Die >> initialize [ 
	super initialize.
	faces :=6
]

{ #category : #accessing }
Die >> printOn: aStream [ 
	super printOn: aStream.
	aStream nextPutAll: '( ',faces printString ,' )'
]

{ #category : #accessing }
Die >> roll [
	^ faces atRandom 
]
