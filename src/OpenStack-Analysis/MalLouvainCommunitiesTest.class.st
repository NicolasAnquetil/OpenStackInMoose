Class {
	#name : #MalLouvainCommunitiesTest,
	#superclass : #TestCase,
	#instVars : [
		'louvain'
	],
	#category : #'OpenStack-Analysis'
}

{ #category : #tests }
MalLouvainCommunitiesTest >> graph2Nodes [
	^louvain := MalLouvainCommunities new
		nodes: #($a $b) ;
		edges: #(($a $b 1)) from: #first to: #second weight: #third ;
		yourself
]

{ #category : #tests }
MalLouvainCommunitiesTest >> graph5Nodes [
	^louvain := MalLouvainCommunities new
		nodes: #($a $b$c $d $e) ;
		edges: #(($a $b 1) ($b $c 1) ($c $a 1) ($c $d 1) ($d $e 2) ) from: #first to: #second weight: #third ;
		yourself
]

{ #category : #tests }
MalLouvainCommunitiesTest >> testModularityCommunityOf2Nodes [
	| nodeA nodeB |
	louvain := self graph2Nodes.
	nodeA := louvain findNode: $a.
	nodeB := louvain findNode: $b.
	nodeA inCommunity: nodeB.

	self assert: louvain modularity asFloat equals: 0.5.

	(louvain addEdgeFromNode: nodeB toNode: nodeA edgeModel: nil)
		weight: 1.
	
	self assert: louvain modularity asFloat equals: 0.5.

]

{ #category : #tests }
MalLouvainCommunitiesTest >> testModularityNoCommunities [
	self assert: self graph2Nodes modularity equals: 0
]

{ #category : #tests }
MalLouvainCommunitiesTest >> testTotalWeight2Nodes [
	self assert: self graph2Nodes totalWeights equals: 1
]

{ #category : #tests }
MalLouvainCommunitiesTest >> testTotalWeight5Nodes [
	self assert:  self graph5Nodes totalWeights equals: 6
]
