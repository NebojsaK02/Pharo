Class {
	#name : #MTBBlogTest,
	#superclass : #TestCase,
	#instVars : [
		'blog',
		'post',
		'first',
		'previousRepository'
	],
	#category : #'MyTinyBlog-Tests'
}

{ #category : #running }
MTBBlogTest >> setUp [
	previousRepository := VORepository current.
	VORepository setRepository: VOMemoryRepository new.
	blog := MTBBlog current.
	first := MTBPost title: 'A title' text: 'A text' category: 'First Category'.
	blog writeBlogPost: first.
	post := (MTBPost title: 'Another title' text: 'Another text'
	category: 'Second Category') beVisible
]

{ #category : #running }
MTBBlogTest >> tearDown [ 
	VORepository setRepository: previousRepository 
]

{ #category : #tests }
MTBBlogTest >> testAddBlogPost [
	blog writeBlogPost: post.
	self assert: blog size equals: 2
]

{ #category : #tests }
MTBBlogTest >> testAllBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allBlogPosts size equals: 2
]

{ #category : #tests }
MTBBlogTest >> testAllBlogPostsFromCategory [
	self
		assert: (blog allBlogPostsFromCategory: 'First Category') size
		equals: 1
]

{ #category : #tests }
MTBBlogTest >> testAllCategories [
	blog writeBlogPost: post.
	self assert: blog allCategories size equals: 2
]

{ #category : #tests }
MTBBlogTest >> testAllVisibleBlogPosts [
	blog writeBlogPost: post.
	self assert: blog allVisibleBlogPosts size equals: 1
]

{ #category : #tests }
MTBBlogTest >> testAllVisibleBlogPostsFromCategory [
	| tmp2 |
	blog writeBlogPost: post.
	tmp2 := self.
	tmp2
		assert:
			(blog
				allVisibleBlogPostsFromCategory:
					'First Category') size
			equals: 0;
		assert:
			(blog
				allVisibleBlogPostsFromCategory:
					'Second Category') size
			equals: 1
]

{ #category : #tests }
MTBBlogTest >> testRemoveAllBlogPosts [
	blog removeAllPosts.
	self assert: blog size equals: 0
]

{ #category : #tests }
MTBBlogTest >> testRemoveBlogPost [
self assert: blog size equals: 1.
blog removeBlogPost: blog allBlogPosts anyOne.
self assert: blog size equals: 0

]

{ #category : #tests }
MTBBlogTest >> testSize [ 
	self assert: blog size equals: 1
]

{ #category : #tests }
MTBBlogTest >> testUnclassifiedBlogPosts [
	self assert: (blog allBlogPosts select: [:p|p isUnclassified ])size equals:0
]
