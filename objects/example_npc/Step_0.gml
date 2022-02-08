///@description Example using textbox
if keyboard_check_pressed(vk_space) { //You can also use keyboard_check_released, it might be better in some ways
	if place_meeting(x,y,example_player) {
		//Check if it's created
		//You could use also !instance_exists(textbox)
		if !textbox_exists() {
			//Call the script that creates the textbox
			//Add in the arguments messages that you want the textbox to show consecutively
			//You can add up to 10 messages to it currently
			textbox_create("This is the best dialogue engine!",
			"As you can see, it works perfectly.",
			"You can change the speed of the text from fast...",
			"...to slow....",
			"You can customize it with different colours, fonts, outlines, alpha and more!",
			"And now you can add options!",
			"Yes it is!");
			
			//Set things of the textbox
			//This is just to make the color
			var colour = make_colour_rgb(188,176,103);
			//Remember to call this. If you don't call this, it will set all settings to default
			textbox_set("Gero",c_black,c_white,colour,1,example_font,example_face,true,example_continue1);
			
			///Add options
			//This script adds options to the dialogue
			textbox_add_options(c_black,5,"Cool!","Not good.","Do you have pets?");
			//If you want the options to affect the dialogue, use this script
			//Just indicate the message that changes and add the different messages
			textbox_change_message_according_option(6,
			"Yes it is!",
			"It is cool! You... you just don't understand...",
			"Yes I have a cat. Wait... How is that related to this?");
			
			///Manage speed of text
			//This is only necessary if you want to change the speed of the text.
			//As we have 7 messages, we set 7 values
			textbox_set_speed(0.5,0.5,1,0.2,0.5,0.5,0.5);
			
			///Change the keyboard keys used for speaking
			//By default space is used for both speak & skip, so this is not really necessary in this case.
			//If you want to use this script, you will have to use it every time you create a textbox.
			textbox_set_key(vk_space);

		}
	}
}


//This does that the object is under others if they are in front of it.
//But if there is a textbox the object would be in front of it, so we disable this when textbox exists.
if !instance_exists(textbox) {
	depth = -y;
}else{
	depth = 0;
}