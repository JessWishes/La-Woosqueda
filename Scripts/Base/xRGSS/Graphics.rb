# encoding: utf-8
#=======================================================
# Graphics
#-------------------------------------------------------
# Modificaciones al modulo Graphics
#-------------------------------------------------------
#=======================================================

module Graphics

  def self.wait(frames=1)
    (frames).times do
	  Graphics.update
	  Input.update
	end
  end

  def self.width; return 544; end
  def self.height; return 416; end
  
  def self.widthx; return 504; end
  def self.heightx; return 376; end  

end
