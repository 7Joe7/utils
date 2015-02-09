# encoding: UTF-8
require "ues.core"

#require "ues.request"

#source_uri = "ues:DEV0105-BT:PROD/LOCATIONS"

#flds = ["ues:DEV0105-BT:PROD/PRODUCTS","ues:DEV0105-BT:PROD/LOCATIONS","ues:DEV0105-BT:PROD/PRODUCT_TYPES","ues:DEV0105-BT:PROD/AUTHORS","ues:DEV0105-BT:PROD/PRODUCERS","ues:DEV0105-BT:PROD.TRASH"]
#
##flds = ["ues:DEV0105-BT:PROD/PRODUCTS","ues:DEV0105-BT:PROD/LOCATIONS"]

flds = ["ues:DEV0105-BT:WIKI/DTB8","ues:DEV0105-BT:WIKI/DTB2","ues:DEV0105-BT:WIKI/DTB4","ues:DEV0105-BT:WIKI/DTB8","ues:DEV0105-BT:WIKI/DTB8","ues:DEV0105-BT:PROD-EVID100","ues:DEV0105-BT:PROD-EVID1233","ues:DEV0105-BT:PROD-EVID130","ues:DEV0105-BT:PROD-EVID150","ues:DEV0105-BT:PROD-EVID7","ues:DEV0105-BT:PROD-EVID88","ues:DEV0105-BT:PROD-EVID2","ues:DEV0105-BT:PROD-EVID6","ues:DEV0105-BT:PROD-EVID12","ues:DEV0105-BT:PROD-EVIDI"]
@roles = []




def delete_str(source_uri)

  if UESEntityType.isInstanceOf(source_uri,UESCoreEntityTypes::FOLDER)
    obj = UESFolder
    type = UESFolderEntryType
  else
    obj = UESOrganizationalUnit
    type = UESOrganizationalUnitEntryType
  end

  arts = obj.getEntryList(source_uri,:recursive => true)

  puts "Počet objektů: #{arts.size}"

  puts "Mažu hodnoty všech referencí na artefaktech..."

  arts.each_with_index do |art,i|

    puts "#{i} #{art.uri}"

    prps = UESProperty.getEntryList(art.uri,:query => "type=PROPERTY and valueType=REFERENCE",:recursive => true)
    prps.each do |prp|

      if !prp.value.to_s.empty?
        UESProperty.setValue(prp.uri,nil)
      end

    end
  end

  puts "Nastavuji kompetence"
  arts.each do |art|
    UESArtifact.setCompetentRole(art.uri,:competentRoleUri => "ues:DEV0105-BT:WIKI~EA")
  end
  UESArtifact.setCompetentRole(source_uri,:competentRoleUri => "ues:DEV0105-BT:WIKI~EA")

  puts "Hodnoty vlastností smazány."
  puts "Mažu artefakty..."

  arts.each_with_index do |art,i|

    if art.type == type::ARTIFACT || art.type == type::SHORTCUT

      puts "#{i} #{art.uri}"

      if UESEntityType.isInstanceOf(art.uri,UESCoreEntityTypes::SHORTCUT)
        puts "Mažu zástupce #{art.uri}"
        UESShortcut.delete(art.uri)
      elsif !UESEntityType.isInstanceOf(art.uri,UESCoreEntityTypes::ROLE) && !UESEntityType.isInstanceOf(art.uri,UESCoreEntityTypes::GROUP)
        puts "Mažu artefakt #{art.uri}."
        UESArtifact.delete(art.uri)

      end

    end

  end

  arts = obj.getEntryList(source_uri,:recursive => true)

  arts.each_with_index do |art,i|

    puts "#{i} #{art.uri}"

    if art.type == type::ARTIFACT || art.type == type::SHORTCUT

      if UESEntityType.isInstanceOf(art.uri,UESCoreEntityTypes::ROLE)
        puts "Mažu roli #{art.uri}"
        begin

          @roles << art.uri

          UESArtifact.move(art.uri,:locationUri => "ues:DEV0105-BT:WIKI")

          UESRole.delete(art.uri)
        rescue Exception => e
          puts e.message
        end
      elsif UESEntityType.isInstanceOf(art.uri,UESCoreEntityTypes::GROUP)
        puts "Mažu roli #{art.uri}"
        begin
          UESGroup.delete(art.uri)
        rescue Exception => e
          puts e.message
        end
      else
        puts "Mažu artefakt #{art.uri}."
        UESArtifact.delete(art.uri)

      end

    end

  end

  arts = obj.getEntryList(source_uri,:recursive => true)

  puts "Mažu složky a OJ..."

  arts.each_with_index do |art,i|

    puts "#{i} #{art.uri}"

    if UESEntityType.isInstanceOf(art.uri,UESCoreEntityTypes::ORGANIZATIONALUNIT)
      puts "Mažu OJ #{art.uri}"

      delete_str(art.uri)

      begin
        UESOrganizationalUnit.delete(art.uri)
      rescue Exception => e
        puts e.message
      end

    elsif UESEntityType.isInstanceOf(art.uri,UESCoreEntityTypes::FOLDER)
      puts "Mažu složku #{art.uri}"
      begin
        UESFolder.delete(art.uri)
      rescue Exception => e
        puts e.message
      end

    end

  end

rescue Exception => e
  puts e.message

end

begin

  flds.each do |source_uri|

    begin

      prps = UESProperty.getEntryList(source_uri,:query => "type=PROPERTY and valueType=REFERENCE",:recursive => true)

    rescue MainEntityDoesNotExistRTException => e
      next

    end

    prps.each do |prp|

      if !prp.value.to_s.empty?
        UESProperty.setValue(prp.uri,nil)
      end

    end

    delete_str(source_uri)
    begin
      UESOrganizationalUnit.delete(source_uri)
    rescue Exception =>e
      puts e.message

    end

  end

  @roles.each do |role_uri|

    UESRole.delete(role_uri)
    @roles.delete(role_uri)

  end

end

org_unit = 'ues:DEV0105-BT:WIKI/DTB'
for i in 1..25 do
  delete_str(org_unit + i.to_s)
end