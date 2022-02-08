#region // Enumerators
enum CONSOLE_TYPES {
	NORMAL,
	ERROR,
	WARNING,
	INFO,
}

enum CONSOLE_MESSAGES {
	INTIALIZATION,
	NOT_ENOUGH_PARAMS,
	TOO_MUCH_PARAMS,
	NOT_A_COMMAND,
	INVALID_PARAM,
	HELP_MENU,
	COMMAND_DOESNT_EXISTS,
}
#endregion

#region // GET
/// @function console_get_commands()
function console_get_commands() {
	var _commands = [
		{
			name:	"COMMAND",
			short:	"SHORT",
			desc:	"DESCRIPTION",
			args:	["ARGUMENT"],
			values: ["VALUE"],
			func:	console_write_log,
		},
		{
			name:	"show",
			short:	"-",
			desc:	"Makes something visible on screen.",
			args:	["tag"],
			values:	["Can take values \"fps\" or \"overlay\"."],
			func:	console_command_show,
		},
		{
			name:	"hide",
			short:	"-",
			desc:	"Makes something invisible on screen.",
			args:	["tag"],
			values:	["Can take values \"fps\" or \"overlay\"."],
			func:	console_command_hide,
		},
		{
			name:	"message",
			short:	"msg",
			desc:	"Shows a message and pauses the game.",
			args:	["text"],
			values:	["\"Message to show.\""],
			func:	console_command_message,
		},
		{
			name:	"fullscreen",
			short:	"fs",
			desc:	"Toggle fullscreen.",
			args:	["tag"],
			values:	["Can take values \"0\" or \"1\" (\"false\" or \"true\" are also valid)."],
			func:	console_command_fullscreen,
		},
		{
			name:	"game",
			short:	"gm",
			desc:	"Choose to end or restart the game.",
			args:	["tag"],
			values:	["Can take values \"end\", \"reset\" or \"restart\"."],
			func:	console_command_game,
		},
		{
			name:	"help",
			short:	"-",
			desc:	"Show help about commands",
			args:	["command"],
			values:	["Can take any command name to show specific help about it."],
			func:	console_command_help,
		},
		{
			name:	"create",
			short:	"-",
			desc:	"Creates an instance.",
			args:	["name", "x", "y", "depth"],
			values: ["Name of the asset.",
					 "x position (default: Mouse x)",
					 "y position (default: Mouse y)",
					 "instance depth (default: -100)"],
			func:	console_command_create,
		},
		{
			name:	"instances",
			short:	"inst",
			desc:	"Get all active instances.",
			args:	["name"],
			values: ["Name of the object to get instances."],
			func:	console_command_instances,
		},
	];
	
	return _commands;
}

/// @function console_get_message(message_type, command, params_count, min_params, max_params)
/// @param	{real}		message_type
/// @param	{string}	command
/// @param	{real}		params_count
/// @param	{real}		min_params
/// @param	{real}		max_params
function console_get_message(_type, _command, _params_count=0, _min_params=0, _max_params=1) {
	switch (_type) {
		case CONSOLE_MESSAGES.NOT_ENOUGH_PARAMS:
			return ("\"" + _command + "\" must to recieve at least " +
					string(_min_params) + " argument(s).\n(" + string(_params_count) + " were given)");
		
		case CONSOLE_MESSAGES.TOO_MUCH_PARAMS:
			return ("\"" + _command + "\" must to recieve " +
					string(_max_params) + " argument(s).\n(" + string(_params_count) + " were given)");
			
		case CONSOLE_MESSAGES.NOT_A_COMMAND:
			return ("\"" + _command + "\" is not a command.");
			
		case CONSOLE_MESSAGES.INVALID_PARAM:
			return ("Command \"" + _command + "\" has no param \"");
			
		case CONSOLE_MESSAGES.HELP_MENU:
			return ("Type \"help <command>\" to get more information about the command.");
			
		case CONSOLE_MESSAGES.COMMAND_DOESNT_EXISTS:
			return ("Command \"" + _command + "\" does not exists.");
			
		case CONSOLE_MESSAGES.INTIALIZATION:
			return ("=== GM Ez Console ===\nVersion 1.0 by D'Andrëw Box");
	}
}

/// @function console_get_type_color(type)
/// @param	{real}	type
/// @desc	Get message colour
function console_get_type_color(_type) {
	var _color;
	switch (_type) {
		default:
		case CONSOLE_TYPES.NORMAL:
			_color = $EEEEEE;
			break;
		
		case CONSOLE_TYPES.ERROR:
			_color = c_red;
			break;
			
		case CONSOLE_TYPES.WARNING:
			_color = c_yellow;
			break;
			
		case CONSOLE_TYPES.INFO:
			_color = $999999;
			break;
	}
	
	return _color;
}

/// @function console_get_timestamp(time)
/// @param	{real}	time
function console_get_timestamp(_t) {
	var _hh, _mm, _ss;
	_hh = string_replace(string_format(date_get_hour(_t), 2, 0), " ", "0");
	_mm = string_replace(string_format(date_get_minute(_t), 2, 0), " ", "0");
	_ss = string_replace(string_format(date_get_second(_t), 2, 0), " ", "0");
	
	return "<" + _hh + ":" + _mm + ":" + _ss + "> ";
}
#endregion

#region // Write & Toggle
/// @function ConsoleLog(message, [type])
/// @param	{string}	message
/// @param	{real}		[type]
function ConsoleLog(_msg, _type = CONSOLE_TYPES.NORMAL) constructor {
	message		= _msg;
	type		= _type;
	color		= console_get_type_color(type);
	time		= date_current_datetime();
	timestamp	= console_get_timestamp(time);
}

/// @function console_write_log(message, [type])
/// @param	{string}	message
/// @param	{real}		[type]
function console_write_log(_msg, _type = CONSOLE_TYPES.NORMAL) {
	with (__debug_console__) {
		var _new_msg = new ConsoleLog(_msg, _type);
		ds_list_add(console_text_log, _new_msg);
	
		keyboard_string = "";
		console_text_actual = "";
		console_nav = ds_list_size(console_text_log);
		event_user(0);
	}
}

/// @function console_toggle_visible()
function console_toggle_visible() {
	if (keyboard_check_pressed(console_key_toggle)) {
		// Reset console text bar when visible again
		keyboard_lastkey = noone;
		keyboard_string = "";
		console_text_actual = "";
		visible = true;
	}
}
#endregion

#region // Base commands
/// @function console_command_show(args)
/// @param	{array}	args
/// @desc	Show debug overlay
function console_command_show(_args) {
	var _command	= "show";
	var _params_len = array_length(_args);
	
	if (_params_len < 1) {
		// Not enough params
		var _not_enough_text = console_get_message(CONSOLE_MESSAGES.NOT_ENOUGH_PARAMS, _command, _params_len, 1, 1);
		console_write_log(_not_enough_text, CONSOLE_TYPES.INFO);
	} else if (_params_len > 1) {
		// Too much params
		var _too_much_text = console_get_message(CONSOLE_MESSAGES.TOO_MUCH_PARAMS, _command, _params_len, 1, 1);
		console_write_log(_too_much_text, CONSOLE_TYPES.INFO);
	} else {
		switch (_args[0]) {
			case "fps":
				__debug_console__.console_fps_show = true;
				console_write_log("FPS are now visible!", CONSOLE_TYPES.WARNING);
				break;
			
			case "overlay":
				show_debug_overlay(true);
				console_write_log("Debug overlay activated", CONSOLE_TYPES.WARNING);
				break;
				
			default:
				var _invalid_param = console_get_message(CONSOLE_MESSAGES.INVALID_PARAM, _command, _params_len, 1, 1) + _args[0] + "\".";
				console_write_log(_invalid_param, CONSOLE_TYPES.ERROR);
				break;
		}	
	}
}

/// @function console_command_hide(args)
/// @param	{array}	args
/// @desc	Hide debug overlay
function console_command_hide(_args) {
	var _command	= "hide";
	var _params_len = array_length(_args);
	
	if (_params_len < 1) {
		// Not enough params
		var _not_enough_text = console_get_message(CONSOLE_MESSAGES.NOT_ENOUGH_PARAMS, _command, _params_len, 1, 1);
		console_write_log(_not_enough_text, CONSOLE_TYPES.INFO);
	} else if (_params_len > 1) {
		// Too much params
		var _too_much_text = console_get_message(CONSOLE_MESSAGES.TOO_MUCH_PARAMS, _command, _params_len, 1, 1);
		console_write_log(_too_much_text, CONSOLE_TYPES.INFO);
	} else {
		switch (_args[0]) {
			case "fps":
				__debug_console__.console_fps_show = false;
				console_write_log("FPS are now invisible!", CONSOLE_TYPES.WARNING);
				break;
				
			case "overlay":
				show_debug_overlay(false);
				console_write_log("Debug overlay deactivated", CONSOLE_TYPES.WARNING);
				break;
				
			default:
				var _invalid_param = console_get_message(CONSOLE_MESSAGES.INVALID_PARAM, _command, _params_len, 1, 1) + _args[0] + "\".";
				console_write_log(_invalid_param, CONSOLE_TYPES.ERROR);
				break;
		}	
	}
}

/// @function console_command_message(args)
/// @param	{array}	args
/// @desc	Hide debug overlay
function console_command_message(_args) {
	var _command	= "message";
	var _params_len = array_length(_args);
	
	if (_params_len < 1) {
		// Not enough params
		var _not_enough_text = console_get_message(CONSOLE_MESSAGES.NOT_ENOUGH_PARAMS, _command, _params_len, 1, 1);
		console_write_log(_not_enough_text, CONSOLE_TYPES.INFO);
	} else if (_params_len > 99) {
		// Too much params
		var _too_much_text = console_get_message(CONSOLE_MESSAGES.TOO_MUCH_PARAMS, _command, _params_len, 1, 1);
		console_write_log(_too_much_text, CONSOLE_TYPES.INFO);
	} else {
		var _msg = "";
		for (var i = 0; i < _params_len; i++) {
			_msg += _args[i] + (i == _params_len - 1 ? "" : " ");
		}
		
		show_message(_msg);
	}
}

/// @function console_command_game(args)
/// @param	{array}	args
/// @desc	Hide debug overlay
function console_command_game(_args) {
	var _command	= "game";
	var _params_len = array_length(_args);
	
	if (_params_len < 1) {
		// Not enough params
		var _not_enough_text = console_get_message(CONSOLE_MESSAGES.NOT_ENOUGH_PARAMS, _command, _params_len, 1, 1);
		console_write_log(_not_enough_text, CONSOLE_TYPES.INFO);
	} else if (_params_len > 1) {
		// Too much params
		var _too_much_text = console_get_message(CONSOLE_MESSAGES.TOO_MUCH_PARAMS, _command, _params_len, 1, 1);
		console_write_log(_too_much_text, CONSOLE_TYPES.INFO);
	} else {
		switch (_args[0]) {
			case "restart":
			case "reset":
				game_restart();
				break;
				
			case "end":
				game_end();
				break;
				
			default:
				var _invalid_param = console_get_message(CONSOLE_MESSAGES.INVALID_PARAM, _command, _params_len, 1, 1) + _args[0] + "\".";
				console_write_log(_invalid_param, CONSOLE_TYPES.ERROR);
				break;
		}	
	}
}

/// @function console_command_fullscreen(args)
/// @param	{array}	args
/// @desc	Hide debug overlay
function console_command_fullscreen(_args) {
	var _command	= "fullscreen";
	var _params_len = array_length(_args);
	
	if (_params_len < 1) {
		// Not enough params
		var _not_enough_text = console_get_message(CONSOLE_MESSAGES.NOT_ENOUGH_PARAMS, _command, _params_len, 1, 1);
		console_write_log(_not_enough_text, CONSOLE_TYPES.INFO);
	} else if (_params_len > 1) {
		// Too much params
		var _too_much_text = console_get_message(CONSOLE_MESSAGES.TOO_MUCH_PARAMS, _command, _params_len, 1, 1);
		console_write_log(_too_much_text, CONSOLE_TYPES.INFO);
	} else {
		switch (_args[0]) {
			case "0":
			case "false":
				window_set_fullscreen(false);
				console_write_log("Fullscreen toggled OFF.", CONSOLE_TYPES.WARNING);
				break;
				
			case "1":
			case "true":
				window_set_fullscreen(true);
				console_write_log("Fullscreen toggled ON.", CONSOLE_TYPES.WARNING);
				break;
				
			default:
				var _invalid_param = console_get_message(CONSOLE_MESSAGES.INVALID_PARAM, _command, _params_len, 1, 1) + _args[0] + "\".";
				console_write_log(_invalid_param, CONSOLE_TYPES.ERROR);
				break;
		}	
	}
}

/// @function console_command_help(args)
/// @param	{array}	args
/// @desc	Show help about commands
function console_command_help(_args) {
	var _command	= "help";
	var _params_len = array_length(_args);
	
	if (_params_len > 1) {
		// Too much params
		var _too_much_text = console_get_message(CONSOLE_MESSAGES.TOO_MUCH_PARAMS, _command, _params_len, 0, 1);
		console_write_log(_too_much_text, CONSOLE_TYPES.INFO);
		return -1;
	}
	
	var _console_comands = console_get_commands();
	
	if (_params_len == 0) {
		// Show help text
		var _help_text = console_get_message(CONSOLE_MESSAGES.HELP_MENU, _command);
		console_write_log(_help_text, CONSOLE_TYPES.INFO);
		
	
		// General help
		for (var i = 0; i < array_length(_console_comands); i++) {
			var _com_name = string_upper(_console_comands[i].name);
			var _com_shrt = string_upper(_console_comands[i].short);
			var _com_desc = _console_comands[i].desc;
			
			console_write_log(string_pad(_com_name, 12) + string_pad(_com_shrt, 8) + _com_desc, CONSOLE_TYPES.INFO);
		}
	} else if (_params_len == 1) {
		// First Checks if command exists
		var _command_exists = false;
		
		for (var i = 0; i < array_length(_console_comands); i++) {
			_command_exists = ( _console_comands[i].name == _args[0] || _console_comands[i].short == _args[0]
								? true
								: _command_exists );
		}
		
		if !(_command_exists) {
			var _command_doesnt_exists_text = console_get_message(CONSOLE_MESSAGES.COMMAND_DOESNT_EXISTS, _args[0]);
			console_write_log(_command_doesnt_exists_text, CONSOLE_TYPES.ERROR);
			return -1;
		}
		
		
		// Command help
		var _com_name, _com_desc, _com_args;
		
		for (var i = 0; i < array_length(_console_comands); i++) {
			var _com_name = _console_comands[i].name;
			var _com_shrt = _console_comands[i].short;
			
			if (_com_name != _args[0] && _com_shrt != _args[0]) { continue; }
			
			_com_name = _com_name;
			_com_desc = _console_comands[i].desc;
			_com_args = _console_comands[i].args;			
			
			// Function
			var _com_args_str = "";
			for (var j = 0; j < array_length(_com_args); j++) {
				_com_args_str += _com_args[j] + "  ";
			}
			
			console_write_log(string_pad(_com_name, 12) + _com_args_str, CONSOLE_TYPES.WARNING);
			
			// Description
			console_write_log(_com_desc + "\n\n", CONSOLE_TYPES.INFO);
			
			// Arguments description
			var _com_args_val = _console_comands[i].values;
			console_write_log(_console_comands[0].args[0] + "   " + _console_comands[0].values[0], CONSOLE_TYPES.INFO);
			
			for (var j = 0; j < array_length(_com_args); j++) {
				
				console_write_log(string_pad(_com_args[j], 12) + _com_args_val[j], CONSOLE_TYPES.INFO);
			}
			
			return -1;
		}
		
		
	}
}

/// @function console_command_create(args)
/// @param	{array}	args
/// @desc	Create an instance
function console_command_create(_args) {
	var _command	= "create";
	var _params_len = array_length(_args);
	
	if (_params_len < 1) {
		// Not enough params
		var _not_enough_text = console_get_message(CONSOLE_MESSAGES.NOT_ENOUGH_PARAMS, _command, _params_len, 1, 4);
		console_write_log(_not_enough_text, CONSOLE_TYPES.INFO);
	} else if (_params_len > 4) {
		// Too much params
		var _too_much_text = console_get_message(CONSOLE_MESSAGES.TOO_MUCH_PARAMS, _command, _params_len, 1, 4);
		console_write_log(_too_much_text, CONSOLE_TYPES.INFO);
	} else {
		var _asset = asset_get_index(_args[0]);
		
		try {
			var _x = ( _params_len > 1 ? real(_args[1]) : mouse_x );
			var _y = ( _params_len > 2 ? real(_args[2]) : mouse_y );
			var _depth = ( _params_len > 3 ? real(_args[3]) : -100 );
		} catch (e) {
			console_write_log(e.message, CONSOLE_TYPES.ERROR);
			return -1;
		}
		
		if (_asset == -1) {
			console_write_log("There's no object named \"" + _args[0] + "\"!", CONSOLE_TYPES.ERROR);
		} else {
			var _inst = instance_create_depth(_x, _y, _depth, _asset);
			console_write_log("Instance created with id " + string(_inst.id) + ".", CONSOLE_TYPES.INFO);
		}
	}
}

/// @function console_command_instances(args)
/// @param	{array}	args
/// @desc	Get all instances
function console_command_instances(_args) {
	var _command	= "instances";
	var _params_len = array_length(_args);
	
	if (_params_len > 1) {
		// Too much params
		var _too_much_text = console_get_message(CONSOLE_MESSAGES.TOO_MUCH_PARAMS, _command, _params_len, 1, 4);
		console_write_log(_too_much_text, CONSOLE_TYPES.INFO);
	} else if (_params_len == 1) {
		// Get all instances of 1 specific object
		var _asset = asset_get_index(_args[0]);
		
		if (_asset == -1) {
			console_write_log("There's no object named \"" + _args[0] + "\"!", CONSOLE_TYPES.ERROR);
		} else {
			console_write_log(string_pad("NAME", 32) +
							  string_pad("ID", 16) +
							  string_pad("POSITION", 16) +
							  string_pad("DEPTH", 8),
							  CONSOLE_TYPES.INFO);
			
			var _inst, _name, _id, _pos, _depth;
			for (var i = 0; i < instance_number(_asset); i++) {
				_inst = instance_find(_asset, i);
				_name = string_pad(_args[0], 32);
				_id	  = string_pad(string(_inst.id), 16);
				_pos  = string_pad("(" + string(_inst.x) + ", " + string(_inst.y) + ")", 16);
				_depth= string_pad(string(_inst.depth), 8);
				
				console_write_log(_name + _id + _pos + _depth, CONSOLE_TYPES.INFO);
			}
		}
	} else if (_params_len == 0) {
		// Get all active instances
		console_write_log(	string_pad("NAME", 32) +
							string_pad("ID", 16) +
							string_pad("POSITION", 16) +
							string_pad("DEPTH", 8),
							CONSOLE_TYPES.INFO);
							  
		with (all) {
			var _name, _id, _pos, _depth;
			_name = string_pad(object_get_name(object_index), 32);
			_id	  = string_pad(string(id), 16);
			_pos  = string_pad("(" + string(x) + ", " + string(y) + ")", 16);
			_depth= string_pad(string(depth), 8);
			
			console_write_log(_name + _id + _pos + _depth, CONSOLE_TYPES.INFO);
		}
	}
}

#endregion

#region // Custom commands
/*
	ADD YOUR CUSTOM COMMANDS BELOW
*/


#endregion

#region // Check commands
/// @function console_check_command(message)
/// @param	{string}	message
function console_check_command(_msg) {
	var _msg_array	= string_trim(_msg, " ");
	var _command	= _msg_array[0];
	var _params		= [];
	array_copy(_params, 0, _msg_array, 1, array_length(_msg_array) - 1);
	
	console_write_log(console_text_actual);
	
	var _commands = console_get_commands();
	for (var i = 0; i < array_length(_commands); i++) {
		if (_commands[i].name == _command || (_commands[i].short == _command && _commands[i].short != "-")) {
			_commands[i].func(_params);
			return -1;
		}
	}
	
	var _not_found_text = console_get_message(CONSOLE_MESSAGES.NOT_A_COMMAND, _command);
	console_write_log(_not_found_text, CONSOLE_TYPES.INFO);
}
#endregion


/*
	OTHER FUNCTIONS
*/
/// @function string_trim(text, value)
/// @param	{string}	text
/// @param	{string}	value
function string_trim(_text, _val) {
	var _text_array = [];
	var _text_act = "";
	var _text_len = string_length(_text);
	
	for (var i = 1; i <= _text_len + 1; i++) {
		var _this_char = string_char_at(_text, i);
		if (_this_char == _val || i > _text_len) {
			array_push(_text_array, _text_act);
			_text_act = "";
			continue;
		}
		
		_text_act += _this_char;
	}
	
	return _text_array;
}

/// @function string_pad(text, spaces)
/// @param	{string}	text
/// @param	{real}		spaces
function string_pad(_text, _spaces) {
	var _pad = "";
	for (var i = 0; i < _spaces - string_length(_text); i++) {
		_pad += " ";
	}
	
	return _text + _pad;
}