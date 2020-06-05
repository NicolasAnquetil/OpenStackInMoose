Class {
	#name : #FamixOpenstackLength,
	#superclass : #FamixOpenstackConstraint,
	#instVars : [
		'#min => FMProperty',
		'#max => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackLength class >> annotation [

	<FMClass: #Length super: #FamixOpenstackConstraint>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackLength >> max [

	<FMProperty: #max type: #Number>
	<generated>
	^ max
]

{ #category : #accessing }
FamixOpenstackLength >> max: anObject [
	<generated>
	max := anObject
]

{ #category : #accessing }
FamixOpenstackLength >> min [

	<FMProperty: #min type: #Number>
	<generated>
	^ min
]

{ #category : #accessing }
FamixOpenstackLength >> min: anObject [
	<generated>
	min := anObject
]
