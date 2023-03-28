Class {
	#name : #MTBBlog,
	#superclass : #Object,
	#instVars : [
		'posts'
	],
	#category : #MyTinyBlog
}

{ #category : #initialization }
MTBBlog class >> createDemoPosts [
	"MTB napravi demo post"
	self current
writeBlogPost: ((MTBPost title: 'Welcome in TinyBlog' text:
'TinyBlog is a small blog engine made with Pharo.' category:
'TinyBlog') visible: true);
writeBlogPost: ((MTBPost title: 'Report Pharo Sprint' text:
'Friday, June 12 there was a Pharo sprint / Moose dojo. It was a
nice event with more than 15 motivated sprinters. With the help
of candies, cakes and chocolate, huge work has been done'
category: 'Pharo') visible: true);
writeBlogPost: ((MTBPost title: 'Brick on top of Bloc -
Preview' text: 'We are happy to announce the first preview
version of Brick, a new widget set created from scratch on top
of Bloc. Brick is being developed primarily by Alex Syrel
(together with Alain Plantec, Andrei Chis and myself), and the
work is sponsored by ESUG.
Brick is part of the Glamorous Toolkit effort and will provide
the basis for the new versions of the development tools.'
category: 'Pharo') visible: true);
writeBlogPost: ((MTBPost title: 'The sad story of unclassified
blog posts' text: 'So sad that I can read this.') visible: true);
writeBlogPost: ((MTBPost title: 'Working with Pharo on the
Raspberry Pi' text: 'Hardware is getting cheaper and many new
small devices like the famous Raspberry Pi provide new
computation power that was one once only available on regular
desktop computers.' category: 'Pharo') visible: true)

]

{ #category : #initialization }
MTBBlog class >> current [
	"Odgovara instanci MTBRepository"
	^ self selectAll
	ifNotEmpty: [ :x | x anyOne ]
	ifEmpty: [ self new save ]
]

{ #category : #initialization }
MTBBlog class >> initialize [ 
self reset
]

{ #category : #initialization }
MTBBlog class >> initializeVoyageOnMemoryDB [ 
	VOMemoryRepository new enableSingleton 
]

{ #category : #initialization }
MTBBlog class >> isVoyageRoot [ 
	"Potrebno za Voyage, Top-Level"
	^ true
]

{ #category : #initialization }
MTBBlog class >> reset [ 
	self initializeVoyageOnMemoryDB
]

{ #category : #'as yet unclassified' }
MTBBlog >> allBlogPosts [
	^ posts
]

{ #category : #'as yet unclassified' }
MTBBlog >> allBlogPostsFromCategory: aCategory [
	^ posts select: [ :p|p category=aCategory ]
]

{ #category : #'as yet unclassified' }
MTBBlog >> allCategories [ 
	^ (self allBlogPosts collect: [:p|p category ]) asSet 
]

{ #category : #'as yet unclassified' }
MTBBlog >> allVisibleBlogPosts [
	^ posts select: [ :p|p isVisible  ]
]

{ #category : #'as yet unclassified' }
MTBBlog >> allVisibleBlogPostsFromCategory: aCategory [
	^ posts select: [ :p | p category = aCategory
	and: [ p isVisible ] ]
]

{ #category : #initialization }
MTBBlog >> initialize [ 

super initialize.
posts:=OrderedCollection new 
]

{ #category : #initialization }
MTBBlog >> removeAllPosts [
	posts := OrderedCollection new.
	self save.
]

{ #category : #initialization }
MTBBlog >> size [ 
	^ posts size 
]

{ #category : #initialization }
MTBBlog >> writeBlogPost: aPost [
	"Dodaj blog post u listu postova"
	self allBlogPosts add: aPost.
	self save
]
