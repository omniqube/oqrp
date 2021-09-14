//Create a new block if needed.
if(instance_number(obj_clickonit)<15)
{
    if(irandom_range(0,5)==1)
    {
        instance_create(irandom(room_width),irandom(room_height),obj_clickonit)
    }
}
//Send trophy info if needed (e.g. certain amount of blocks clicked).
if(senttrophy[0]==0)and(score>50)
{
    senttrophy[0]=1
    gj_trophy_add("1410")
}
if(senttrophy[1]==0)and(score>1000)
{
    senttrophy[1]=1
    gj_trophy_add("1411")
    userisawesome=true //User clicked 1000 times, he/she is awesome!
}

