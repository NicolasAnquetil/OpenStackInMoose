Class {
	#name : #OpenStackGenerator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'resource',
		'map',
		'property',
		'attribute',
		'functionality',
		'openStackEntity',
		'complexEntity',
		'package'
	],
	#category : #OpenStack
}

{ #category : #accessing }
OpenStackGenerator class >> packageName [
	^ #'Openstack-Entities'
]

{ #category : #accessing }
OpenStackGenerator class >> prefix [
	^ #'FamixOpenstack'
]

{ #category : #definition }
OpenStackGenerator >> defineClasses [
	super defineClasses.

	openStackEntity  := builder newClassNamed: #OpenStackEntity.
	
	complexEntity := builder newClassNamed: #ComplexEntity.
	package := builder newClassNamed: #Package.
	resource := builder newClassNamed: #Resource.
	map := builder newClassNamed: #Map.
	
	functionality := builder newClassNamed: #Fonctionality.
	property := builder newClassNamed: #Property.
	attribute := builder newClassNamed: #Attribute.
]

{ #category : #definition }
OpenStackGenerator >> defineHierarchy [
	super defineHierarchy.
	
	openStackEntity --|> #TNamedEntity.

	package --|> openStackEntity.

	complexEntity --|> openStackEntity.
	resource --|> complexEntity.
	map --|> complexEntity.

	functionality --|> openStackEntity.
	property --|> functionality.
	attribute --|> functionality.
	

]

{ #category : #definition }
OpenStackGenerator >> defineProperties [
	super defineProperties.

	((resource property: #status type: #String) 
		comment: 'Three possible statuses for Resources: #supported, #unsupported, #deprecated').
	((resource property: #abstract type: #Boolean) 
		comment: 'Whether the resource can be instanciated or not').

	((property property: #mandatory type: #Boolean) 
		comment: 'Whether the resource can be instanciated or not').

]

{ #category : #definition }
OpenStackGenerator >> defineRelations [
	super defineRelations.

	((package property: #childrenPackages)
		comment: 'Children packages contained in this package')
		<>-*
	((package property: #parentPackage)
		comment: 'Parent package owning this Package').

	((package property: #childrenEntities)
		comment: 'Children complexEntities contained in this package')
		<>-*
	((complexEntity property: #parentPackage)
		comment: 'Parent package owning this ComplexEntity').

	((complexEntity property: #properties) 
		comment: 'All the Properties of the Complexentity')
		-*
	((property property: #parentEntity)
		comment: 'Resource owning this Attribute').

	((resource property: #attributes) 
		comment: 'All the Attributes of the Resource')
		-*
	((property property: #parentEntity)
		comment: 'ComplexEntity owning this Property').

	((functionality property: #referredEntity)
		comment: 'Optional ComplexEntity contained in this functionality')
		*-
	((complexEntity property: #referringFunctionalities)
		comment: 'All Attributes or Properties that refer to this ComplexEntity').
]
