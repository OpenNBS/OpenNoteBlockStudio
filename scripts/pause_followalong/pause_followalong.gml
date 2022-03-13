function pause_followalong(){
	if(!variable_global_exists("followalongPaused")) global.followalongPaused = 0
	global.followalongPaused = !global.followalongPaused
	
	if(global.followalongPaused=1){
		toggle_followalong(0,0)
	}else{
		
	}
}