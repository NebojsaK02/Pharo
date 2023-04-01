Class {
	#name : #AplikacijaStandalonePresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'workingModel',
		'imeLabel',
		'imeTextInput',
		'prezimeLabel',
		'prezimeTextInput',
		'brojTelefonaLabel',
		'brojTelefonaInput',
		'brojKucnogLabel',
		'brojKucnogInput',
		'sifraLabel',
		'sifraInput',
		'datumLabel',
		'datumInput',
		'polLabel',
		'polButtons',
		'muskoButton',
		'zenskoButton',
		'predajButton',
		'vratiButton'
	],
	#category : #MyApp
}

{ #category : #specs }
AplikacijaStandalonePresenter class >> defaultSpec [
	| fontWidth labelsWidth rowHeight|
	fontWidth := (StandardFonts defaultFont widthOfString: 'M').
	labelsWidth := fontWidth * 8.
	rowHeight := self inputTextHeight.
	
	^ SpLayout composed
		newColumn: [ :col | 

			col newRow: [ :row | 
				row add: #imeLabel right: labelsWidth.
				row add: #imeTextInput ]
			height: rowHeight.
		
			col newRow: [ :row | 
				row add: #prezimeLabel right: labelsWidth.
				row add: #prezimeTextInput ]
			height: rowHeight.

			col newRow: [ :row | 
				row add: #brojTelefonaLabel right: labelsWidth..
				row add: #brojTelefonaInput ]
			height: rowHeight.

		col newRow: [ :row | 
				row add: #brojKucnogLabel right: labelsWidth.
				row add: #brojKucnogInput ]
			height: rowHeight.

		col newRow: [ :row | 
				row add: #sifraLabel right: labelsWidth.
				row add: #sifraInput ]
			height: rowHeight.

		col newRow: [ :row | 
				row add: #datumLabel right: labelsWidth.
				row add: #datumInput ]
			height: rowHeight.

	col newRow: [ :row | 
				row add: #polLabel top: 0 bottom: rowHeight left: nil right: labelsWidth.
				row add: #muskoButton.
				row add: #zenskoButton.]
			height: rowHeight*2.

	col newRow: [ :row | 
				row add: #predajButton.
				row add: #vratiButton ]
			height: rowHeight*2.

		col newRow: [ :row |  ] ];
			
		yourself.	
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> brojKucnogInput [
^ brojKucnogInput
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> brojKucnogInput:anObject [
brojKucnogInput  :=anObject
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> brojKucnogLabel [
^ brojKucnogLabel 
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> brojKucnogLabel:anObject [
brojKucnogLabel :=anObject
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> brojTelefonaInput [
^ brojTelefonaInput 
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> brojTelefonaInput:anObject [
 brojTelefonaInput :=anObject 
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> brojTelefonaLabel [
^ brojTelefonaLabel 
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> brojTelefonaLabel:anObject [
 brojTelefonaLabel  :=anObject 
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> connectPresenters [
	self predajButton action: [ self submit ].
	self vratiButton action: [ self vrati ]
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> datumInput [
^ datumInput
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> datumInput: anObject [
	datumInput := anObject
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> datumLabel [
	^ datumLabel
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> datumLabel: anObject [
	datumLabel := anObject
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> imeLabel [
^ imeLabel
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> imeLabel: anObject [
 imeLabel:=anObject
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> imeTextInput [
 ^ imeTextInput 
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> imeTextInput:anObject [
  imeTextInput :=anObject 
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> initializePresenters [
	imeLabel := self newLabel label: 'Ime : '.
	imeTextInput := self newTextInput autoAccept: true.
	
	prezimeLabel := self newLabel label: 'Prezime : '.
	prezimeTextInput := self newTextInput autoAccept: true.
	
	brojTelefonaLabel := self newLabel label: 'Broj Mobilnog Telefona : '.
	brojTelefonaInput := self newNumberInput autoAccept: true.

	brojKucnogLabel := self newLabel label: 'Broj Kucnog Telefona : '.
	brojKucnogInput := self newNumberInput.
	
	sifraLabel := self newLabel label: 'Sifra :'.
	sifraInput := self newTextInput
		bePassword;
		autoAccept: true.
		
	datumLabel := self newLabel label: 'Datum : '.
	datumInput := self instantiate: SpDatePresenter.
	datumInput display: [ :item | item yyyymmdd ].
	
	muskoButton := self newRadioButton label: 'Musko'.
	zenskoButton := self newRadioButton label: 'Zensko'.
	muskoButton associatedRadioButtons: {zenskoButton}.
	polButtons := Dictionary newFrom: {(#musko -> muskoButton) . (#zensko -> zenskoButton)}.
	polLabel := self newLabel label: 'Pol : '.
	
	predajButton := self newButton label: 'PREDAJ'.
	vratiButton := self newButton label: 'VRATI'.
	
	self focusOrder 
		add: imeTextInput;
		add: prezimeTextInput;
		add: brojTelefonaInput;
		add: brojKucnogInput;
		add: sifraInput
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> modelChanged [

	workingModel := self model copy.

	self napuniFormuWorkingModel.

	
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> muskoButton [
	^ muskoButton
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> napisiUFajl [
	|fajl stream tIme tPre tSif tBr1 tBr2 tDat tPol|
	fajl:='fajl.txt' asFileReference.
	
	tIme:= imeTextInput text.
	tPre:= prezimeTextInput text.
	tBr1:= brojTelefonaInput number asString.
	tBr2:= brojKucnogInput number asString.
	tSif:= sifraInput text.
	tDat:= datumInput date asString.
	tPol:= (polButtons associations detect:[ :each | each value state ]) key.
		
	stream:=fajl writeStream.
	stream nextPutAll: tIme,'|', tPre,'|',tBr1,'|',tBr2,'|',tSif,'|',tDat,'|',tPol.
	stream close.
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> napuniFormuWorkingModel [
	| model |
	model := self workingModel.
	self imeTextInput text: model ime.
	self prezimeTextInput text: model prezime.
	self brojTelefonaInput text: model brojTelefona asString.
	self brojKucnogInput text: model brojKucnog asString.
	self sifraInput text: model sifra.
	self datumInput date: model datum.
	(polButtons at: model pol) state: true.
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> napuniModelFormom [
	self workingModel
		ime: self imeTextInput text;
		prezime: self prezimeTextInput text;
		brojTelefona: brojTelefonaInput number;
		brojKucnog: brojKucnogInput number;
		sifra: self sifraInput text;
		datum: self datumInput date.

	self workingModel pol: (polButtons associations detect:
	[ :each | each value state ]) key.
	
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> polLabel [
	^ polLabel
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> polLabel:anObject [
	polLabel:=anObject
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> predajButton [
^ predajButton
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> predajButton:anObject [
 predajButton:=anObject
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> prezimeLabel [
 ^ prezimeLabel
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> prezimeLabel: anObject [
 prezimeLabel:=anObject
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> prezimeTextInput [
 ^ prezimeTextInput 
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> prezimeTextInput:anObject [
  prezimeTextInput :=anObject 
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> sifraInput [
^ sifraInput
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> sifraInput:anObject [
 sifraInput:=anObject  
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> sifraLabel [
^ sifraLabel 
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> sifraLabel:anObject [
 sifraLabel:=anObject  
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> submit [
	self napuniModelFormom.
	self model: workingModel.
	self napisiUFajl.
	self announcingObject valueChanged.
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> vrati [
	self modelChanged
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> vratiButton [
^ vratiButton
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> vratiButton: anObject [
 vratiButton:=anObject
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> workingModel [ 
^ workingModel 
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> workingModel:anObject [ 
 workingModel :=anObject 
]

{ #category : #accessing }
AplikacijaStandalonePresenter >> zenskoButton [
	^ zenskoButton
]
