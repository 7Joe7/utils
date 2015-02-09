# encoding: UTF-8
require 'uu_os_client'
require 'uu_adk_client'
include UU::OS
  
UU::OS::Security::Session.login('C:\Users\User\myAccessCodes')
  
UU::ADK::App.create("ues:DEV0105-BT:BT0105/MET", 
  :name => "Lovecký klub", 
  :code => "NEC.LK", 
  :metaArtifactUri => "ues:DEV0105-BT:UU.ADK/DEVAPP")
  
meta_model = MetaModel.create("ues:DEV0105-BT:NEC.LK",
  :name => "Lovecký klub Meta Model", 
  :code => "NEC.LK/METAMODEL",
  :meta_artifact_uri => "ues:DEV0105-BT:UU.OS/METAMODEL")
 
control_panel = MetaArtifact.copy("ues:DEV0105-BT:UU.OS/ART",
  :location_uri => "ues:DEV0105-BT:NEC.LK/METAMODEL", 
  :name => "Ovládací panel",
  :code => "NEC.LK/CP")
  
location = MetaArtifact.copy("ues:DEV0105-BT:UU.OS/ART",
  :location_uri => meta_model, 
  :name => "Stanoviště",
  :code => "NEC.LK/STANOVISTE")
  
hunter = MetaArtifact.copy("ues:DEV0105-BT:UU.OS/ART",
  :location_uri => meta_model, 
  :name => "Lovec",
  :code => "NEC.LK/LOVEC")

animal = MetaArtifact.copy("ues:DEV0105-BT:UU.OS/ART",
  :location_uri => meta_model, 
  :name => "Druh zvěře",
  :code => "NEC.LK/DRUH")

watch = MetaArtifact.copy("ues:DEV0105-BT:UU.OS/ART",
  :location_uri => meta_model, 
  :name => "Číhaná",
  :code => "NEC.LK/CIHANA")

role_interface = RoleInterface.create(meta_model,
  :name => "Lovecký klub - rozhraní", 
  :code => "NEC.LK/RIF",
  :meta_artifact_uri => "ues:DEV0105-BT:UU.OS/RIF")
 
RoleInterface.add_meta_artifact(role_interface, :meta_artifact_uri => location)
RoleInterface.add_meta_artifact(role_interface, :meta_artifact_uri => hunter)
RoleInterface.add_meta_artifact(role_interface, :meta_artifact_uri => animal)
RoleInterface.add_meta_artifact(role_interface, :meta_artifact_uri => watch)
RoleInterface.add_meta_artifact("ues:DEV0105-BT:NEC.LK/RIF", :meta_artifact_uri => control_panel)


Artifact.set_state('ues:DEV0105-BT:NEC.LK', :type => "ACTIVE")
Artifact.set_state(meta_model, :type => "ACTIVE")
Artifact.set_state(location, :type => "ACTIVE")
Artifact.set_state(hunter, :type => "ACTIVE")
Artifact.set_state(animal, :type => "ACTIVE")
Artifact.set_state(watch, :type => "ACTIVE")
Artifact.set_state(role_interface, :type => "ACTIVE")
Artifact.set_state(control_panel, :type => "ACTIVE")