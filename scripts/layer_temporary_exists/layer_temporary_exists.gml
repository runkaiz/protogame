///@function layer_temporary_exists()

// Returns whether or not a 'temporary' layer exists. 
// (Temporary layers are layers that GM creates for instances whose depth was set via code, rather than the Room Editor.)

// Script by MaxLos :)
//-------------------------------------------------------------------------------------------------------------------------------
function layer_temporary_exists()
{
	with (all)  
	{
		if (layer = -1) return true;
	}
	return false;
}