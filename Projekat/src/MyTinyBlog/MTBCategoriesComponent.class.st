Class {
	#name : #MTBCategoriesComponent,
	#superclass : #WAComponent,
	#instVars : [
		'categories',
		'postsList'
	],
	#category : #'MyTinyBlog-Components'
}

{ #category : #'as yet unclassified' }
MTBCategoriesComponent class >> categories: categories postsList: aTBScreen [
	^ self new categories: categories; postsList: aTBScreen
]

{ #category : #accessing }
MTBCategoriesComponent >> categories [ 
	^ categories
]

{ #category : #accessing }
MTBCategoriesComponent >> categories: aCollection [
	categories := aCollection asSortedCollection
]

{ #category : #accessing }
MTBCategoriesComponent >> postsList [
	^ postsList 
]

{ #category : #accessing }
MTBCategoriesComponent >> postsList: aComponent [
	postsList := aComponent
]

{ #category : #'as yet unclassified' }
MTBCategoriesComponent >> renderCategoryLinkOn: html with: aCategory [
	html tbsLinkifyListGroupItem
class: 'active' if: aCategory = self postsList currentCategory;
callback: [ self selectCategory: aCategory ];
with: aCategory

]

{ #category : #'as yet unclassified' }
MTBCategoriesComponent >> renderContentOn: html [
	html tbsListGroup: [
	html tbsListGroupItem
	with: [ html strong: 'Categories' ].
	categories do: [ :cat |
	self renderCategoryLinkOn: html with: cat ] ]
]

{ #category : #'as yet unclassified' }
MTBCategoriesComponent >> selectCategory: aCategory [
	postsList currentCategory: aCategory
]
