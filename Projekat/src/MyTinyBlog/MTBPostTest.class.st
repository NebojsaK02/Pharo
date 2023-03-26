Class {
	#name : #MTBPostTest,
	#superclass : #TestCase,
	#category : #MyTinyBlog
}

{ #category : #tests }
MTBPostTest >> testPostIsCreatedCorrectly [
| post |
post := MTBPost
	title: 'Welcome to TinyBlog'
	text: 'TinyBlog is a small blog engine made with Pharo.'
	category: 'TinyBlog'.
self assert: post title equals: 'Welcome to TinyBlog' .
self assert: post text equals: 'TinyBlog is a small blog engine made with Pharo.'.
]

{ #category : #tests }
MTBPostTest >> testWithoutCategoryIsUnclassified [
|post|
post:=MTBPost 
	title: 'Welcome to TinyBlog'
	text:  'TinyBlog is a small blog engine made with Pharo.'.
self assert: post title equals: 'Welcome to TinyBlog' .
self assert: post isUnclassified.
self deny: post isVisible
]
