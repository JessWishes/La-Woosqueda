# encoding: utf-8
#=======================================================
# Mensajes
#-------------------------------------------------------
# Mostrar cuadros de texto en pantalla (textbox)
#-------------------------------------------------------
#=======================================================


#-------------------------------------------------------
# Llamar un cuadro de texto simple
# Mensaje.send("Hola mundo!")
#-------------------------------------------------------

module Mensaje

  def self.send(text="",name="")
    raise "Necesitas definir un mensaje" if !text.is_a?(String)
    t_m = Textbox.new(text,name)
	n = 0
	Graphics.wait(15)
	loop do
  	  n = 0 if n>20
	  t_m.pausa n<10
	  n+=1
	  if Input.trigger?(Input::C) || Input.trigger?(Input::X)
  	    Play.se("Selec")
	    t_m.dispose
	    break
	  end 
	  Graphics.wait
	end
	Graphics.wait(5)
  end

end

class Textbox
  attr_accessor(:cursor)

  def dispose
    @c_t.sprite.dispose
	@c_t = nil
	@c_t2.spr.dispose
	@c_t2 = nil
	if @name !=""
  	  @nombret.spr.dispose 
	  @nombret = nil
	  @nm_sp.sprite.dispose
	  @nm_sp = nil
	end
	@cursor.sprite.dispose
	@cursor = nil
  end
  
  def initialize(txt="",name="")
    @txt  = txt
	@name = name
	skin
	@c_t = Image.new(@bmp2,12,280,$Pantalla.v3)
	@c_t2 = Texto.new(@txt,0,0,@c_t.width-49,60)
	@c_t2.spr.x = @c_t.x+12
	@c_t2.spr.y = @c_t.y+11
	if @name !=""
      @nombret = Texto.new(@name,0,0,@c_t.width,20,Color.new(50,52,76))
	  cuadronombre
	  @nm_sp = Image.new(@nm_bm.clone,24,259,$Pantalla.v3)
	  @nombret.spr.x = @c_t.x+28
	  @nombret.spr.y = @c_t.y-15
      @nombret.spr.z+=1
	end
	@cursor = Image.new(Bmp.textos("cursor"),466,330,$Pantalla.v3)
	@cursor.sprite.src_rect.set(0,0,21,14)
	@cursor.sprite.visible = false
  end

  def pausa(val=false)
     @cursor.sprite.visible = true
     @cursor.sprite.src_rect.set(0,0,21,14) if val
	 @cursor.sprite.src_rect.set(21,0,21,14) if !val
  end

  def skin
    @bmp = Bmp.textos("Skin02")
	@bmp2 = Bitmap.new(Graphics.width-52,96)
	# inicio
	@bmp2.blt(0,0,@bmp,Rect.new(0,0,16,20))
	@bmp2.blt(0,20,@bmp,Rect.new(0,16,16,32))
	@bmp2.blt(0,52,@bmp,Rect.new(0,44,16,20))
	# medio
	0.upto(13){ |x| 
	@bmp2.blt(16+(x*32),0,@bmp,Rect.new(16,0,32,20))
	@bmp2.blt(16+(x*32),20,@bmp,Rect.new(16,16,32,32))
	#@bmp2.blt(16+(x*32),48,@bmp,Rect.new(16,16,32,32))
	@bmp2.blt(16+(x*32),52,@bmp,Rect.new(16,44,32,20)) }
	# final
	@bmp2.blt((14*32)+16,0,@bmp,Rect.new(48,0,16,20))
	@bmp2.blt((14*32)+16,20,@bmp,Rect.new(48,16,16,32))
	@bmp2.blt((14*32)+16,52,@bmp,Rect.new(48,44,16,20))
  end 
  
  def cuadronombre
    @nm_bm = Bitmap.new(Graphics.width,32)
    @nm_bm.blt(0,0,@bmp,Rect.new(0,71,16,25))
	n = 0
    (0).upto(@nombret.txt_size+21){|x| @nm_bm.blt(15+(x+1),0,@bmp,Rect.new(16,71,2,25)); n = x }
    @nm_bm.blt(18+n,0,@bmp,Rect.new(32,71,16,25))
	
  end 

  def formato
  
  end

end