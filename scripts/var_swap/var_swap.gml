 ///@function var_swap("variable 1", id 1, "variable 2", id 2)

// Swaps the values of two instance-scope variables.

/// @peram "variable 1"		The name of the first variable whose value will be swapped with the second variable.
/// @peram id 1				The instance id of the instance that owns the first variable.
/// @peram "variable 2"		The name of the second variable whose value will be swapped with the first variable.
/// @peram id 2				The instance id of the instance that owns the second variable.

// Example 1: var_swap("x", id, "y", id);
// Example 2: var_swap("HP", obj_player.id, "HP", obj_enemy.id)

// Script by MaxLos :)
//-------------------------------------------------------------------------------------------------------------------
function var_swap(variable_1, id_1, variable_2, id_2)
{
	var variable_1_value = variable_instance_get(id_1, variable_1);
	var variable_2_value = variable_instance_get(id_2, variable_2);
	var temp = variable_1_value;
	
	variable_instance_set(id_1, variable_1, variable_2_value);
	variable_instance_set(id_2, variable_2, temp);
}