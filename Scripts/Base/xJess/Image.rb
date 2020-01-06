# encoding: utf-8
#=======================================================
# Image
#-------------------------------------------------------
# Manera rápida de crear un sprite con su bitmap
#-------------------------------------------------------
#=======================================================


#-------------------------------------------------------
# 
#-------------------------------------------------------
class Image 
  attr_accessor(:viewport)
  attr_accessor(:sprite)
  attr_accessor(:bitmap) 
  attr_accessor(:x) 
  attr_accessor(:y) 
  attr_accessor(:z) 
  attr_accessor(:opacity)
  attr_accessor(:width)
  attr_accessor(:height)
  attr_accessor(:tone)
  attr_accessor(:color)
  attr_accessor(:blob_oxy)
  attr_accessor(:blob_val)
  attr_accessor(:blink_val)
  attr_accessor(:or_bmp)
  attr_accessor(:flip_val)

  def initialize(bmp=nil,x=0,y=0,v=nil)
    @viewport = !v ? $Pantalla.v3 : v
    @sprite = Sprite.new(@viewport)
	$Pantalla.v1_sprites.push(@sprite) if @viewport == $Pantalla.v1
	$Pantalla.v2_sprites.push(@sprite) if @viewport == $Pantalla.v2
	$Pantalla.v3_sprites.push(@sprite) if @viewport == $Pantalla.v3
    @bitmap = bmp
	@sprite.bitmap = @bitmap
	@sprite.x = x
	@sprite.y = y
	@sprite.z = @viewport.z+($Pantalla.v3_sprites.size+1)
	@x = @sprite.x
	@y = @sprite.y
	@z = @sprite.z
	@opacity = @sprite.opacity
	#@visible = true
	@width = @sprite.bitmap.width
	@height = @sprite.bitmap.height
	@tone = @sprite.tone 
	@or_bmp = @bitmap.clone
	#@flip_val = false
  end
  
  def dispose
    @sprite.dispose
	@bitmap.dispose
	@or_bmp.dispose
  end
  
  def x
    @sprite.x = @x
    return @sprite.x
  end
  
  def y
    @sprite.y = @y
    return @sprite.y
  end
  
  def z
    @sprite.z = @z
	return @sprite.z
  end
  
  def opacity=(val)
    @sprite.opacity = val
	@opacity = val
  end
  
  def visible=(val)
    @sprite.visible = val 
    return @sprite.visible 
  end
  
  def width
    return @sprite.bitmap.width
  end 
  
  def height
    return @sprite.bitmap.height
  end 
  
  def tone_set(r=0,g=0,b=0,a=0)
    @sprite.tone = Tone.new(r,g,b,a)
	@tone = @sprite.tone
	return @sprite.tone
  end
  
  def color_set(rv,g=0,b=0,a=0)
    @sprite.color = Color.new(r,g,b,a)
	@color = @sprite.color 
	return @sprite.color 
  end
  
  def blob(frames=10,px=10)
    @blob_oxy = [@sprite.x,@sprite.y] if !@blob_oxy
	@blob_val = 0 if !@blob_val || @blob_val > frames*2
	@sprite.y+=px if @blob_val == 0
	@sprite.y-=px if @blob_val == frames
	@blob_val+=1
  end
  
  def blob_off
    return if !@blob_oxy
    @sprite.x = @blob_oxy[0]
    @sprite.y = @blob_oxy[1]
	@blob_oxy = nil
	@blob_val = nil
  end 
  
  def blink(frame=1)
    @blink_val = 0 if !@blink_val || @blink_val > frame*2
    @sprite.opacity-= 255/frame if @blink_val <frame
    @sprite.opacity+= 255/frame if @blink_val >frame
	@blink_val+=1
  end
  
  def rotar(val=0)
    @sprite.angle = val if val != 0
    return @sprite.angle
  end 
  
  def flip(val=0)
    @or_bmp = @sprite.bitmap.clone if !@flip_val
    @flip_val = true if !@flip_val
	# PXY normal
	@bitmap = @or_bmp.clone if val == 0
	@flip_val = false       if val == 0
	
	t_bmp = Bitmap.new(width,height)
	
	# PXY Mirror
	if val == 1 || val == 3
	  for i in 0...width
	    for j in 0...height
		  px = @or_bmp.get_pixel(i,j)
		  t_bmp.set_pixel(width-i,j,px)
		end
	  end
	end
	
	# PXY Abajo
	if val == 2 || val == 3
	  m_bmp = val==3 ? t_bmp.clone : @or_bmp.clone
	  t_bmp.clear
	  for i in 0...width
	    for j in 0...height
		  px = m_bmp.get_pixel(i,j)
		  t_bmp.set_pixel(i,height-j,px)
		end
	  end
	end
	
	if val > 0
      @bitmap.clear
	  @bitmap = t_bmp.clone
	  t_bmp.dispose if t_bmp
	  m_bmp.dispose if m_bmp
    end
	@sprite.bitmap = @bitmap
	
  end
  
  
end

