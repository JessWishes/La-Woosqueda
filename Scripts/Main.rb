# encoding: utf-8
#=======================================================
# Main
#-------------------------------------------------------
# Encargado de cargar la info de inicio.
#-------------------------------------------------------
#=======================================================

# Nota : tiles 40x20(x2=40) / 1tile/2Tile / OW = 40x64 / mapsize 13x15
# Nota : msgbox("msj")

#-------------------------------------------------------
# Aplicar data inicial
#-------------------------------------------------------


# Modo debug true/false
$Debug = false

# Compilar Información de Fuente
Fuentes.compilar

# Viewports de Pantalla (prototipo)
$Pantalla = Pantalla.new

# FPS inicial
Graphics.frame_rate = 60


#-------------------------------------------------------
# Carga cada elemento a mostrar al inicio del juego
#-------------------------------------------------------
module Inicio

  #-------------------------------------------------------
  # Muestra el logo y créditos iniciales
  #-------------------------------------------------------
  def self.logo

	Play.bgm("Logo")
    creditos = ["RPG Maker VXAce - Enterbrain","Coder - JessWishes","Graphics - BetaM","Music - StevenMix","Liberty Jam - 2020"]
	Graphics.wait(10)
    l = Image.new(Bmp.interfaces("Logo/Logo01"),50,170,$Pantalla.v3)
	l.opacity = 0
	25.times do
	  l.opacity+=10
	  Graphics.wait
	end
	Graphics.wait(30)
	26.times do
	  l.opacity-=10
	  Graphics.wait
	end
	Graphics.wait(12)
	t = {}
	0.upto(creditos.size-1){ |i|
	t[i] = Texto.new(creditos[i],0,0,300,20,i.to_i.even? ? Color.new(185,32,93) : Color.new(255,214,91))
	t[i].spr.x = -200; t[i].spr.y = 60+(i*50)  }
	for i in 0...creditos.size
	  loop do 
	    t[i].spr.x+=20
	  	Graphics.wait
 	    break if t[i].spr.x > ( (t[i].spr.viewport.width/2)-(t[i].txt_size/2) )
	  end
	end
    Graphics.wait(30)
	25.times do
	  0.upto(creditos.size-1){ |i| t[i].spr.opacity-=10 }
	  Graphics.wait
	end
	Play.bgm("")
	# Para que todos los elementos dentro del viewport sean eliminados
	$Pantalla.v3_clean
  end

  #-------------------------------------------------------
  # Muestra la escena de intro del juego (W.I.P.)
  #-------------------------------------------------------
  def self.intro


  end
  
  #-------------------------------------------------------
  # Muestra la animación del titulo
  #-------------------------------------------------------
  def self.titulo
    Play.bgm("Titulo")
    f = Image.new(Bmp.interfaces("Titulo/Fondo"),0,0,$Pantalla.v3)
	f.visible= false 
	n = Image.new(Bmp.interfaces("Titulo/Logo01"),0,-10,$Pantalla.v3)
	m = Image.new(Bmp.interfaces("Titulo/Logo02"),90,190,$Pantalla.v3)
	p = Image.new(Bmp.interfaces("Titulo/Press"),180,340,$Pantalla.v3)
	m.visible= false
	p.visible= false
	n.opacity = 0
	50.times {|i| n.opacity+=5; n.y+=1; n.tone_set(3*i,3*i,3*i); Graphics.wait}
	$Pantalla.v3.fade(15) { n.tone_set(0,0,0); f.visible = true; m.visible= true; p.visible= true; Graphics.wait(5)}
	loop do
	  if Input.press?(Input::C)
	    $Pantalla.v3.fade(15,Tone.new(-255,-255,-255)) { $Pantalla.v3_clean; Play.bgm("")}
	    break
	  end
  	  m.blob(20,4)
	  p.blink(16)
      Graphics.wait
	end
  end

  #-------------------------------------------------------
  # Muestra la pantalla de Nueva/Cargar Partida
  #-------------------------------------------------------
  def self.cargar

	
    loop do
	  Graphics.wait
	end
  end

end

Inicio.logo   if !$Debug
Inicio.intro  if !$Debug
Inicio.titulo if !$Debug
Inicio.cargar






#=======================================================
#
#=======================================================