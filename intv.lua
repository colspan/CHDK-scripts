--[[
@title Interval Shooting
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
	press "shoot_half"
	repeat sleep(50) until get_shooting() == true
	press "shoot_full"
	repeat sleep(100) until (get_exp_count()~=ecnt)
	release "shoot_full"
	release "shoot_half"
end

repeat
	StartTick = get_tick_count()
	TakePicture()
	sleep(t - (get_tick_count() - StartTick))
	print ("Num "..n)
	n=n+1
until false
