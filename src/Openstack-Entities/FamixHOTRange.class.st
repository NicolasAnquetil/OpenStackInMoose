Class {
	#name : #FamixHOTRange,
	#superclass : #FamixHOTConstraint,
	#instVars : [
		'#min => FMProperty',
		'#max => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTRange class >> annotation [

	<FMClass: #Range super: #FamixHOTConstraint>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixHOTRange >> max [

	<FMProperty: #max type: #Number>
	<generated>
	^ max
]

{ #category : #accessing }
FamixHOTRange >> max: anObject [
	<generated>
	max := anObject
]

{ #category : #accessing }
FamixHOTRange >> min [

	<FMProperty: #min type: #Number>
	<generated>
	^ min
]

{ #category : #accessing }
FamixHOTRange >> min: anObject [
	<generated>
	min := anObject
]
