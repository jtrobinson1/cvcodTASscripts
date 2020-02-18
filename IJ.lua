--IJ Script

function menu()
	local X = 2;
	for i=1,X do
		joypad.set(0, {down=true});
		emu.frameadvance();
		emu.frameadvance();
		joypad.set(0, {down=false});
		emu.frameadvance();
		emu.frameadvance();
	end
	joypad.set(0, {square=true});
	emu.frameadvance();
	emu.frameadvance();
	joypad.set(0, {square=false});
	emu.frameadvance();
	X = 12
	for i=1,X do
		emu.frameadvance();
	end
	joypad.set(0, {square=true});
	emu.frameadvance();
	emu.frameadvance();
	joypad.set(0, {square=false});
	emu.frameadvance();
	emu.frameadvance();
	X = 1
	for i=1,5 do
		emu.frameadvance();
	end	
	joypad.set(0, {square=true});
	emu.frameadvance();
	emu.frameadvance();
	joypad.set(0, {square=false});
	emu.frameadvance();
	emu.frameadvance();
	joypad.set(0, {start=true});
	emu.frameadvance();
	emu.frameadvance();
	joypad.set(0, {start=false});
	emu.frameadvance();
	emu.frameadvance();
end

function jump()
	local Y = 75;
	for i=1,Y do
		if i == 1 then
			menu();
		end
		if i == Y - 1 then 
			emu.pause();
			break;
		end
		X=9;
		for i=1,X do
			emu.frameadvance();
		end
		joypad.set(0, {square=true});
		emu.frameadvance();
		emu.frameadvance();
		joypad.set(0, {square=false});
		emu.frameadvance();
		emu.frameadvance();
		X=7;
		for i=1,X do
			emu.frameadvance();
		end
		joypad.set(0, {start=true});
		emu.frameadvance();
		emu.frameadvance();
		joypad.set(0, {start=false});
		emu.frameadvance();
		emu.frameadvance();
		X=27;
		for i=1,X do
			emu.frameadvance();
		end
		if i ~= Y - 1 then
			menu();
		end
	end
end

jump();
emu.pause();