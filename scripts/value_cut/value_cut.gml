///@function value_cut(value, place);

//Returns a value with all numbers after it's nth decimal place removed.

/// @peram value     The value whose decimals places are being removed.
/// @peram place     The decimal place in which all numbers after it will be removed.

// Example: 'var number = scr_cut(5.59382, 2);' will make 'number' equal 5.59

// Original script by dariusdan, edited for GMS 2.3 by MaxLos :) 
//-----------------------------------------------------------------------------------------------
function value_cut(value, place)
{
	var pot = power(10, place);
	var v1, v2, v3;
	v1 = value * pot;
	v2 = round(v1) div 1;
	v3 = v2 / pot;
	return v3;
}