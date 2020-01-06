# encoding: utf-8
#=======================================================
# Viewport
#-------------------------------------------------------
# Modificaciones la clase Viewport
#-------------------------------------------------------
#=======================================================


class Viewport
  attr_accessor(:width)
  attr_accessor(:height)
  attr_accessor(:dispo)
  #-------------------------------------------------------
  # Regresa los valores de ancho y largo del viewport
  #-------------------------------------------------------
  def width
    return self.rect.width
  end

  def height
    return self.rect.height
  end

  def fade(frames=1,tone=nil)
    tone = Tone.new(255,255,255) if !tone
	r = tone.red/frames 
	g = tone.green/frames
	b = tone.blue/frames
    frames.times {|i| self.tone = Tone.new(r*i,g*i,b*i); Graphics.wait}
    yield if block_given?
	if !@dispo
	  frames.downto(0){|i| self.tone = Tone.new(r*i,g*i,b*i); Graphics.wait}
	end
  end
  
end
