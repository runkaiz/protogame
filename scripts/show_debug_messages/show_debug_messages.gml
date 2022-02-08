///@function show_debug_messages("message 1", etc...)

// Works exactly like 'show_debug_message()', but allows you to output multiple messages with
// one script call.

/// @peram "message 1"		The first message.
/// @peram etc...			Any additional messages.

// Example: show_debug_messages("hsp:" + string(hsp), "vsp:" + string(vsp));

// Script by MaxLos :)
//----------------------------------------------------------------------------------------------------
function show_debug_messages(message_1)
{
	for (var i = 0; i < argument_count; i ++;)
	{
		var msg = argument[i];
		show_debug_message(msg);
	}
}