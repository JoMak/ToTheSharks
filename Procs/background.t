var bpicID := Pic.FileNew ("Graphx/Icons/underwater.bmp")
var bpicID2 := Pic.FileNew ("Graphx/Icons/underwater2.bmp")

/* var bspriteID1 := Sprite.New (bpicID)
 var bspriteID2 := Sprite.New (bpicID2)
 var bspriteID3 := Sprite.New (bpicID)
 var bspriteID4 := Sprite.New (bpicID2)

 Sprite.SetPosition (bspriteID1, 0, 0, false)
 Sprite.SetPosition (bspriteID2, 0, 0, false)
 Sprite.SetPosition (bspriteID3, 0, 0, false)
 Sprite.SetPosition (bspriteID4, 0, 0, false)
 Sprite.Show (bspriteID1)
 Sprite.Show (bspriteID2)
 Sprite.Show (bspriteID3)
 Sprite.Show (bspriteID4)*/

var x1, x2, x3, x4, y1 : int
x1 := 0
x2 := 800
x3 := 1600
x4 := 2400
y1 := 0

/*proc back
 x1 -= 3
 x2 -= 3
 x3 -= 3
 x4 -= 3
 if x1 <= -800 then
 x1 := x2 + 800
 end if
 if x2 <= -800 then
 x2 := x3 + 800
 end if
 if x3 <= -800 then
 x3 := x4 + 800
 end if
 if x4 <= -800 then
 x4 := x1 + 800
 end if
 Sprite.Animate (bspriteID1, bpicID, x1, y1, false)
 Sprite.Animate (bspriteID2, bpicID2, x2, y1, false)
 Sprite.Animate (bspriteID3, bpicID, x3, y1, false)
 Sprite.Animate (bspriteID4, bpicID2, x4, y1, false)
 end back*/

proc back
    x1 -= 2
    x2 -= 2
    if x1 <= -800 then
	x1 := x2 + 800
    end if
    if x2 <= -800 then
	x2 := x1 + 800
    end if
    cls
    Pic.Draw (bpicID, x1, y1, picCopy)
    Pic.Draw (bpicID2, x2, y1, picCopy)
end back

