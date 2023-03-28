Class {
	#name : #MTBPostsListComponent,
	#superclass : #MTBScreenComponent,
	#instVars : [
		'currentCategory'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #'as yet unclassified' }
MTBPostsListComponent >> basicRenderCategoriesOn: html [
html render: self categoriesComponent

]

{ #category : #'as yet unclassified' }
MTBPostsListComponent >> basicRenderPostsOn: html [
self readSelectedPosts do: [ :p |
html render: (self postComponentFor: p) ]
]

{ #category : #'as yet unclassified' }
MTBPostsListComponent >> categoriesComponent [
	^ MTBCategoriesComponent 
		categories: self blog allCategories 
		postsList: self
]

{ #category : #'as yet unclassified' }
MTBPostsListComponent >> currentCategory [
	^ currentCategory
]

{ #category : #'as yet unclassified' }
MTBPostsListComponent >> currentCategory: anObject [
	currentCategory := anObject
]

{ #category : #'as yet unclassified' }
MTBPostsListComponent >> postComponentFor: aPost [
^ MTBPostComponent new post: aPost
]

{ #category : #'as yet unclassified' }
MTBPostsListComponent >> readSelectedPosts [
	^ self currentCategory
	ifNil: [ self blog allVisibleBlogPosts ]
	ifNotNil: [ self blog allVisibleBlogPostsFromCategory: self
	currentCategory ]

]

{ #category : #'as yet unclassified' }
MTBPostsListComponent >> renderCategoryColumnOn: html [
	html tbsColumn
		extraSmallSize: 12;
		smallSize: 2;
		mediumSize: 4;
		with: [ self basicRenderCategoriesOn: html ]
]

{ #category : #'as yet unclassified' }
MTBPostsListComponent >> renderContentOn: html [
	super renderContentOn: html.
html
tbsContainer: [
html tbsRow
showGrid;
with: [ self renderCategoryColumnOn: html.
self renderPostColumnOn: html ] ]

]

{ #category : #'as yet unclassified' }
MTBPostsListComponent >> renderPostColumnOn: html [
	html tbsColumn
		extraSmallSize: 12;
		smallSize: 10;
		mediumSize: 8;
		with: [ self basicRenderPostsOn: html ]
]
