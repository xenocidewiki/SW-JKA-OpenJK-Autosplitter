state("openjk_sp.x86")
{
	bool isLoaded   : "rdsp-vanilla_x86.dll", 0xFFD30;
	bool finalSplit : 0xB966B4;
 	int  mapNumber  : 0xAA42F0;

 	/*
 		General docs:

 		Is Loaded: 	OpenJK: "rdsp-vaniall_x86.dll" + 0xFFD30 					---- JKA: 0x897C9C
 		Final Split: 	OpenJK: 0xB966B4 (most likely) || probs not 0xB9C1B4 || probs not 0xB9C48C	---- JKA: JKA: 835AB4 
 		Map Number: 	OpenJK: 0xAA42F0 (most likely) || 0xAA4270 					---- JKA: 0x480CD0

 		Original work done by: Zefie & Dread
 	*/
}

split
{
	return (old.mapNumber != current.mapNumber && current.mapNumber > 2 && old.mapNumber == 0 && current.mapNumber != 24) ||
	       (current.mapNumber == 78 && current.finalSplit);
}

start
{
	return (current.isLoaded && !old.isLoaded) && current.mapNumber == 24;
}

reset
{
    return current.mapNumber == 24 && old.mapNumber != 24;
}

isLoading
{
    return !current.isLoaded;
}

init
{
    timer.IsGameTimePaused = false;
}

exit
{
    timer.IsGameTimePaused = true;
}
