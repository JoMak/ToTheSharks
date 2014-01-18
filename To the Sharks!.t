var winID : int := Window.Open ("graphics:750;600;offscreenonly;position:center;center, buttonbar")

var picID : array 1 .. 6 of int
picID (1) := Pic.FileNew ("Graphx/Icons/scuba1.bmp")
picID (2) := Pic.FileNew ("Graphx/Icons/scuba2.bmp")
picID (3) := Pic.FileNew ("Graphx/Icons/stone.bmp")
picID (4) := Pic.FileNew ("Graphx/Icons/lives.bmp")
picID (5) := Pic.FileNew ("Graphx/Icons/question.bmp")
picID (6) := Pic.FileNew ("Graphx/Icons/howto.bmp")

var qpic : array 1 .. 11 of int
for i : 1 .. 11
    qpic (i) := Pic.FileNew ("Graphx/Icons/q" + intstr (i) + ".bmp")
end for

var spriteID : array 1 .. 3 of int
spriteID (1) := Sprite.New (picID (1))
spriteID (2) := Sprite.New (picID (2))
spriteID (3) := Sprite.New (picID (5))

Sprite.SetPosition (spriteID (1), 0, 150, false)
Sprite.SetPosition (spriteID (2), 0, 150, false)

var numblocks := 6

var spriteb : array 1 .. numblocks of int         % blocks sprite
for i : 1 .. numblocks
    spriteb (i) := Sprite.New (picID (3))
end for

var count : int := 1
var x : int := 0
var y : int := 150
var lives : int := 3
var lv : int := 1
var sec : int := 0
var blockpass : int := 0
var onscreen : int := 0
include "Procs/background.t"
include "Procs/blocks.t"
include "Procs/crash.t"
var chars : array char of boolean
var font1 : int := Font.New ("Corbel:50")

var numq : int := 11
var nowq : int := 0
var q : array 1 .. numq of boolean
for i : 1 .. numq
    q (i) := false
end for

var mx, my, button : int

proc question
    randint (nowq, 1, 11)
    if q (nowq) = true then
	question
    else
	q (nowq) := true
    end if
end question

proc game
    Music.PlayFileLoop ("Graphx/Kirby Air Ride - Water Theme.mp3")
    loop
	count := 1
	x := 0
	y := 150
	blocknum := 1
	yvalue := 300
	x1 := 0
	x2 := 800
	x3 := 1600
	x4 := 2400
	y1 := 0
	invinc := 0
	blockpass := 0
	onscreen := 0
	cls
	Pic.Draw (picID (6), 0, 0, picCopy)
	loop
	    Mouse.Where (mx, my, button)
	    if button = 1 then
		if mx > 612 and mx < 735 and my > 489 and my < 583 then
		    exit
		end if
	    end if
	end loop
	Sprite.Show (spriteID (1))
	Sprite.Show (spriteID (2))
	cls
	loop
	    if lv > 0 and lv < 4 then
		sec := 0
		delay (5)
	    elsif lv > 3 and lv < 7 then
		sec := 3
		delay (4)
	    elsif lv > 6 and lv < 9 then
		sec := 6
		delay (3)
	    else
		sec := 5
		delay (2)
	    end if
	    back
	    Font.Draw ("Level " + intstr (lv), 520, 15, font1, white)
	    for i : 1 .. lives
		Pic.Draw (picID (4), 740 - i * 61, 510, picMerge)
	    end for
	    Input.Flush
	    Input.KeyDown (chars)     % moving
	    if chars (KEY_LEFT_ARROW) then
		if x > 0 then
		    x -= 2
		end if
	    end if
	    if chars (KEY_RIGHT_ARROW) then
		if x < 630 then
		    x += 2
		end if
	    end if
	    if chars (KEY_UP_ARROW) then
		if y < 550 then
		    y += 4
		end if
	    end if
	    if y > -8 then
		y -= 2     % drop
	    end if
	    if (y >= 550 or x < 0 or y < -7) and invinc < 0 then
		lives -= 1
		put "lose"
		invinc := 3
	    end if
	    if count = 1 then     % animate scuba diver
		Sprite.Hide (spriteID (2))
		Sprite.Show (spriteID (1))
		Sprite.Animate (spriteID (1), picID (1), x, y, false)
		count += 1
	    elsif count = 2 then
		Sprite.Hide (spriteID (1))
		Sprite.Show (spriteID (2))
		Sprite.Animate (spriteID (2), picID (2), x, y, false)
		count := 1
	    end if
	    if where (blocknum) <= -150 then     % generate new blocks
		invinc -= 1
		if blocks (blocknum, 2) > -100 and blocks (blocknum, 2) < 500 then
		    blockpass += 1
		end if
		onscreen := 0
		for i : 1 .. numblocks
		    if blocks (i, 2) > -100 and blocks (i, 2) < 500 then
			onscreen += 1
		    end if
		end for
		if blocks (blocknum, 2) > -100 and blocks (blocknum, 2) < 500 then
		    onscreen -= 1
		end if
		if (blockpass + onscreen) < ((lv - sec) * 10) then
		    newBlocks
		    if blocknum not= numblocks then
			blocknum += 1
		    else
			blocknum := 1
		    end if
		else
		    blocks (blocknum, 2) := -200
		    if blocknum not= numblocks then
			blocknum += 1
		    else
			blocknum := 1
		    end if
		end if
	    end if
	    for i : 1 .. numblocks     % move blocks
		checkcrash (i)
		where (i) -= 3
		Sprite.Animate (spriteb (i), picID (3), where (i), blocks (i, 2), false)
		exit when lives <= 0
	    end for
	    exit when lives <= 0
	    exit when blockpass = (lv - sec) * 10
	end loop
	if blockpass >= (lv - sec) * 10 then     % after one level
	    question
	    Sprite.Animate (spriteID (3), qpic (nowq), 200, 150, false)
	    Sprite.Show (spriteID (3))
	    Font.Draw ("Level Complete!", 150, 450, font1, brightred)
	    loop
		Mouse.Where (mx, my, button)
		if button = 1 then
		    if mx > 452 and mx < 533 and my > 157 and my < 179 then
			exit
		    end if
		end if
	    end loop
	    lv += 1
	    lives += 1
	    Sprite.Hide (spriteID (3))
	end if
	if lv > 10 then
	    Font.Draw ("CONGRATULATIONS!", 120, 400, font1, green)
	    Font.Draw ("YOU WIN.", 150, 350, font1, green)
	    delay (3000)
	end if
	if lives <= 0 then
	    back
	    Font.Draw ("GAME OVER X.X", 150, 450, font1, black)
	    lv := 1
	    lives := 3
	    sec := 0
	    for i : 1 .. numq
		q (i) := false
	    end for
	    delay (3000)
	end if
	cls
	% reinit things for new game
	for i : 1 .. numblocks
	    Sprite.Free (spriteb (i))
	end for
	for i : 1 .. 2
	    Sprite.Free (spriteID (i))
	end for
	spriteID (1) := Sprite.New (picID (1))
	spriteID (2) := Sprite.New (picID (2))
	Sprite.SetPosition (spriteID (1), 0, 150, false)
	Sprite.SetPosition (spriteID (2), 0, 150, false)
	Sprite.Show (spriteID (1))
	Sprite.Show (spriteID (2))
	for i : 1 .. numblocks
	    spriteb (i) := Sprite.New (picID (3))
	end for
	for i : 1 .. numblocks         %initialize block position
	    blocks (i, 1) := rockplacex (i)
	    blocks (i, 2) := rockplacey (Rand.Int (1, 6))
	    where (i) := blocks (i, 1)
	    Sprite.SetPosition (spriteb (i), blocks (i, 1), blocks (i, 2), false)
	    Sprite.Show (spriteb (i))
	end for
    end loop
end game
game

