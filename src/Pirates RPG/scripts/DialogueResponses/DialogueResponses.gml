/// @arg Response
function DialogueResponses(argument0) {

	switch(argument0)
	{
		case 0: break;
		case 1: NewTextBox("I am happy to hear that! Let me help you..", 0); break;
		case 2: NewTextBox("No?! So why on the world are you bothering me? Are you stupid",0,["3:Yes!","0:No"]);break;
		case 3: NewTextBox("I didn't doubt it",1); break;
		default: break;
	}


}
