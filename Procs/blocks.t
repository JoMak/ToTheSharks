var blocks : array 1 .. numblocks, 1 .. 2 of int
var blocknum : int := 1
var where : array 1 .. numblocks of int
var rockplacex : array 1 .. numblocks of int
var rockplacey : array 1 .. 6 of int
var yvalue : int := 300
rockplacex (1) := 801
rockplacex (2) := 951
rockplacex (3) := 1101
rockplacex (4) := 1251
rockplacex (5) := 1401
rockplacex (6) := 1551

rockplacey (1) := -50
rockplacey (2) := -5000
rockplacey (3) := yvalue
rockplacey (4) := 120
rockplacey (5) := 700
rockplacey (6) := 450

var one : boolean := false
var six : boolean := false
proc newBlocks
    if count = 1 then
	yvalue := 300
    else
	yvalue := -1000
    end if
    one := false
    six := false
    % make new blocks
    if blocknum = 1 then
	blocks (blocknum, 1) := where (numblocks) + 150
    else
	blocks (blocknum, 1) := where (blocknum - 1) + 150
    end if
    for i : 1 .. numblocks
	if blocks (i, 2) = 450 then
	    six := true
	elsif blocks (i, 2) = -50 then
	    one := true
	end if
    end for
    if one then
	blocks (blocknum, 2) := rockplacey (Rand.Int (1, 5))
    elsif six then
	blocks (blocknum, 2) := rockplacey (Rand.Int (2, 6))
    else
	blocks (blocknum, 2) := rockplacey (Rand.Int (1, 6))
    end if
    where (blocknum) := blocks (blocknum, 1)
end newBlocks

for i : 1 .. numblocks         %initialize block position
    blocks (i, 1) := rockplacex (i)
    blocks (i, 2) := rockplacey (Rand.Int (1, 6))
    where (i) := blocks (i, 1)
    Sprite.SetPosition (spriteb (i), blocks (i, 1), blocks (i, 2), false)
    Sprite.Show (spriteb (i))
end for

