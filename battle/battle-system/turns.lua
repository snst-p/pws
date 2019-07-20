function start_battle(enemy, player)
	print("hp player: " .. player.status.hp)
	print("hp enemy: " .. enemy.status.hp)
end

function attack.execute(enemy, player, selected_move)
	selected_move.attack(enemy, player, selected_move)
end

function display_stats(enemy1, enemy2, player)
	local hp_player = "HP PLAYER: " .. player.status.hp
	local hp_enemy1 = "HP ENEMY 1: " ..  enemy1.status.hp
	local hp_enemy2 = "HP ENEMY 2: " ..  enemy2.status.hp
	local width_screen = love.graphics.getWidth()
	local width_text = 130
	love.graphics.printf(hp_player, width_screen - width_text, 0, width_text, 'right')
	love.graphics.printf(hp_enemy1, width_screen - width_text, 20, width_text, 'right')
	love.graphics.printf(hp_enemy2, width_screen - width_text, 40, width_text, 'right')
end

function select_move(player)
	local move1 = player.move[1]
	local move2 = player.move[2]
	local move3 = player.move[3]
	text = ""
	if selection == 1 then
		text = "> ".. move1.name .. "    " .. move2.name .. "    " .. move3.name
	elseif selection == 2 then
		text = move1.name .. "  > " .. move2.name .. "    " .. move3.name
	elseif selection == 3 then
		text = move1.name .. "    " .. move2.name .. "  > " .. move3.name
	end
	love.graphics.print("Select a move:", 0, 0)
	love.graphics.print(text, 0, 20)
end

function check_hp(enemy, player)
	print("hp player: " .. player.status.hp)
	print("hp enemy: " .. enemy.status.hp)
end

function select_target:execute(move)
	selection = 1
end

function select_target:draw(enemy1, enemy2)
	text = ""
	if selection == 1 then
		text = "> ".. enemy1.name .. "    " .. enemy2.name
	elseif selection == 2 then
		text = enemy1.name .. "  > " .. enemy2.name
	end
	love.graphics.print("Select the target:", 0, 0)
	love.graphics.print(text, 0, 20)
end