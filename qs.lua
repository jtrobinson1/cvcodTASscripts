--quick-step
local qsNum = 5;

for n=1,qsNum do
	emu.frameadvance();
	joypad.set(0, {r1=true,x=true});
	emu.frameadvance();
	joypad.set(0,{x=false});
	emu.frameadvance();
	--for i=1,23 do
		--emu.frameadvance();
	--end
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
	emu.frameadvance();
end