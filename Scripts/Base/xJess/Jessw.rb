# encoding: utf-8
#=======================================================
# Jessw
#-------------------------------------------------------
# Cargar y guardar la info de partidas y otros Datos
#-------------------------------------------------------
#=======================================================


#-------------------------------------------------------
# Carga la información del objeto guardado
# $data = Jessw.l(archivo)
#
# Guarda la información del objeto dado
# Jessw.g(archivo,$data) 
#-------------------------------------------------------
module Jessw
  
  def self.l(archivo="")
    if archivo == "" || !archivo.is_a?(String)
	  raise "Se debe ingresar la dirección y nombre del archivo a cargar incluyendo la extensión."
	  return nil
	end
	obj = nil
    if File.exist?(archivo)
	  File.open(archivo, "rb") { |jw| obj = Marshal.load(jw) }
	  return obj
	else
	  raise "No se pudo hallar el archivo : #{archivo}"
	  return nil 
	end
  end
  
  def self.g(archivo="",data=nil)
    if archivo == "" || !archivo.is_a?(String)
	  raise "Se debe ingresar la dirección y nombre del archivo a cargar incluyendo la extensión."
	  return false
	elsif data == nil
	  raise "La información ha guardar es incorrecta."
	  return false
	end
	if !File.exist?(archivo)
	  f = File.open(archivo,"w")
	  f.close
	end
	File.open(archivo, "wb") { |jw| Marshal.dump(data, jw) }
	return true
	#else
	#  raise "No se pudo hallar el archivo : #{archivo}"
	#  return false
	#end
  end
  
end