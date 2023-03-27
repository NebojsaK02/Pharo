Extension { #name : #Integer }

{ #category : #'*MyDice' }
Integer >> D10 [
	^ self D: 10
]

{ #category : #'*MyDice' }
Integer >> D12 [
	^ self D: 12
]

{ #category : #'*MyDice' }
Integer >> D15 [
	^ self D: 15
]

{ #category : #'*MyDice' }
Integer >> D16 [
	^ self D: 16
]

{ #category : #'*MyDice' }
Integer >> D20 [
	^ self D: 20
]

{ #category : #'*MyDice' }
Integer >> D25 [
	^ self D: 25
]

{ #category : #'*MyDice' }
Integer >> D3 [
	^ self D: 3
]

{ #category : #'*MyDice' }
Integer >> D4 [
	^ self D: 4
]

{ #category : #'*MyDice' }
Integer >> D50 [
	^ self D: 50
]

{ #category : #'*MyDice' }
Integer >> D6 [
	^ self D: 6
]

{ #category : #'*MyDice' }
Integer >> D8 [
	^ self D: 8
]

{ #category : #'*MyDice' }
Integer >> D: aNumber [
	|handle|
	handle:=DieHandle new.
	self timesRepeat: [ handle addDie: (Die withFaces: aNumber) ].
	^ handle 
]

{ #category : #'*MyDice' }
Integer >> coinFlip [
	^ self D: 2
]
