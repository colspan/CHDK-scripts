--[[
@title Interval Shooting with AF/AE Lock
@param a Shooting interval, min
@default a 0
@param b Interval (Seconds)
@default b 1
@param c Interval (10th Seconds)
@default c 0
 --]]

n=1
t=a*60000+b*1000+c*100

print "Interval shooting."
press "shoot_half"
repeat
    sleep(50)
until get_shooting() == true
set_aflock(1)

function TakePicture()
  ecnt=get_exp_count()
	press "shoot_full_only"
	repeat sleep(100) until (get_exp_count()~=ecnt)
	release "shoot_full_only"
end

repeat
	print ("Num "..n)
	StartTick = get_tick_count()
	TakePicture()
	sleep(t - (get_tick_count() - StartTick))
	n=n+1
until false
