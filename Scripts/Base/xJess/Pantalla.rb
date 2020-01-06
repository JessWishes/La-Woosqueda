# encoding: utf-8
#=======================================================
# Pantalla
#-------------------------------------------------------
# Regresa los viewports usados en pantalla (prototipo)
#-------------------------------------------------------
#=======================================================


#-------------------------------------------------------
# Definir el marco alrededor de la pantalla
# $Pantalla.viewport => Gráficos del marco
# $Pantalla.v1       => Gráficos sobre el mapa
# $Pantalla.v2       => Gráficos de batalla/Escenas
# $Pantalla.v3       => Gráficos para interfaces
# $Pantalla.marco    => Sprite del marco en pantlla 
#
# $Pantalla.v1_clean => Borra el contenido del viewport
# $Pantalla.v2_clean => Borra el contenido del viewport
# $Pantalla.v3_clean => Borra el contenido del viewport
#
# Los métodos clean solo aplican para las instancias :
#  Image.new y Texto.new 
#-------------------------------------------------------
class Pantalla
  attr_accessor(:v1)
  attr_accessor(:v2)
  attr_accessor(:v3)
  attr_accessor(:v1_sprites)
  attr_accessor(:v2_sprites)
  attr_accessor(:v3_sprites)
  attr_accessor(:viewport)
  attr_accessor(:marco)
  

  def initialize
    @v1 = Viewport.new(20,20,Graphics.width-40,Graphics.height-40)
	@v1.z = 1
	@v1_sprites = []
	@v2 = Viewport.new(20,20,Graphics.width-40,Graphics.height-40)
	@v2.z = 100
	@v2_sprites = []
	@v3 = Viewport.new(20,20,Graphics.width-40,Graphics.height-40)
	@v3.z = 500
	@v3_sprites = []
	@viewport = Viewport.new(0,0,Graphics.width,Graphics.height)
	@viewport.z = 999999
    @marco = Sprite.new(@viewport)
	@marco.bitmap = Bmp.interfaces("Marco")
	@disposed = false
  end
  
  def sprite_dispose(val="")
    case val
	when "v1"; @v1_sprites.each {|i| i.dispose if i && i.disposed? }; @v1_sprites=[]
	when "v2"; @v2_sprites.each {|i| i.dispose if i && i.disposed? }; @v2_sprites=[]
	when "v3"; @v3_sprites.each {|i| i.dispose if i && i.disposed? }; @v3_sprites=[]
	end
  end
  
  def v3_clean
	sprite_dispose("v3")
	@v3.dispo = true
    @v3.dispose
	@v3 = Viewport.new(20,20,Graphics.width-40,Graphics.height-40)
	@v3.z = 500
  end
  
  def v2_clean
    @v2.dispose
	sprite_dispose("v2")
    @v2 = Viewport.new(20,20,Graphics.width-40,Graphics.height-40)
	@v2.z = 100
  end
  
  def v1_clean
    @v1.dispose
	sprite_dispose("v1")
    @v1 = Viewport.new(20,20,Graphics.width-40,Graphics.height-40)
	@v1.z = 1
  end
  
end