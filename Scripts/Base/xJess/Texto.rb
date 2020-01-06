# encoding: utf-8
#=======================================================
# Texto
#-------------------------------------------------------
# Arma y regresa el texto dado en forma de bitmap
# To Do : Textos se alinean según el tamaño de cada
#         palabra.
#-------------------------------------------------------
#=======================================================


#-------------------------------------------------------
# Ensamblar el bitmap que contrendrá el texto
#
# Si se le vincula un bitmap ya existente regresa nil
#   Texto.new("Hola",0,0,200,50,nil,bmp)
#
# Si no se le vincula un bitmap, se tiene que guardar en
# una variable para poder manipular como un sprite 
#   txt = Texto.new("Hola",0,0,200,50,Color.new(250,50,122))
#
# Si no se brinda un bitmap, se creará uno que forme parte de
# de un nuevo sprite el cual se vinculará con $Pantalla.v3 
# 
#-------------------------------------------------------
class Texto
  attr_accessor(:spr)
  attr_accessor(:txt_size)
  
  BASECOLOR = Color.new(233,232,242)

  def initialize(str="",x=0,y=0,w=1,h=1,color=nil,bmp=nil)
    @spr   = bmp ? nil : Sprite.new($Pantalla.v3)
	@bmp   = bmp ? bmp : Bitmap.new(w,h)
	@txt   = str
	@x     = x
	@y     = y
	@w     = w
	@h     = h
	@color = color
	@txt_size = 0
    armado
	$Pantalla.v1_sprites.push(self) if @viewport == $Pantalla.v1
	$Pantalla.v2_sprites.push(self) if @viewport == $Pantalla.v2
	$Pantalla.v3_sprites.push(self) if @viewport == $Pantalla.v3
	if spr
	  @spr.z = @spr.viewport.z+($Pantalla.v3_sprites.size+1)
	  @spr.x = @x
	  @spr.y = @y
	end
  end
  
  def dispose
    @spr.dispose
	@bmp.dispose
  end 
  
  def armado
    txt = @txt.split(//)
	t_bmp = Bitmap.new(@w,@h)
	l_s = 0; ox = 0; oy = 0
	for i in 0...txt.size
	  if Fuentes::CHR[txt[i]]
	    nb = color(Fuentes::CHR[txt[i]].bitmap.clone,Fuentes::CHR[txt[i]].w,Fuentes::CHR[txt[i]].h)
  	    t_bmp.blt(ox,oy,nb,Rect.new(0,0,Fuentes::CHR[txt[i]].w,Fuentes::CHR[txt[i]].h))
	    ox+=(Fuentes::CHR[txt[i]].w)+1
		@txt_size+=Fuentes::CHR[txt[i]].w
	  else
  	    ox+=Fuentes::MAXSIZE_N
		@txt_size+=Fuentes::MAXSIZE_N
	  end
	  l_s=ox
	  if l_s > (@w-5)
	    l_s = 0 
		ox = 0
		oy+= Fuentes::MAXSIZE_A
	  end
	end
	# armado final
	@bmp.blt(0,0,t_bmp,Rect.new(0,0,@w,@h))
    @spr.bitmap = @bmp if @spr  
  end
  
  # Modificar el color del texto
  # Solo debe usarse al armar el bitmap
  def color(bmp,w,h)
    return bmp if !@color || !@color.is_a?(Color)
	for i in 0...w
	  for j in 0...h
	    c = bmp.get_pixel(i,j)
		bmp.set_pixel(i,j,@color) if c == BASECOLOR
	  end
	end
	return bmp
  end
  
end

