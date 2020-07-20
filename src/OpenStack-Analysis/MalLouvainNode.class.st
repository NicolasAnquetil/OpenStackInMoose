"
A node for the Louvain community finding algorithm.
It may represent a ""traditional"" node, or a community of node (i.e. a grouping of MalLouvainNode)

It has a community, the list of its nodes, and the list of its edges

By default the community of a node is itself (singleton community)
"
Class {
	#name : #MalLouvainNode,
	#superclass : #MalGraphNode,
	#instVars : [
		'community',
		'edges',
		'nodes'
	],
	#category : #'OpenStack-Analysis'
}

{ #category : #accessing }
MalLouvainNode >> addEdge: anEdge [
	edges add: anEdge 
]

{ #category : #accessing }
MalLouvainNode >> community [
	^ community
]

{ #category : #accessing }
MalLouvainNode >> degree [
	"sum of the weights on the edges stemming from receiver"
	^self edges inject: 0 into: [ :accum :edge | accum + edge weight ]
]

{ #category : #accessing }
MalLouvainNode >> edges [
	^ edges
]

{ #category : #accessing }
MalLouvainNode >> edges: anObject [
	edges := anObject
]

{ #category : #accessing }
MalLouvainNode >> inCommunity: aCommunity [ 
	^aCommunity isSelfCommunity
		ifTrue: [
			self class new
				unsafeAddNode: aCommunity ;
				unsafeAddNode: self ;
				yourself
		]
		ifFalse: [ aCommunity unsafeAddNode: self ]
]

{ #category : #accessing }
MalLouvainNode >> initialize [ 
	super initialize.
	edges := OrderedCollection new.
	community := self.
	nodes := OrderedCollection with: self
]

{ #category : #testing }
MalLouvainNode >> isSelfCommunity [
	^(self nodes size = 1) and: [ self nodes first = self ]
]

{ #category : #accessing }
MalLouvainNode >> nodes [
	^nodes
]

{ #category : #accessing }
MalLouvainNode >> to: aNode edge: edge [
	self addEdge: edge
]

{ #category : #private }
MalLouvainNode >> unsafeAddNode: aNode [
	nodes add: aNode.
	aNode unsafeCommunity: self
]

{ #category : #private }
MalLouvainNode >> unsafeCommunity: aCommunity [
	community := aCommunity
]
