Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #MyDice
}

{ #category : #tests }
DieTest >> testCreationIsOk [
	|d|
	d:= Die withFaces: 20.
	self assert:  d faces equals: 20
]

{ #category : #tests }
DieTest >> testInitialize [ 
	|d|
	d:= Die new.
	self assert: d faces equals: 6
]

{ #category : #tests }
DieTest >> testRolling [
	|d|
	d:= Die new.
	10 timesRepeat: [ self assert: (d roll between: 1 and: 6) ]
]
