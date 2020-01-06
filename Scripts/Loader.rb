#=======================================================
# Loader
#-------------------------------------------------------
# Encargado cargar todos los scripts externos
#-------------------------------------------------------
#=======================================================

module Importar_rb

   def self.cargar
     files = Dir[Dir.pwd+"/Scripts/Base/**/*.rb"]
     files.each do |file_name|
       require file_name
     end
   end
   
end

Importar_rb.cargar