Class {
	#name : #FamixOpenstackRange,
	#superclass : #FamixOpenstackConstraint,
	#instVars : [
		'#min => FMProperty',
		'#max => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackRange class >> annotation [

	<FMClass: #Range super: #FamixOpenstackConstraint>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackRange >> max [

	<FMProperty: #max type: #Number>
	<generated>
	^ max
]

{ #category : #accessing }
FamixOpenstackRange >> max: anObject [
	<generated>
	max := anObject
]

{ #category : #accessing }
FamixOpenstackRange >> min [

	<FMProperty: #min type: #Number>
	<generated>
	^ min
]

{ #category : #accessing }
FamixOpenstackRange >> min: anObject [
	<generated>
	min := anObject
]
