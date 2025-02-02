M = {
	n = "n",
	v = "v",
	i = "i",
	t = "t",
	n_v = { "n", "v" },
	n_t = { "n", "t" },
	n_v_i = { "n", "v", "i" },
}

-- stylua: ignore
function ShallowCopy(t)
	local copy = {}
	for k, v in pairs(t) do copy[k] = v end
	return copy
end
