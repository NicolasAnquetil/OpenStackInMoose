Class {
	#name : #FamixOpenstackProperty,
	#superclass : #FamixOpenstackFonctionality,
	#instVars : [
		'#mandatory => FMProperty',
		'#parentEntity => FMOne type: #FamixOpenstackComplexEntity opposite: #properties'
	],
	#category : #'Openstack-Entities-Entities'
}

{ #category : #meta }
FamixOpenstackProperty class >> annotation [

	<FMClass: #Property super: #FamixOpenstackFonctionality>
	<package: #'Openstack-Entities'>
	<generated>
	^self
]

{ #category : #accessing }
FamixOpenstackProperty >> mandatory [

	<FMProperty: #mandatory type: #Boolean>
	<generated>
	<FMComment: 'Whether the resource can be instanciated or not'>
	^ mandatory
]

{ #category : #accessing }
FamixOpenstackProperty >> mandatory: anObject [
	<generated>
	mandatory := anObject
]

{ #category : #accessing }
FamixOpenstackProperty >> parentEntity [
	"Relation named: #parentEntity type: #FamixOpenstackComplexEntity opposite: #properties"

	<generated>
	<FMComment: 'Resource owning this Attribute'>
	^ parentEntity
]

{ #category : #accessing }
FamixOpenstackProperty >> parentEntity: anObject [

	<generated>
	parentEntity := anObject
]
