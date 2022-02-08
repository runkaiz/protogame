///@function value_round_multiple(value, multiple, round type)

// Rounds a value to the nearest multiple of a value.

/// @peram value        The value being rounded.
/// @peram multiple     The nearest multiple the value should be rounded to.
/// @peram round_type   Whether to round down to the nearest multiple ("floor"), round up to the nearest multiple ("ceil")
///                     or use bankers rounding ("round") to decide whether to round up or down to the nearest multiple.

// Example: x = value_round_multiple(x, 32, "round");

// Script by MaxLos :)
//------------------------------------------------------------------------------------------------------------------------------
function value_round_multiple(value, multiple, round_type)
{
	if (value = 0) value = 1;
	if      (round_type = "floor") return floor(value/multiple) * multiple;
	else if (round_type = "ceil")  return ceil(value/multiple)  * multiple;
	else if (round_type = "round") return round(value/multiple) * multiple;
}