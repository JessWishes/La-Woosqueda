# encoding: utf-8
#=======================================================
# Play
#-------------------------------------------------------
# Acceso rápido al modulo Audio
# W.I.P. - Utilidades para reproducción de vídeo
#-------------------------------------------------------
#=======================================================

module Play
  
  DIR_BGM = "Audio/BGM/"
  DIR_BGs = "Audio/BGS/"
  DIR_ME  = "Audio/ME/"
  DIR_SE  = "Audio/SE/"
  #-------------------------------------------------------
  # Reproducir audio
  # Play.bgm("Musica") => Reproduce el audio BGM
  # Play.bgm("")       => Detiene el audio BGM
  # 
  # Play.bgs("Musica") => Reproduce el audio BGS
  # Play.bgs("")       => Detiene el audio BGS
   # 
  # Play.me("Musica") => Reproduce el audio ME
  # Play.me("")       => Detiene el audio ME
   # 
  # Play.se("Musica") => Reproduce el audio SE
  # Play.se("")       => Detiene el audio SE
  #-------------------------------------------------------

  def self.bgm(archivo="",volumen=100,pitch=100)
    if archivo == ""
      Audio.bgm_fade(5)
	  Graphics.wait(5)
	  Audio.bgm_stop
	else
      Audio.bgm_play(DIR_BGM+archivo,volumen,pitch)
	end
  end
  
  def self.bgs(archivo="",volumen=100,pitch=100)
    if archivo == ""
      Audio.bgs_fade(5)
	  Graphics.wait(5)
	  Audio.bgs_stop
	else
      Audio.bgs_play(DIR_BGS+archivo,volumen,pitch)
	end
  end
  
  def self.me(archivo="",volumen=100,pitch=100)
    if archivo == ""
      Audio.me_fade(5)
	  Graphics.wait(5)
	  Audio.me_stop
	else
      Audio.me_play(DIR_ME+archivo,volumen,pitch)
	end
  end
  
  def self.se(archivo="",volumen=100,pitch=100)
    if archivo == ""
	  Audio.se_stop
	else
      Audio.se_play(DIR_SE+archivo,volumen,pitch)
	end
  end
  
end