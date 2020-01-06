# encoding: utf-8
#=======================================================
# Bmp
#-------------------------------------------------------
# Cache para gráficos en las diferentes carpetas
#-------------------------------------------------------
#=======================================================


#-------------------------------------------------------
# Carga el bitmap de la dirección dada
# Siempre buscará la extensión .png a menos que se le
# diga lo contrario
#
# Modo original :
#   b = Bitmap.new("Graphics/Textos/Imagen01")
# Con Bmp :
#   b = Bmp.textos("Imagen01")
#   b = Bmp.textos("Imagen01",".jpg")
#-------------------------------------------------------

module Bmp

  def self.textos(dir="",ext=".png")
    if File.exist?("Graphics/Textos/"+dir+ext)
	    return Bitmap.new("Graphics/Textos/"+dir)
	else
	  raise "No se pudo hallar el archivo Graphics/Textos/#{dir+ext}"
	  return Bitmap.new(1,1)
	end
  end

  def self.interfaces(dir="",ext=".png")
    if File.exist?("Graphics/Interfaces/"+dir+ext)
	    return Bitmap.new("Graphics/Interfaces/"+dir)
	else
	  raise "No se pudo hallar el archivo Graphics/Interfaces/#{dir+ext}"
	  return Bitmap.new(1,1)
	end
  end

end