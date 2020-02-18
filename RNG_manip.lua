local saveSlot = 8;
local attemptCounter = 600;
local n = 1;
local reSave = 60;
local frameCheck = 35;
local dropAddressOne = 0x20B0FB38; --0x20B10E38 JP address
local dropAddressTwo = 0x20B0FB40; --0x20B10E40 JP address
local dropAddressThree = 0x20B0FB48; --0x20B0FB48 JP address
local dropAddressFour = 0x20B0FB50; 
local dropAddressFive = 0x20B0FB58; 
local dropAddressSix = 0x20B0FB60; 
local dropAddressSeven = 0x20B0FB68; 
local dropAddressEight = 0x20B0FB70;
local saveWait = 775;
local item = 0xCB; -- 0x128 is Rosario, 0xC9 is Sunnyside_Up_Egg, 221 is Ceramics, 0xB3 is High_Potion
local forever = true; 
local saveStateFrame = -1;

function printMemory()
	m = memory.readdword(dropAddressOne, "r5900"); --Drop slot 1
	print("memory at 0x" .. string.format("%X", dropAddressOne) .. " is 0x" .. string.format("%X", m));
	m = memory.readdword(dropAddressTwo, "r5900"); --Drop slot 2
	print("memory at 0x" .. string.format("%X", dropAddressTwo) .. " is 0x" .. string.format("%X", m));
	m = memory.readdword(dropAddressThree, "r5900"); --Drop slot 3
	print("memory at 0x" .. string.format("%X", dropAddressThree) .. " is 0x" .. string.format("%X", m));
	m = memory.readdword(dropAddressFour, "r5900"); --Drop slot 4
	print("memory at 0x" .. string.format("%X", dropAddressFour) .. " is 0x" .. string.format("%X", m));
	m = memory.readdword(dropAddressFive, "r5900"); --Drop slot 5
	print("memory at 0x" .. string.format("%X", dropAddressFive) .. " is 0x" .. string.format("%X", m));
	m = memory.readdword(dropAddressSix, "r5900"); --Drop slot 6
	print("memory at 0x" .. string.format("%X", dropAddressSix) .. " is 0x" .. string.format("%X", m));
	m = memory.readdword(dropAddressSeven, "r5900"); --Drop slot 7
	print("memory at 0x" .. string.format("%X", dropAddressSeven) .. " is 0x" .. string.format("%X", m));
	m = memory.readdword(dropAddressEight, "r5900"); --Drop slot 8
	print("memory at 0x" .. string.format("%X", dropAddressEight) .. " is 0x" .. string.format("%X", m));
end

function makeSave()
	saveStateFrame = emu.framecount();
	savestate.saveslot(saveSlot);
	for i=1,saveWait do
		emu.frameadvance();
	end
end

emu.pause()
makeSave();
for i=1,attemptCounter do
	savestate.loadslot(saveSlot);
	for i=1,n do
		emu.frameadvance();
	end;
	joypad.set(0,{select=true});
	emu.frameadvance();
	emu.frameadvance();
	joypad.set(0,{select=false});
	print(emu.framecount()-2);
	for i=1,frameCheck do
		emu.frameadvance();
	end
	emu.frameadvance();
	printMemory();
	if memory.readdword(dropAddressOne , "r5900") == item or memory.readword(dropAddressTwo, "r5900") == item or memory.readword(dropAddressThree, "r5900") == item or memory.readword(dropAddressFour, "r5900") == item or memory.readword(dropAddressFive, "r5900") == item or memory.readword(dropAddressSix, "r5900") == item or memory.readword(dropAddressSeven, "r5900") == item or memory.readword(dropAddressEight, "r5900") == item then
		n=i;
		break;
	end
	n=n+1;
	if i % reSave == 0 and i ~= attemptCounter then
		savestate.loadslot(saveSlot);
		for i=1,n do
			emu.frameadvance();
		end
		print("saveStateFrame " .. saveStateFrame);
		makeSave();
		print("saveStateFrame " .. saveStateFrame);
		n = i % reSave;
	end
	print("n=" .. n);
	print("i=" .. i);
	if forever then
		i = 1;
	end
end
if memory.readdword(dropAddressOne , "r5900") == item or memory.readword(dropAddressTwo, "r5900") == item or memory.readword(dropAddressThree, "r5900") == item or memory.readword(dropAddressFour, "r5900") == item or memory.readword(dropAddressFive, "r5900") == item or memory.readword(dropAddressSix, "r5900") == item or memory.readword(dropAddressSeven, "r5900") == item or memory.readword(dropAddressEight, "r5900") == item then
	print("Found 0x" .. string.format("%X",item) .. " in " .. n .. " frames");
else
	print("did not find");
end
emu.frameadvance();
emu.pause();