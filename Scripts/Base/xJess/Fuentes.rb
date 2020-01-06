# encoding: utf-8
#=======================================================
# Fuente
#-------------------------------------------------------
# Encargado de guardar y procesar la fuente con Bitmaps
#-------------------------------------------------------
#=======================================================
# Bitmap por Chubby Choo

#-------------------------------------------------------
# Definir información de cada caracter
#-------------------------------------------------------

class Fnt
  attr_accessor(:ox)
  attr_accessor(:oy)
  attr_accessor(:w)
  attr_accessor(:h)
  attr_accessor(:bitmap)
  
  #-------------------------------------------------------
  # Guarda la información de cada caracter
  # Fnt.new("A",0,2,31,30)
  #-------------------------------------------------------
  def initialize(ox=0,oy=0,w=1,h=1)
	@ox  = ox
	@oy  = oy
	@w   = w
	@h   = h
	bmp_t = Bitmap.new("Graphics/Textos/Fuentes01")
	@bitmap = Bitmap.new(w,h)
	@bitmap.blt(0,0,bmp_t,Rect.new(ox,oy,w,h))
  end

end

#-------------------------------------------------------
#  Guardar información de cada caracter según el Bitmap
#-------------------------------------------------------

module Fuentes
  CHR = {}
  FUENTE_CARACTERES_1 = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","Ñ","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
  FUENTE_CARACTERES_2 = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","ñ","o","p","q","r","s","t","u","v","w","x","y","z"]
  FUENTE_CARACTERES_3 = ["0","1","2","3","4","5","6","7","8","9"]
  FUENTE_CARACTERES_4 = ["Á","É","Í","ó","Ú","á","é","í","ó","ú","Ä","Ë","Ï","Ö","Ü","ä","ë","ï","ö","ü"]
  FUENTE_CARACTERES_5 = ["¿","?","¡","!","+","-","*","/","=","_","(",")","<",">","~",".",",",";",":","^","`","´","#","$","%","&","{","}","[","]"]

  MAXSIZE_H = 15
  MAXSIZE_A = 20
  MAXSIZE_N = 10

  def self.compilar
    # Mayúsculas
    for a in 0...FUENTE_CARACTERES_1.size
      ox = 14*a; oy = 0
	  w = 10; h = MAXSIZE_H
	  w = 3 if FUENTE_CARACTERES_1[a] == "I"
      CHR[FUENTE_CARACTERES_1[a]] = Fnt.new(ox,oy,w,h)
    end
  
    # Minúsculas
    for a in 0...FUENTE_CARACTERES_2.size
      ox = 14*a; oy = 15
	  w = 8; h = MAXSIZE_H
	  w = 6 if FUENTE_CARACTERES_2[a] == "f"
  	  w = 3 if FUENTE_CARACTERES_2[a] == "i"
	  w = 5 if FUENTE_CARACTERES_2[a] == "j" || FUENTE_CARACTERES_2[a] == "l" || FUENTE_CARACTERES_2[a] == "t"
	  w = 10 if FUENTE_CARACTERES_2[a] == "m" || FUENTE_CARACTERES_2[a] == "w"
      CHR[FUENTE_CARACTERES_2[a]] = Fnt.new(ox,oy,w,h)
    end 

    # Números
    for a in 0...FUENTE_CARACTERES_3.size
      ox = 14*a; oy = 30
	  w = 10; h = MAXSIZE_H
	  w = 5 if FUENTE_CARACTERES_3[a] == "1"
      CHR[FUENTE_CARACTERES_3[a].to_s] = Fnt.new(ox,oy,w,h)
    end
  
    # Acentos - Dieresis
    for a in 0...FUENTE_CARACTERES_4.size
      ox = 14*a; oy = 45
	  w = 10; h = MAXSIZE_H
	  w = 4 if FUENTE_CARACTERES_4[a] == "Í" || FUENTE_CARACTERES_4[a] == "í"
	  w = 5 if FUENTE_CARACTERES_4[a] == "Ï" || FUENTE_CARACTERES_4[a] == "ï"
      CHR[FUENTE_CARACTERES_4[a]] = Fnt.new(ox,oy,w,h)
    end

    # Simbolos
    for a in 0...FUENTE_CARACTERES_5.size
      ox = 14*a; oy = 60
	  w = 10; h = MAXSIZE_H
	  w = 2 if FUENTE_CARACTERES_5[a] == "!" || FUENTE_CARACTERES_5[a] == "¡" || FUENTE_CARACTERES_5[a] == ";" || FUENTE_CARACTERES_5[a] == ":" || FUENTE_CARACTERES_5[a] == "´" || FUENTE_CARACTERES_5[a] == "`"
	  w = 4 if FUENTE_CARACTERES_5[a] == "." || FUENTE_CARACTERES_5[a] == ","
      CHR[FUENTE_CARACTERES_5[a]] = Fnt.new(ox,oy,w,h)
     end
  end

 end