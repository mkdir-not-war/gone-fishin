function randFromDistribution(t, dist_name)
	-- loop through t, using t.index[dist_name] as the distribution probability
	-- no need to normalize
	local total = 0
	local counter = 0
	local distribution = {}
	for k, v in pairs(t) do 
		counter = counter + 1
		total = total + v[dist_name]
		distribution[counter] = {val = v, num = total}
	end

	local rand = math.random(counter)
	for i, v in ipairs(distribution) do
		if rand <= v.num then
			return v.val
	end
end