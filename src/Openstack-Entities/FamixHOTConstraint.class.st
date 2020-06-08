Class {
	#name : #FamixHOTConstraint,
	#superclass : #FamixHOTEntity,
	#instVars : [
		'#constrainedFeature => FMOne type: #FamixHOTFeature opposite: #constraints',
		'#description => FMProperty'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixHOTConstraint class >> annotation [

	<FMClass: #Constraint super: #FamixHOTEntity>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixHOTConstraint >> constrainedFeature [
	"Relation named: #constrainedFeature type: #FamixHOTFeature opposite: #constraints"

	<generated>
	^ constrainedFeature
]

{ #category : #accessing }
FamixHOTConstraint >> constrainedFeature: anObject [

	<generated>
	constrainedFeature := anObject
]

{ #category : #accessing }
FamixHOTConstraint >> description [

	<FMProperty: #description type: #String>
	<generated>
	^ description
]

{ #category : #accessing }
FamixHOTConstraint >> description: anObject [
	<generated>
	description := anObject
]
