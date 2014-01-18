var headx : int := 0
var torsox : int := 0
var feetx : int := 0
var feet2x : int := 0
var heady : int := 0
var torsoy : int := 0
var feety : int := 0
var feet2y : int := 0
var crash : boolean := false
var invinc : int := 0
proc checkcrash (i : int)
    if invinc <= 0 then
	crash := false
	headx := x + 100 %+15
	heady := y + 15 %+26

	torsox := x + 50 %+50
	torsoy := y + 10 %+31

	feetx := x + 0 %+12
	feety := y + 17 %+8

	feet2x := x + 12 %+38
	feet2y := y + 17 %+32

	if headx <= where (i) + 10 and headx + 15 >= where (i) + 5 and
		heady <= blocks (i, 2) + 160 and heady + 26 >= blocks (i, 2) + 5 then
	    lives -= 1
	    put "head"
	    crash := true

	elsif headx <= where (i) + 20 and headx + 15 >= where (i) + 10 and
		heady <= blocks (i, 2) + 170 and heady + 26 >= blocks (i, 2) + 5 then
	    lives -= 1
	    put "head"
	    crash := true

	elsif headx <= where (i) + 35 and headx + 15 >= where (i) + 20 and
		heady <= blocks (i, 2) + 190 and heady + 26 >= blocks (i, 2) + 5 then
	    lives -= 1
	    put "head"
	    crash := true

	elsif headx <= where (i) + 43 and headx + 15 >= where (i) + 35 and
		heady <= blocks (i, 2) + 160 and heady + 26 >= blocks (i, 2) + 15 then
	    lives -= 1
	    put "head"
	    crash := true


	elsif torsox <= where (i) + 10 and torsox + 50 >= where (i) + 5 and
		torsoy <= blocks (i, 2) + 160 and torsoy + 31 >= blocks (i, 2) + 5 then
	    lives -= 1
	    put "torso"
	    crash := true

	elsif torsox <= where (i) + 20 and torsox + 50 >= where (i) + 10 and
		torsoy <= blocks (i, 2) + 170 and torsoy + 31 >= blocks (i, 2) + 5 then
	    lives -= 1
	    put "torso"
	    crash := true

	elsif torsox <= where (i) + 35 and torsox + 50 >= where (i) + 20 and
		torsoy <= blocks (i, 2) + 190 and torsoy + 31 >= blocks (i, 2) + 5 then
	    lives -= 1
	    put "torso"
	    crash := true

	elsif torsox <= where (i) + 43 and torsox + 50 >= where (i) + 35 and
		torsoy <= blocks (i, 2) + 160 and torsoy + 31 >= blocks (i, 2) + 15 then
	    lives -= 1
	    put "torso"
	    crash := true


	elsif feetx <= where (i) + 10 and feetx + 12 >= where (i) + 5 and
		feety <= blocks (i, 2) + 160 and feety + 8 >= blocks (i, 2) + 5 then
	    lives -= 1
	    put "feet"
	    crash := true

	elsif feetx <= where (i) + 20 and feetx + 12 >= where (i) + 10 and
		feety <= blocks (i, 2) + 170 and feety + 8 >= blocks (i, 2) + 5 then
	    lives -= 1
	    put "feet"
	    crash := true

	elsif feetx <= where (i) + 35 and feetx + 12 >= where (i) + 20 and
		feety <= blocks (i, 2) + 190 and feety + 8 >= blocks (i, 2) + 5 then
	    lives -= 1
	    put "feet"
	    crash := true

	elsif feetx <= where (i) + 43 and feetx + 12 >= where (i) + 35 and
		feety <= blocks (i, 2) + 160 and feety + 8 >= blocks (i, 2) + 15 then
	    lives -= 1
	    put "feet"
	    crash := true

	    
	    
	elsif feet2x <= where (i) + 10 and feet2x + 38 >= where (i) + 5 and
		feet2y <= blocks (i, 2) + 160 and feet2y + 32 >= blocks (i, 2) + 5 then
	    lives -= 1
	    put "feet"
	    crash := true

	elsif feet2x <= where (i) + 20 and feet2x + 38 >= where (i) + 10 and
		feet2y <= blocks (i, 2) + 170 and feet2y + 32 >= blocks (i, 2) + 5 then
	    lives -= 1
	    put "feet"
	    crash := true

	elsif feet2x <= where (i) + 35 and feet2x + 38 >= where (i) + 20 and
		feet2y <= blocks (i, 2) + 190 and feet2y + 32 >= blocks (i, 2) + 5 then
	    lives -= 1
	    put "feet"
	    crash := true

	elsif feet2x <= where (i) + 43 and feet2x + 38 >= where (i) + 35 and
		feet2y <= blocks (i, 2) + 160 and feet2y + 32 >= blocks (i, 2) + 15 then
	    lives -= 1
	    put "feet"
	    crash := true
	end if
	if crash then
	    invinc := 3
	end if
    else
	if count = 1 then
	    Sprite.Hide (spriteID (1))
	    Sprite.Hide (spriteID (2))
	else
	    Sprite.Show (spriteID (1))
	    Sprite.Show (spriteID (2))
	end if
    end if
end checkcrash

