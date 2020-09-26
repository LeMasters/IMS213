-- Be sure to see accompanying explanations at gamestate.org
-- gwl 2020


function _init()
 astro={1,2,3,4}
 deathstar={40,1}
 shadow=17
 moony=113
 screenwide=128
 anim_speed=21
 move_speed=14
 cel_idx = 1
 framecount = 1
 astro_x = 0
end


function _update()
 framecount = framecount + 1
 astro_y = moony
 local t1 = timer(anim_speed)
 
 if (t1 == true) then
  cel_idx = cel_idx + 1
  if (cel_idx > #astro) then
   cel_idx = 1
  end
 end

 local t2 = timer(move_speed)
 
 if (t2 == true) then
  astro_x = astro_x + 1
  if (astro_x > screenwide) then
   astro_x = - 8
  end
 end
 
end


function _draw()
 cls(0)
 show_moonsurface()
 show_deathstar()
 show_astro()
end


function timer(fs)
 local alarm = false
 local t = framecount % fs
 if (t == 0) then
  alarm = true
 end
 return alarm
end


function show_moonsurface()
 map(0,4,0,0,16,16)
end


function show_deathstar()
 local col=deathstar[1]
 local row=deathstar[2]
 local x=90
 local y=9
 map(col, row, x, y, 2, 2)
end


function show_astro()
 local shadowy=astro_y+7
 spr(shadow, astro_x, shadowy)
 local cel = astro[cel_idx]
 spr(cel, astro_x, astro_y)
end
