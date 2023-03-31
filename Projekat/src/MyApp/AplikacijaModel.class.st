Class {
	#name : #AplikacijaModel,
	#superclass : #Object,
	#instVars : [
		'ime',
		'prezime',
		'brojTelefona',
		'brojKucnog',
		'sifra',
		'datum',
		'pol'
	],
	#category : #MyApp
}

{ #category : #accessing }
AplikacijaModel >> brojKucnog [
^ brojKucnog 
]

{ #category : #accessing }
AplikacijaModel >> brojKucnog: anObject [
 brojKucnog:=anObject  
]

{ #category : #accessing }
AplikacijaModel >> brojTelefona [
^ brojTelefona 
]

{ #category : #accessing }
AplikacijaModel >> brojTelefona: anObject [
 brojTelefona:=anObject  
]

{ #category : #accessing }
AplikacijaModel >> datum [
^ datum
]

{ #category : #accessing }
AplikacijaModel >> datum: anObject [
 datum:=anObject 
]

{ #category : #accessing }
AplikacijaModel >> elements [
	^ { 
		'Ime' -> self ime.
		'Prezime' -> self prezime.
		'Broj Mobilnog Telefona' -> self brojTelefona.
		'Broj Kucnog Kucnog' -> self brojKucnog.
		'Sifra' -> self sifra.
		'Datum' -> self datum.
		'Pol' -> self pol.
		}
]

{ #category : #accessing }
AplikacijaModel >> ime [
 ^ ime
]

{ #category : #accessing }
AplikacijaModel >> ime: anObject [ 
 ime:=anObject 
]

{ #category : #accessing }
AplikacijaModel >> initialize [
	super initialize.
	ime:='Nebojsa'.
	prezime:='Kucalovic'.
	brojTelefona :=010101.
	brojKucnog :=232323.
	sifra:='sifra'.
	datum :='2023-3-30' asDate.
	pol:=#musko
]

{ #category : #accessing }
AplikacijaModel >> pol [
^ pol
]

{ #category : #accessing }
AplikacijaModel >> pol: anObject [
 pol:= anObject
]

{ #category : #accessing }
AplikacijaModel >> polovi [
^ #(musko zensko)
]

{ #category : #accessing }
AplikacijaModel >> prezime [
^ prezime
]

{ #category : #accessing }
AplikacijaModel >> prezime: anObject [ 
prezime := anObject
]

{ #category : #accessing }
AplikacijaModel >> sifra [
^ sifra
]

{ #category : #accessing }
AplikacijaModel >> sifra: anObject [ 
 sifra:=anObject 
]
