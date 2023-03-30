Class {
	#name : #MTBApplicationRootComponent,
	#superclass : #WAComponent,
	#instVars : [
		'main'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #'class initialization' }
MTBApplicationRootComponent class >> canBeRoot [ 
	^ true
]

{ #category : #'class initialization' }
MTBApplicationRootComponent class >> initialize [
	| app |
app := WAAdmin register: self asApplicationAt: 'TinyBlog'.
app
preferenceAt: #sessionClass put: MTBSession.
app
addLibrary: JQDeploymentLibrary;
addLibrary: JQUiDeploymentLibrary;
addLibrary: TBSDeploymentLibrary
]

{ #category : #rendering }
MTBApplicationRootComponent >> children [
	^ { main }
]

{ #category : #initialization }
MTBApplicationRootComponent >> initialize [
	super initialize.
	main := MTBPostsListComponent new 
]

{ #category : #initialization }
MTBApplicationRootComponent >> main: aComponent [
	main := aComponent
]

{ #category : #rendering }
MTBApplicationRootComponent >> renderContentOn: html [ 
	html render: main
]

{ #category : #rendering }
MTBApplicationRootComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'TinyBlog'
]
