Class {
	#name : #MalLouvainNodeTest,
	#superclass : #TestCase,
	#instVars : [
		'nodeA',
		'nodeB',
		'algo'
	],
	#category : #'OpenStack-Analysis'
}

{ #category : #tests }
MalLouvainNodeTest >> setUp [
	algo := MalLouvainCommunities new.
	
	nodeA := algo addNodeFor: $a.
	nodeB := algo addNodeFor: $b.

]

{ #category : #tests }
MalLouvainNodeTest >> testChangingCommunity [
	self deny: nodeA community equals: nodeB community.

	nodeB inCommunity: nodeA community.

	self assert: nodeA community equals: nodeB community.
	self deny: nodeA community equals: nodeA.
	self deny: nodeB community equals: nodeB.
]

{ #category : #tests }
MalLouvainNodeTest >> testEdges [
	self assert: nodeA edges size equals: 0.
	self assert: nodeB edges size equals: 0.

	algo addEdgeFromNode: nodeA toNode: nodeB edgeModel: nil.

	self assert: nodeA edges size equals: 1.
	self assert: nodeB edges size equals: 1.
]

{ #category : #tests }
MalLouvainNodeTest >> testInitialCommunity [
	self assert: nodeA community equals: nodeA
]
