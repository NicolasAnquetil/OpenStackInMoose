"
""Louvain"" algorithm to find communities in large graphs
Runs on weighted edges

Vincent D Blondel, Jean-Loup Guillaume, Renaud Lambiotte and Etienne Lefebvre
""Fast unfolding of communities in large networks""
Journal of Statistical Mechanics: Theory and Experiment, 2008
https://www.researchgate.net/publication/1913681_Fast_Unfolding_of_Communities_in_Large_Networks
"
Class {
	#name : #MalLouvainCommunities,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'totalWeights'
	],
	#category : #'OpenStack-Analysis'
}

{ #category : #accessing }
MalLouvainCommunities >> addEdgeFromNode: fromNode toNode: toNode edgeModel: eModel [
	| return |
	return := super addEdgeFromNode: fromNode toNode: toNode edgeModel: eModel.
	totalWeights := nil.
	^return
]

{ #category : #configuration }
MalLouvainCommunities >> edgeClass [
	^MalWeightedEdge 
]

{ #category : #api }
MalLouvainCommunities >> modularity [
	| sum dividende |
	dividende:= 2 * self totalWeights.
	sum :=
		self edges inject: 0 into: [ :accum :edge |
			(edge from community = edge to community)
				ifTrue: [ accum + edge weight - (edge from degree * edge to degree / dividende) ]
				ifFalse: [  accum " + 0" ]
		].
	^sum / dividende
]

{ #category : #configuration }
MalLouvainCommunities >> nodeClass [
	^MalLouvainNode 
]

{ #category : #accessing }
MalLouvainCommunities >> totalWeights [
	^totalWeights
		ifNil: [
			totalWeights := self edges inject: 0 into: [ :accum :edge | accum + edge weight ]
		]
]

{ #category : #accessing }
MalLouvainCommunities >> totalWeights: anObject [
	totalWeights := anObject
]
