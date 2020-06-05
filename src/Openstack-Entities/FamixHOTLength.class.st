Class {
	#name : #FamixHOTLength,
	#superclass : #FamixHOTConstraint,
	#instVars : [
		'#min => FMProperty',
		'#max => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTLength class >> annotation [

	<FMClass: #Length super: #FamixHOTConstraint>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixHOTLength >> max [

	<FMProperty: #max type: #Number>
	<generated>
	^ max
]

{ #category : #accessing }
FamixHOTLength >> max: anObject [
	<generated>
	max := anObject
]

{ #category : #accessing }
FamixHOTLength >> min [

	<FMProperty: #min type: #Number>
	<generated>
	^ min
]

{ #category : #accessing }
FamixHOTLength >> min: anObject [
	<generated>
	min := anObject
]
