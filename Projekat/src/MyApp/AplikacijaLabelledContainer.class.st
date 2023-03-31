Class {
	#name : #AplikacijaLabelledContainer,
	#superclass : #SpLabelledContainer,
	#category : #MyApp
}

{ #category : #specs }
AplikacijaLabelledContainer class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #label withConstraints: [ :constraints | constraints height: self inputTextHeight ];
		add: #subwidget;
		yourself
]

{ #category : #accessing }
AplikacijaLabelledContainer >> label: aString [ 
label label: ' - ', aString, ' - '
]
