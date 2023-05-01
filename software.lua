--[[
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
УБРАЛ РУКИ ОТ ГОВНО КОДА
]]




--AttachTrailer,rescam - Yuriy Code


--============================================================--
--основные библеотеки
--==========================================================
local imgui = require("imgui")
enc = require("encoding")
ffi = require("ffi")
enc.default = "cp1251"
u8 = enc.UTF8
local sampev = require('lib.samp.events')
local memory = require'memory'
local key = require 'vkeys'
imgui.ToggleButton = require('imgui_addons').ToggleButton
imgui.HotKey = require('imgui_addons').HotKey
imgui.Spinner = require('imgui_addons').Spinner
imgui.BufferingBar = require('imgui_addons').BufferingBar
local fa = require 'faIcons'
local fa_glyph_ranges = imgui.ImGlyphRanges({ fa.min_range, fa.max_range })
local tex = renderCreateFont('Tahoma', 10, 5)
local font_flag = require('moonloader').font_flag
local sampev = require "lib.samp.events"
local raknet = require("lib.samp.raknet")
local vector = require 'vector3d'
local inicfg = require 'inicfg'
local dlstatus = require('moonloader').download_status
local wh, wy = getScreenResolution()
local cx = wh / 2
local cy = wy / 2
local sw, sh = getScreenResolution()
local count = 0
local script_vers = 2
local script_vers_text = "1.05"

local update_url = "https://raw.githubusercontent.com/IvanCodeSAMP/sofrware/main/%5Bhelper%5D.ini" -- тут тоже свою ссылку
local update_path = getWorkingDirectory() .. "/[helper].ini" -- и тут свою ссылку

local script_url = "" -- тут свою ссылку
local script_path = thisScript().path
up = true
local rtot = 0.3
local b_button = imgui.ImInt(1)
local tp, sync = false, false
local packets = 0
local sec = 0
local thread = nil
local font = renderCreateFont("Arial", 12)
local f = require 'moonloader'.font_flag
local font = renderCreateFont('Arial', 10, f.BOLD + f.SHADOW)
require"lib.moonloader"
require"lib.sampfuncs"
local Matrix3X3 = require "matrix3x3"
local Vector3D = require "vector3d"
local tnotf = import('lib/toast_notf.lua')
local sName = '{6398c9}[TRMAP-RESTORE]{FFFFFF} – '
local zoneActive = false
local mapUsed = false
local healme = false
local copas = require 'copas'
local http = require 'copas.http'


ffi.cdef[[
    typedef unsigned long DWORD;
    typedef unsigned int UINT;

    typedef struct tagLASTINPUTINFO {
        UINT  cbSize;
        DWORD dwTime;
    } LASTINPUTINFO, *PLASTINPUTINFO;

    bool GetLastInputInfo(
        PLASTINPUTINFO plii
    );

    DWORD GetTickCount();
]]
local X, Y, Z = 0, 0, 0

local mainIni = inicfg.load({
    config = {
	blain = 0,
	invx = 0,
	invy = 0,
	invz = 0,
	objx = 0,
	objy = 0,
	objz = 0,
	objrtx = 0,
	objrty = 0,
	objrtz = 0,
	invdist = 0,
	camdist = 11,
    rklad = false,
	bagaj = false,
	sbivmyso = false,
	rzakladka = false,
	rolen = false,
	renderdereva = false,
	rlen = false,
	rhlopok = false,
	rsem = false,
	rryda = false,
	rderevo = false,
	rgrove = false,
	carcheck = false,
	pokaz = false,
	servcheck = false,
	rballas = false,
	rrifa = false,
	raztec = false,
	rnw = false,
	rvagos = false,
	boxmp = false,
	rvetok = false,
    roskolok = false,
    rkypidon = false,
	motoban = false,
	cub = false,
	trans = false,
	fps = false,
	act = false,
	the = false,
	sh = false,
	godcar = false,
	chat = false,
	boomtest = false,
	chande180 = false,
	jumpb = false,
	showfps = false,
	airbraker = false,
	prova = false,
	oocchat = false,
	objcar = false,
	trailerrr = false,
	zoneklad = true,
	infinrun = false,
	trashWH = false,
	kryjok = false,
	skill = false,
	wallhack = false,
	pokazz = false,
	themergb = false,
	lavka = false,
	waitt = 100,
	arenda = false,
	sped = 6,
	spinner = true,
	speedspiner = 2,
	pissat = true,
	process = false,
	famarenda = false
 }
 }, "[helper]")
local keys = require "vkeys"
-- кнопки

update_state = false
local speed = 0
local sped = imgui.ImFloat(mainIni.config.sped)
local waitt = imgui.ImFloat(mainIni.config.waitt)
local tphkablip = imgui.ImBool(false)
local process = imgui.ImBool(mainIni.config.process)
local tphkacheck = imgui.ImBool(false)
local slider = imgui.ImFloat(mainIni.config.camdist)
local slider1 = imgui.ImFloat(mainIni.config.blain)
local teleport = false
local tphka = imgui.ImBool(false)
local work_stat = imgui.ImBool(false)
local main_window_state = imgui.ImBool(false)
local slejka = imgui.ImBool(false)
local main_window1 = imgui.ImBool(false)
local chatclear = imgui.ImBool(false)
local cmdist = imgui.ImBool(false)
packet = 0
local TSRgruz = imgui.ImBool(false)
local progbarr = imgui.ImBool(false)
local motoban = imgui.ImBool(mainIni.config.motoban)
local cub = imgui.ImBool(mainIni.config.cub)
local flood = imgui.ImBool(false)
local botLoader = imgui.ImBool(false)
local botstatus = imgui.ImBool(false)
local botcoordrodina = imgui.ImBool(false)
local botstatusTSR = imgui.ImBool(false)
local kryg = imgui.ImBool(false)
local trans = imgui.ImBool(mainIni.config.trans)
local fps = imgui.ImBool(mainIni.config.fps)
local act = imgui.ImBool(mainIni.config.act)
local the = imgui.ImBool(mainIni.config.the)
local sh = imgui.ImBool(mainIni.config.sh)
local godm = imgui.ImBool(mainIni.config.godcar)
local checkchat = imgui.ImBool(mainIni.config.chat)
local lavka = imgui.ImBool(mainIni.config.lavka)
local flcomp = imgui.ImBool(false)
local speed = imgui.ImInt(1)
local rb_line_size = imgui.ImInt(-50)
local FPSUP = imgui.ImBool(false)
local boom = imgui.ImBool(mainIni.config.boomtest)
local clearchars = imgui.ImBool(false)
local clearvehs = imgui.ImBool(false)
local clearobject = imgui.ImBool(false)
local showfps = imgui.ImBool(mainIni.config.showfps)
local pesok = imgui.ImBool(false)
local airbraker = imgui.ImBool(mainIni.config.airbraker)
local prova = imgui.ImBool(mainIni.config.prova)
local lojitmaso = imgui.ImBool(false)
local oocchat = imgui.ImBool(mainIni.config.oocchat)
local trailerrr = imgui.ImBool(mainIni.config.trailerrr)
local treasurezone = imgui.ImBool(mainIni.config.zoneklad)
local infin = imgui.ImBool(mainIni.config.infinrun)
local trashWH = imgui.ImBool(mainIni.config.trashWH)
local selected_item = imgui.ImInt(0)
local pokaz = imgui.ImBool(mainIni.config.pokaz)
local themes = imgui.ImInt(0)
local kryjok = imgui.ImBool(mainIni.config.kryjok)
local skill	= imgui.ImBool(mainIni.config.skill)
local wallhack = imgui.ImBool(mainIni.config.wallhack)
local themergb = imgui.ImBool(mainIni.config.themergb)
local rklad = imgui.ImBool(mainIni.config.rklad)
local dancer = imgui.ImBool(false)
local bagaj = imgui.ImBool(mainIni.config.bagaj)
local sbivmyso = imgui.ImBool(mainIni.config.sbivmyso)
local rzakladka = imgui.ImBool(mainIni.config.rzakladka)
local rolen = imgui.ImBool(mainIni.config.rolen)
local renderdereva = imgui.ImBool(mainIni.config.renderdereva)
local rlen = imgui.ImBool(mainIni.config.rlen)
local t = imgui.ImBool(false)
local rhlopok = imgui.ImBool(mainIni.config.rhlopok)
local rsem = imgui.ImBool(mainIni.config.rsem)
local rryda = imgui.ImBool(mainIni.config.rryda)
local rderevo = imgui.ImBool(mainIni.config.rderevo)
local rgrove = imgui.ImBool(mainIni.config.rgrove)
local rballas = imgui.ImBool(mainIni.config.rballas)
local rrifa = imgui.ImBool(mainIni.config.rrifa)
local raztec = imgui.ImBool(mainIni.config.raztec)
local rnw = imgui.ImBool(mainIni.config.rnw)
local rvagos = imgui.ImBool(mainIni.config.rvagos)
local boxmp = imgui.ImBool(mainIni.config.boxmp)
local rvetok = imgui.ImBool(mainIni.config.rvetok)
local roskolok = imgui.ImBool(mainIni.config.roskolok)
local rkypidon = imgui.ImBool(mainIni.config.rkypidon)
local skiparenda = imgui.ImBool(mainIni.config.arenda)
local anims = imgui.ImBool(false)
local skipfamcar = imgui.ImBool(mainIni.config.famarenda)
local objcar = imgui.ImBool(mainIni.config.objcar)
local asdzxc = imgui.ImBool(false)
local rvankacars = imgui.ImBool(false)
local rvankaonfoot = imgui.ImBool(false)
local stiler = imgui.ImBool(false)
local tpholodilnik = imgui.ImBool(false)
local tpobratno = imgui.ImBool(false)
local delgun = false
local bots = imgui.ImBool(false)
local botss = imgui.ImBool(false)
local carcheck = imgui.ImBool(mainIni.config.carcheck)
local pokazz = imgui.ImBool(mainIni.config.pokazz)
local servcheck = imgui.ImBool(mainIni.config.servcheck)
local invz = imgui.ImFloat(mainIni.config.invz)
local invy = imgui.ImFloat(mainIni.config.invy)
local invx = imgui.ImFloat(mainIni.config.invx)
local invdist = imgui.ImFloat(mainIni.config.invdist)
local playeridd = imgui.ImInt(0)
local playeriddd = imgui.ImInt(0)
local speedspiner = imgui.ImFloat(mainIni.config.speedspiner)
local spinner = imgui.ImBool(mainIni.config.spinner)
local pissat = imgui.ImBool(mainIni.config.pissat)
local mess = imgui.ImInt(0)
local objrtx = imgui.ImFloat(mainIni.config.objrtx)
local objrty = imgui.ImFloat(mainIni.config.objrty)
local objrtz = imgui.ImFloat(mainIni.config.objrtz)
local objx = imgui.ImFloat(mainIni.config.objx)
local objy = imgui.ImFloat(mainIni.config.objy)
local objz = imgui.ImFloat(mainIni.config.objz)
local boxbot = false
local secind = imgui.ImBool(false)
local alt = false
-- labels - Array - названия элементов меню
-- selected - imgui.ImInt() - выбранный пункт меню
-- size - imgui.ImVec2() - размер элементов
-- speed - float - скорость анимации выбора элемента (необязательно, по стандарту - 0.2)
-- centering - bool - центрирование текста в элементе (необязательно, по стандарту - false)
function imgui.CustomMenu(labels, selected, size, speed, centering)
    local bool = false
    speed = speed and speed or 0.2
    local radius = size.y * 0.50
    local draw_list = imgui.GetWindowDrawList()
    if LastActiveTime == nil then LastActiveTime = {} end
    if LastActive == nil then LastActive = {} end
    local function ImSaturate(f)
        return f < 0.0 and 0.0 or (f > 1.0 and 1.0 or f)
    end
    for i, v in ipairs(labels) do
        local c = imgui.GetCursorPos()
        local p = imgui.GetCursorScreenPos()
        if imgui.InvisibleButton(v..'##'..i, size) then
            selected.v = i
            LastActiveTime[v] = os.clock()
            LastActive[v] = true
            bool = true
        end
        imgui.SetCursorPos(c)
        local t = selected.v == i and 1.0 or 0.0
        if LastActive[v] then
            local time = os.clock() - LastActiveTime[v]
            if time <= 0.3 then
                local t_anim = ImSaturate(time / speed)
                t = selected.v == i and t_anim or 1.0 - t_anim
            else
                LastActive[v] = false
            end
        end
        local col_bg = imgui.GetColorU32(selected.v == i and imgui.GetStyle().Colors[imgui.Col.ButtonActive] or imgui.ImVec4(0,0,0,0))
        local col_box = imgui.GetColorU32(selected.v == i and imgui.GetStyle().Colors[imgui.Col.Button] or imgui.ImVec4(0,0,0,0))
        local col_hovered = imgui.GetStyle().Colors[imgui.Col.ButtonHovered]
        local col_hovered = imgui.GetColorU32(imgui.ImVec4(col_hovered.x, col_hovered.y, col_hovered.z, (imgui.IsItemHovered() and 0.2 or 0)))
        draw_list:AddRectFilled(imgui.ImVec2(p.x-size.x/6, p.y), imgui.ImVec2(p.x + (radius * 0.65) + t * size.x, p.y + size.y), col_bg, 10.0)
        draw_list:AddRectFilled(imgui.ImVec2(p.x-size.x/6, p.y), imgui.ImVec2(p.x + (radius * 0.65) + size.x, p.y + size.y), col_hovered, 10.0)
        draw_list:AddRectFilled(imgui.ImVec2(p.x, p.y), imgui.ImVec2(p.x+5, p.y + size.y), col_box)
        imgui.SetCursorPos(imgui.ImVec2(c.x+(centering and (size.x-imgui.CalcTextSize(v).x)/2 or 15), c.y+(size.y-imgui.CalcTextSize(v).y)/2))
        imgui.Text(v)
        imgui.SetCursorPos(imgui.ImVec2(c.x, c.y+size.y))
    end
    return bool
end
local odejda_dist = 1.5
local tab = imgui.ImInt(1)
local tabs = {
    u8' ОСНОВНОЕ',
    u8' renders',
   u8' soft ТСР[ARZ]',
    u8' weapons',
    u8' in cars',
    u8' invisible',
	u8' ХЗ что добавить',
    u8' Info',
    u8' TELEPORT',
	u8'Trolling',
}

-- буффер 1
local buffer = imgui.ImBuffer(256)
--всякое
local radius = 150 -- радиус прицела, можно менять на своё усмотрение, как удобно.
KEY = key.VK_J -- кнопка активации
active = true -- активен ли функционал скрипта по умолчанию. true - активен, false - неактивен
trailer = nil -- хендл трейлера. Изменять не нужно.


bike = {[481] = true, [509] = true, [510] = true}
moto = {[448] = true, [461] = true, [462] = true, [463] = true, [468] = true, [471] = true, [521] = true, [522] = true, [523] = true, [581] = true, [586] = true, [3197]= true}
local bx, by, bz = 0, 0, 0
local fps = 0

--очень полезная хуйня(https://www.blast.hk/threads/13380/)
-- YURIY CODE <3
--GRUZIN GANG <3
--FYP <идинахуй3

function imgui.BeforeDrawFrame()
    if fa_font == nil then
        local font_config = imgui.ImFontConfig() -- to use 'imgui.ImFontConfig.new()' on error
        font_config.MergeMode = true
        fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/resource/fonts/fontawesome-webfont.ttf', 14.0, font_config, fa_glyph_ranges)
    end
end

local clicks = 0
local bar = 0
local krygi = 0
local box = 0
local lavki = {}
local objs = {
    [2670] = 'мусор',
    [2673] = 'мусор',
    [2674] = 'мент',
    [2677] = 'мусор'
}

local step = -1

local props = { 
	[0716] = true, [0733] = true, [0737] = true, [0792] = true, [1211] = true, [1216] = true, [1220] = true,
	[1223] = true, [1224] = true, [1226] = true, [1229] = true, [1230] = true, [1231] = true, [1232] = true,
	[1233] = true, [1257] = true, [1258] = true, [1280] = true, [1283] = true, [1284] = true, [1285] = true,
	[1286] = true, [1287] = true, [1288] = true, [1289] = true, [1290] = true, [1291] = true, [1293] = true,
	[1294] = true, [1297] = true, [1300] = true, [1315] = true, [1350] = true, [1351] = true, [1352] = true,
	[1373] = true, [1374] = true, [1375] = true, [1408] = true, [1411] = true, [1412] = true, [1413] = true,
	[1418] = true, [1438] = true, [1440] = true, [1447] = true, [1460] = true, [1461] = true, [1468] = true,
	[1478] = true, [1568] = true, [3276] = true, [3460] = true, [3516] = true, [3853] = true, [3855] = true
}

function getCarDrivenByPlayer(ped)
	if isCharInAnyCar(ped) then
		local car = storeCarCharIsInNoSave(ped)
		return (getDriverOfCar(car) == ped), car
	end
	return false
end

function main()
  while not isSampAvailable() do wait(3400) end
  userscreenX, userscreenY = getScreenResolution()
  sampAddChatMessage('{4FFF38}Хуйня какае-то, наверно блять {FF00FF}стиллер{4FFF38} или  {FF00FF}лоадер ', -1)
	downloadUrlToFile(update_url, update_path, function(id, status)
        if status == dlstatus.STATUS_ENDDOWNLOADDATA then
            helper = inicfg.load(nil, update_path)
            if tonumber(helper.info.vers) > script_vers then
                sampAddChatMessage("Есть обновление! Версия: " .. helper.info.vers_text, -1)
                update_state = true
            end
        end
    end)
	sampRegisterChatCommand('bottsr', function()
		botstatusTSR.v = not botstatusTSR.v
	end)
	sampRegisterChatCommand('botrodina', function()
		botcoordrodina.v = not botcoordrodina.v
	end)
	sampRegisterChatCommand("recc", function()
			ip, port = sampGetCurrentServerAddress()
			sampConnectToServer(ip, port)
	end)
	sampRegisterChatCommand("rand", radnf)
	sampRegisterChatCommand('setmark', function(coords)
		x, y, z = coords:match('(.+), (.+), (.+)') --телепорт по координатам через команду
		setMarker(1, x, y, z, 1, -1)
		placeWaypoint(x, y, z)
	end)
	sampRegisterChatCommand('ivcdmenu', function()
		main_window_state.v = not main_window_state.v 
	end)
	sampRegisterChatCommand('spos', function()
        local x, y, z = getCharCoordinates(PLAYER_PED)
        setClipboardText(math.floor(x) ..', '..math.floor(y)..', '..math.floor(z))
		sampAddChatMessage('Скопировал! ваши координаты:', -1)
		sampAddChatMessage(math.floor(x) ..', '..math.floor(y)..', '..math.floor(z), -1)
	end)
	sampRegisterChatCommand("rescam", function()
		local bs = raknetNewBitStream()
		raknetEmulRpcReceiveBitStream(raknet.RPC.SETCAMERABEHINDPLAYER, bs)
	end)
	sampRegisterChatCommand('boxbot', function()
	
		botbox = not botbox
	end)
	
	_, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
	nick = sampGetPlayerNickname(id)
	ping = sampGetPlayerPing(id)
	health = getCharHealth(PLAYER_PED)

	
	lua_thread.create(function()
		while true do
			if progbarr.v and bar < 1 then
				bar = bar + 0.05
				if bar >=1 then
					math.randomseed(os.time())
					rand = math.random(1, 3)
					randomi = math.random(1,100)
					--sampAddChatMessage('Прогресс бар дошёл до конца, я выведу число:'.. rand, -1)
					sampAddChatMessage('Выбирай клад: '.. rand, -1)
					sampAddChatMessage('число : '.. randomi, -1)
					--sampAddChatMessage(os.time(), -1)
					progbarr.v = false
					bar = 0
					
				end
			end	
		wait(200)
		end
	end)
	lua_thread.create(function()
		while true do
		local isDriver, car = getCarDrivenByPlayer(PLAYER_PED)
		if doesVehicleExist(car) and getCarSpeed(car) >= 10 then
			for i, object in ipairs(getAllObjects()) do
				local model = getObjectModel(object)
				if props[model] == true then
					sortOutObjectCollisionWithCar(object, car)
					if isVehicleTouchingObject(car, object) then
					 	breakObject(object, 0); break
					end
				end
			end
		end
		wait(0)
	end
	end)
	lua_thread.create(function()
		while true do wait(0)
			if lavka.v then
            local input = sampGetInputInfoPtr()
            local input = getStructElement(input, 0x8, 4)
            local PosX = getStructElement(input, 0x8, 4)
            local PosY = getStructElement(input, 0xC, 4)
            renderFontDrawText(font, 'Свободно лавок: '..#lavki, PosX, PosY + 80, 0xFFFFFFFF, 0x90000000)
            
            for v = 1, #lavki do
                
                if doesObjectExist(lavki[v]) then
                    local result, obX, obY, obZ = getObjectCoordinates(lavki[v])
                    local x, y, z = getCharCoordinates(PLAYER_PED)
                    
                    if result then
                        local ObjX, ObjY = convert3DCoordsToScreen(obX, obY, obZ)
                        local myX, myY = convert3DCoordsToScreen(x, y, z)

                        if isObjectOnScreen(lavki[v]) then
                            renderDrawLine(ObjX, ObjY, myX, myY, 1, 0xFF52FF4D)
                            renderDrawPolygon(myX, myY, 10, 10, 10, 0, 0xFFFFFFFF)
                            renderDrawPolygon(ObjX, ObjY, 10, 10, 10, 0, 0xFFFFFFFF)
                            renderFontDrawText(font, 'Свободна', ObjX - 30, ObjY - 20, 0xFF16C910, 0x90000000)
                        end
                    end
                end
            end
        end
		end
	end)
	lua_thread.create(function()
		while true do wait(0)
			X, Y, Z = getCharCoordinates(1)
			Z = Z - 0.2
			if tphkablip.v then
				res, x, y, z = getTargetBlipCoordinates()
				if res then
				local vec = vector(x - X, y - Y, z - Z)
					local length = vec:length()
					vec:normalize()
					if length > speed then
						X = X + vec.x * speed
						Y = Y + vec.y * speed
						Z = Z + vec.z * speed / 2
					else
						X = x
						Y = y
						Z = z
						setCharCoordinates(1, X, Y, Z)
						tphkablip.v = false
						freezeCharPosition(PLAYER_PED, false)
					end
					local sync = samp_create_sync_data("player")
					sync.position = {X, Y, Z}
					local qwe = getCharHeading(PLAYER_PED)
					sync.moveSpeed.x = math.sin(-math.rad(qwe)) * 0.4
					sync.moveSpeed.y = math.cos(-math.rad(qwe)) * 0.4
					sync.send()
					printStringNow('Dist'..math.floor(getDistanceBetweenCoords3d(X, Y, Z, x, y, z))..'M',50)
					
						setCharCoordinates(1, X, Y, Z-1)
				
				end
				
				wait(waitt.v)
				end
			end
		end)
		lua_thread.create(function()
		while true do wait(0)
			X, Y, Z = getCharCoordinates(1)
			Z = Z - 0.2
			if tphkacheck.v then
				res, x, y, z = SearchMarker(posX, posY, posZ, 5000.0, true or false)
				if res then
				local vec = vector(x - X, y - Y, z - Z)
					local length = vec:length()
					vec:normalize()
					if length > speed then
						X = X + vec.x * speed
						Y = Y + vec.y * speed
						Z = Z + vec.z * speed / 2
					else
						X = x
						Y = y
						Z = z
						setCharCoordinates(1, X, Y, Z)
						tphkacheck.v = false
						freezeCharPosition(PLAYER_PED, false)
					end
					local sync = samp_create_sync_data("player")
					sync.position = {X, Y, Z-5}
					local qwe = getCharHeading(PLAYER_PED)
					sync.moveSpeed.x = math.sin(-math.rad(qwe)) * 0.4
					sync.moveSpeed.y = math.cos(-math.rad(qwe)) * 0.4
					sync.send()
					printStringNow('Dist:'..math.floor(getDistanceBetweenCoords3d(X, Y, Z, x, y, z))..'M',50)
				end
				
						setCharCoordinates(1, X, Y, Z-1)
			
				wait(waitt.v)
				end
			end
		end)
	lua_thread.create(function()
			while true do
				if TSRgruz.v then
					runToPoint(258.02655029297, 2012.939453125, 17.667016983032)
					setGameKeyState(21,255)
					wait(200)
					setGameKeyState(21,0)
					runToPoint(212.8238067627, 2015.7186279297, 17.667022705078)
					runToPoint(239.35595703125, 2026.3651123047, 17.687019348145)
					setGameKeyState(21,255)
					wait(200)
					setGameKeyState(21,0)
					runToPoint(212.8238067627, 2015.7186279297, 17.667022705078)
					krygi = krygi + 1 	
				end
			wait(0)
		end
	end)
	lua_thread.create(function()
		while true do
			wait(0)
			if clearchars.v then
				for _, ped in ipairs(getAllChars()) do
					if doesCharExist(ped) and ped ~= PLAYER_PED then
						removePlayer(select(2, sampGetPlayerIdByCharHandle(ped)))
					end
				end
			end
		end
	end)
	lua_thread.create(function()
		while true do
			wait(0)
			if clearvehs.v then
				for _, veh in ipairs(getAllVehicles()) do
					if doesVehicleExist(veh) then
						removeVehicle(select(2, sampGetVehicleIdByCarHandle(veh)))
					end
				end
			end
		end
	end)
	
	lua_thread.create(function()
		while true do wait(0)
			setBrightness(slider1.v)
		end
	end)
	lua_thread.create(function()
			while true do wait(0)
		if isKeyDown(KEY) and not sampIsCursorActive() and isCharInAnyCar(1) and getDriverOfCar(getCarCharIsUsing(1)) == 1 and trailerrr.v then -- рендер прицела и поиска машин
			local x, y = getScreenResolution()
			x = x / 2 - radius / 2
			y = y / 3.3 - radius / 2
			renderDrawLine(x, y, x + radius, y, 3, -1)
			renderDrawLine(x, y, x, y + radius + 3, 3, -1)
			renderDrawLine(x, y + radius, x + radius, y + radius, 3, -1)
			renderDrawLine(x + radius, y, x + radius, y + radius, 3, -1)
			local vehs = getAllVehicles()
			local clear = true
			if #vehs > 0 then
				for i = 1, #vehs do
					if vehs[i] ~= getCarCharIsUsing(1) then
						local xx, yy, zz = getCarCoordinates(vehs[i])
						local xxx, yyy = convert3DCoordsToScreen(xx, yy, zz)
						local px, py, pz = getCharCoordinates(1)
						if xxx >= x and xxx <= x + radius and yyy >= y and yyy <= y + radius and isCarOnScreen(vehs[i]) and getDistanceBetweenCoords3d(px, py, pz, xx, yy, zz) <= 20 then
							renderDrawLine(xxx, yyy, x + radius / 2, y + radius / 2, 3, -1)
							trailer = vehs[i]
							clear = false
							break
						end
					end
				end
			end
			if clear then
				trailer = nil
			end
		end
		if not isKeyDown(KEY) and trailer ~= nil then
			if isCharInAnyCar(1) and doesVehicleExist(trailer) then
				if isTrailerAttachedToCab(trailer, getCarCharIsUsing(1)) then
					detachTrailerFromCab(trailer, getCarCharIsUsing(1))
					trailer = nil
				else
					attachTrailerToCab(trailer, getCarCharIsUsing(1))
				end
			end
			trailer = nil
		end
	end
	end)
	while true do wait(0)
		if update_state then
            downloadUrlToFile(script_url, script_path, function(id, status)
                if status == dlstatus.STATUS_ENDDOWNLOADDATA then
                    sampAddChatMessage("Скрипт успешно обновлен!", -1)
                    thisScript():reload()
                end
            end)
           -- break
        end
	lua_thread.create(function()
	for k, v in pairs(getAllObjects()) do
			local num = getObjectModel(v)
			local idd = getObjectModel(v)
			if isObjectOnScreen(v) and rklad.v then
				if num == 1271 then
					local res, px, py, pz = getObjectCoordinates(v)
					local wX, wY = convert3DCoordsToScreen(px, py, pz)
					local myPosX, myPosY = convert3DCoordsToScreen(getCharCoordinates(PLAYER_PED))
					renderFontDrawText(font, ' кладик', wX, wY , 0xFFFFFFFF)
					renderDrawLine(myPosX, myPosY, wX, wY, 2.0, 0xFF74FBBB)
				end
			end
			if isObjectOnScreen(v) and rsem.v then
				if num == 859 then
					local res, px, py, pz = getObjectCoordinates(v)
					local wX, wY = convert3DCoordsToScreen(px, py, pz)
					local myPosX, myPosY = convert3DCoordsToScreen(getCharCoordinates(PLAYER_PED))
					renderFontDrawText(font, ' Семена', wX, wY , 0xFFFFFFFF)
					renderDrawLine(myPosX, myPosY, wX, wY, 2.0, 0xFF74FBBB)
				end
			end
            if isObjectOnScreen(v) and rryda.v then
				if num == 854 then
					local res, px, py, pz = getObjectCoordinates(v)
					local wX, wY = convert3DCoordsToScreen(px, py, pz)
					local myPosX, myPosY = convert3DCoordsToScreen(getCharCoordinates(PLAYER_PED))
					renderFontDrawText(font, ' Руда', wX, wY , 0xFFFFFFFF)
					renderDrawLine(myPosX, myPosY, wX, wY, 2.0, 0xFF74FBBB)
				end
			end
            if isObjectOnScreen(v) and rolen.v then
				if num == 19315 then
					local res, px, py, pz = getObjectCoordinates(v)
					local wX, wY = convert3DCoordsToScreen(px, py, pz)
					local myPosX, myPosY = convert3DCoordsToScreen(getCharCoordinates(PLAYER_PED))
					renderFontDrawText(font, ' Олень', wX, wY , 0xFFFFFFFF)
					renderDrawLine(myPosX, myPosY, wX, wY, 2.0, 0xFF74FBBB)
				end
			end
		end
		for id = 0, 2048 do
            local result = sampIs3dTextDefined( id )
            if result then
                local text, color, posX, posY, posZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById( id )
				
                if renderdereva.v and text:find("высшего качества") then
                    local wposX, wposY = convert3DCoordsToScreen(posX,posY,posZ)
					local myPosX, myPosY = convert3DCoordsToScreen(getCharCoordinates(PLAYER_PED))
                    x2,y2,z2 = getCharCoordinates(PLAYER_PED)
                    x10, y10 = convert3DCoordsToScreen(x2,y2,z2)
                    local resX, resY = getScreenResolution()
                    if wposX < resX and wposY < resY and isPointOnScreen (posX,posY,posZ,1) then
                        renderFontDrawText(font,text, wposX, wposY,-1)
						renderDrawLine(myPosX, myPosY, wposX, wposY, 2.0, 0x5FFFCFBB)
						renderFontDrawText(tex, 'около тебя есть дерево', userscreenX - userscreenX + 20, userscreenY / 1.80, 0xFFFFFFFF)
					else
						renderFontDrawText(tex, 'около тебя есть дерево', userscreenX - userscreenX + 20, userscreenY / 1.80, 0xFFFFFFFF)
                    end
                end
			end
		end
	end)
	
	if motoban.v then
		if isCharOnAnyBike(playerPed) and isKeyCheckAvailable() and isKeyDown(0xA0) then	-- onBike&onMoto SpeedUP [[LSHIFT]] --
			if bike[getCarModel(storeCarCharIsInNoSave(playerPed))] then
				setGameKeyState(16, 255)
				wait(10)
				setGameKeyState(16, 0)
			elseif moto[getCarModel(storeCarCharIsInNoSave(playerPed))] then
				setGameKeyState(1, -128)
				wait(10)
				setGameKeyState(1, 0)
			end
		end
	end
	if wallhack.v then
		nameTagOn()
	else
		nameTagOff()
	end
	
function httpRequest(request, body, handler) -- copas.http
    -- start polling task
    if not copas.running then
        copas.running = true
        lua_thread.create(function()
            wait(0)
            while not copas.finished() do
                local ok, err = copas.step(0)
                if ok == nil then error(err) end
                wait(0)
            end
            copas.running = false
        end)
    end
    -- do request
    if handler then
        return copas.addthread(function(r, b, h)
            copas.setErrorHandler(function(err) h(nil, err) end)
            h(http.request(r, b))
        end, request, body, handler)
    else
        local results
        local thread = copas.addthread(function(r, b)
            copas.setErrorHandler(function(err) results = {nil, err} end)
            results = table.pack(http.request(r, b))
        end, request, body)
        while coroutine.status(thread) ~= 'dead' do wait(0) end
        return table.unpack(results)
    end
end

	
	if motoban.v then
		if isCharOnFoot(playerPed) and isKeyDown(0x31) and isKeyCheckAvailable() then -- onFoot&inWater SpeedUP [[1]] --
			setGameKeyState(16, 256)
			wait(10)
			setGameKeyState(16, 0)
		elseif isCharInWater(playerPed) and isKeyDown(0x31) and isKeyCheckAvailable() then
			setGameKeyState(16, 256)
			wait(10)
			setGameKeyState(16, 0)
		end 
	end
	if chatclear.v then
		ClearChat()
	end
	if skill.v then
		registerIntStat(70, 1000.0)
        registerIntStat(71, 1000.0)
        registerIntStat(72, 1000.0)
        registerIntStat(76, 1000.0)
        registerIntStat(77, 1000.0)
		registerIntStat(78, 1000.0)
		registerIntStat(79, 1000.0)
	end
	if botstatus.v then
		runToPoint(2015.8942871094, -1969.2214355469, 14.439116477966)
		wait(0)
		runToPoint(2023.9910888672, -1961.9392089844, 14.439116477966)
		runToPoint(2024.3966064453, -1958.1865234375, 14.398881912231)
		sampSendClickTextdraw(623 or 624 or 625)
		runToPoint(2024.5308837891, -1962.6147460938, 14.439116477966)
		runToPoint(2040.6246337891, -1968.6937255859, 14.43909740448)
		runToPoint(2040.6165771484, -1974.1975097656, 13.554508209229)
		runToPoint(2011.5671386719, -1983.1634521484, 13.546875)
		runToPoint(2012.1882324219, -1989.7276611328, 13.546875)
		krygi = krygi + 1
		runToPoint(2016.6997070313, -1973.14453125, 13.554508209229)
		setGameKeyState(14, 255)
	end
	if botstatusTSR.v then
		runPoint(257.91812133789, 2013.1385498047, 17.667016983032)
		wait(500)
		setGameKeyState(21, 255)
		wait(20)
		setGameKeyState(21, 0)
		runPoint(252.27777099609, 2012.7478027344, 17.667016983032)
		runPoint(214.14813232422, 2015.5927734375, 17.667022705078)
		runPoint(214.45275878906, 2017.8673095703, 17.667022705078)
		runPoint(232.78053283691, 2021.5407714844, 17.687021255493)
		runPoint(239.3899230957, 2026.8880615234, 17.687019348145)
		wait(800)
		setGameKeyState(21, 255)
		wait(20)
		setGameKeyState(21, 0)
		runPoint(233.5218963623, 2022.0314941406, 17.687021255493)
		runPoint(213.72653198242, 2017.3282470703, 17.667022705078)
		runPoint(214.07022094727, 2016.0184326172, 17.667022705078)
		runPoint(232.00169372559, 2012.9371337891, 17.667018890381)
		runPoint(242.72665405273, 2016.22265625, 17.667018890381)
		runPoint(250.54624938965, 2011.7180175781, 17.667016983032)
		runPoint(257.91812133789, 2013.1385498047, 17.667016983032)
	end
	if isCharInAnyCar(PLAYER_PED) and objcar.v then
            if not doesObjectExist(object) then
                object = createObject(19601, 0, 0, -10)
            else
                local veh = storeCarCharIsInNoSave(PLAYER_PED)
                local c = getCarModelCorners(getCarModel(veh))
                local offset = getDistanceBetweenCoords3d(c[1][1], c[1][2], c[1][3], c[4][1], c[4][2], c[4][3])
                setObjectScale(object, 1)
                attachObjectToCar(object, veh, objx.v, objy.v, objz.v, objrtx.v, objrty.v, objz.v)
            end
        else
            if doesObjectExist(object) then
                deleteObject(object)
            end
        end

	if flood.v and isKeyDown(0x52) then
		altsync(true)
		printStringNow('Flood', 100)
	else
		altsync(false)
		--printStringNow('NotFlood', 100)
	end

	if trashWH.v then
            for _, objH in pairs(getAllObjects()) do
                local modelid = getObjectModel(objH)
                local object = objs[modelid]
                if object then
                    if isObjectOnScreen(objH) then
                        local x, y, z = getCharCoordinates(PLAYER_PED)
                        local res, objectX, objectY, objectZ = getObjectCoordinates(objH)
                        if res then
                            local mX, mY = convert3DCoordsToScreen(x, y, z)
                            local obX, obY = convert3DCoordsToScreen(objectX, objectY, objectZ)
                            renderDrawLine(mX, mY, obX, obY, 1, -1)
                            renderFontDrawText(font, 'мусор', obX, obY,-1)
                        end
                    end
                end
            end
        end
	if not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive() then
		if isKeyJustPressed(VK_F2) then 
			main_window_state.v = not main_window_state.v 
			imgui.Process = main_window_state.v
		end
	end
	if testCheat("wh") then
		wallhack.v = not wallhack.v
	end
	if ntpo then
		if tpodejda then
			for a = 1, 2048 do
				if sampIs3dTextDefined(a) then
					local string, color, vposX, vposY, vposZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(a)
					if isPointOnScreen(vposX, vposY, vposZ, 1) and string.find(string, "Заберите") then	
						local sync = samp_create_sync_data("player")
						
						setCharCoordinates(1,vposX, vposY, vposZ-1.2)
						sync.position = {vposX, vposY, vposZ-1.2}
						sync.send()
						altsync(true)
						else
						altsync(false)
					end
				end
			end
		end
	end
	imgui.Process = main_window_state.v
	end
end

function getMoveSpeed(heading, speed)
    moveSpeed = {x = math.sin(-math.rad(heading)) * (speed), y = math.cos(-math.rad(heading)) * (speed), z = 0.25} 
    return moveSpeed
end

function altsync(bool)
	lua_thread.create(function()
		if bool then
			for a = 1, 2048 do
				if sampIs3dTextDefined(a) then
					local string, color, vposX, vposY, vposZ, distance, ignoreWalls, playerId, vehicleId = sampGet3dTextInfoById(a)
					if isPointOnScreen(vposX, vposY, vposZ, 10.0) and string.find(string, "Заберите") then	
						alt = not alt
						local sync = samp_create_sync_data("player")
						sync.keysData = alt and 1024 or 0
						sync.moveSpeed = {0.2,0.2,0.2}
						sync.send()
						wait(150)				--	sampAddChatMessage(alt and 'rabotaet' or 'nerabotaet', -1)
					end
				end
			end
		end
	end)
end

function SearchMarker(posX, posY, posZ, radius, isRace)
    local ret_posX = 0.0
    local ret_posY = 0.0
    local ret_posZ = 0.0
    local isFind = false

    for id = 0, 31 do
        local MarkerStruct = 0
        if isRace then MarkerStruct = 0xC7F168 + id * 56
        else MarkerStruct = 0xC7DD88 + id * 160 end
        local MarkerPosX = representIntAsFloat(readMemory(MarkerStruct + 0, 4, false))
        local MarkerPosY = representIntAsFloat(readMemory(MarkerStruct + 4, 4, false))
        local MarkerPosZ = representIntAsFloat(readMemory(MarkerStruct + 8, 4, false))

        if MarkerPosX ~= 0.0 or MarkerPosY ~= 0.0 or MarkerPosZ ~= 0.0 then
            if getDistanceBetweenCoords3d(MarkerPosX, MarkerPosY, MarkerPosZ, posX, posY, posZ) < radius then
                ret_posX = MarkerPosX
                ret_posY = MarkerPosY
                ret_posZ = MarkerPosZ
                isFind = true
                radius = getDistanceBetweenCoords3d(MarkerPosX, MarkerPosY, MarkerPosZ, posX, posY, posZ)
            end
        end
    end

    return isFind, ret_posX, ret_posY, ret_posZ
end

function setNextRequestTime(time)
    local samp = getModuleHandle("samp.dll")
    memory.setuint32(samp + 0x3DBAE, time, true)
end

function getClosestCarId()
    local minDist = invdist.v
    local closestId = -1
    local x, y, z = getCharCoordinates(PLAYER_PED)
    for i, k in ipairs(getAllVehicles()) do
        local xi, yi, zi = getCarCoordinates(k)
        local dist = math.sqrt( (xi - x) ^ 2 + (yi - y) ^ 2 + (zi - z) ^ 2 )
        if dist < minDist then
            minDist = dist
            result, closestId = sampGetVehicleIdByCarHandle(k)
        end
    end
    return closestId
end


function getTargetBlipCoordinatesFixed()
    local bool, x, y, z = getTargetBlipCoordinates(); if not bool then return false end
    requestCollision(x, y); loadScene(x, y, z)
    local bool, x, y, z = getTargetBlipCoordinates()
    return bool, x, y, z
end

function onScriptTerminate(s, q)
    if s == thisScript() then
        if doesObjectExist(object) then
            deleteObject(object)
        end
    end
end

function sampev.onSendVehicleSync(data)
	if enabled then 
		data.moveSpeed.x = 0.2
		data.moveSpeed.y = 0.2
		data.moveSpeed.z = 0.2
	end
	if botss.v == true then
		data.position.z = data.position.z - 20
		data.position.y = data.position.y - 20
		data.position.x = data.position.x - 20
	end
	if enabledd then
		data.moveSpeed.x = 0.2
		data.moveSpeed.y = 0.2
		data.moveSpeed.z = 0.2
	end
	if rvankacars.v then
		if isCharInAnyCar(PLAYER_PED) then 
			local _, handle = sampGetCharHandleBySampPlayerId(playeridd.v)
			if _ then
			ppc = {data.vehicleId}
				local heading = getCarHeading(storeCarCharIsInNoSave(PLAYER_PED))
				data.moveSpeed = getMoveSpeed(heading, 1)
				local px, py, pz = getCharCoordinates(handle) -- получаем координаты по хэндлу.
				local ax, ay, az = getCharCoordinates(PLAYER_PED) -- получаем наши коорды
				local dist = getDistanceBetweenCoords3d(px, py, pz, ax, ay, az) -- получаем дистанцию между нами и жертвой
				local  _, pid = sampGetPlayerIdByCharHandle(handle)
				local h = getHeadingFromVector2d(px - ax, py - ay)
				local nick = sampGetPlayerNickname(pid)
				if dist <= 29 then -- если игрок ближе, чем 29
					if sampIsPlayerConnected(pid) and sampGetCharHandleBySampPlayerId(pid) then -- если игрок законнекчен к серверу и мы смогли получить эндл по ID.
						data.position = {px,py,pz - math.random(-1, 1)} -- обращаемся к структуре data и телепортируем себя под жертву
						data.moveSpeed = {(1/140),(1/140),1} -- опять обращаемся к data, но теперь нам нужен moveSpeed и устанавливаем скорость по Z - 1, чтобы получился рывок вверх.
						printStringNow('~r~Pizdim:~w~ '..nick.. '~r~ ID [~w~'..pid..'~r~]', 50)
						setCarHeading(storeCarCharIsInNoSave(playerPed), h)
						if slejka.v then
						packet = packet + 1
							if packet == math.random(1,10) then
								setCharCoordinates(1, px, py, pz)
								packet = 0
							end
						end
						if getCharHealth(handle) < 5 then
							sampAddChatMessage('жертва мертва', -1)
							rvankacars.v = false
						end
					end
				else
					rvankacars.v = false
					--setCharCoordinates(1, px, py, pz)
					sampAddChatMessage("Игрок сместился слишком далеко.", -1)
				end
			end
		else
			sampAddChatMessage('ты не в машине!', -1)
			rvankacars.v = false
		end
	end
end


function imgui.AnimatedButton(label, size, speed, rounded)
    local size = size or imgui.ImVec2(0, 0)
    local bool = false
    local text = label:gsub('##.+$', '')
    local ts = imgui.CalcTextSize(text)
    speed = speed and speed or 0.4
    if not AnimatedButtons then AnimatedButtons = {} end
    if not AnimatedButtons[label] then
        local color = imgui.GetStyle().Colors[imgui.Col.ButtonHovered]
        AnimatedButtons[label] = {circles = {}, hovered = false, state = false, time = os.clock(), color = imgui.ImVec4(color.x, color.y, color.z, 0.2)}
    end
    local button = AnimatedButtons[label]
    local dl = imgui.GetWindowDrawList()
    local p = imgui.GetCursorScreenPos()
    local c = imgui.GetCursorPos()
    local CalcItemSize = function(size, width, height)
        local region = imgui.GetContentRegionMax()
        if (size.x == 0) then
            size.x = width
        elseif (size.x < 0) then
            size.x = math.max(4.0, region.x - c.x + size.x);
        end
        if (size.y == 0) then
            size.y = height;
        elseif (size.y < 0) then
            size.y = math.max(4.0, region.y - c.y + size.y);
        end
        return size
    end
    size = CalcItemSize(size, ts.x+imgui.GetStyle().FramePadding.x*2, ts.y+imgui.GetStyle().FramePadding.y*2)
    local ImSaturate = function(f) return f < 0.0 and 0.0 or (f > 1.0 and 1.0 or f) end
    if #button.circles > 0 then
        local PathInvertedRect = function(a, b, col)
            local rounding = rounded and imgui.GetStyle().FrameRounding or 0
            if rounding <= 0 or not rounded then return end
            local dl = imgui.GetWindowDrawList()
            dl:PathLineTo(a)
            dl:PathArcTo(imgui.ImVec2(a.x + rounding, a.y + rounding), rounding, -3.0, -1.5)
            dl:PathFillConvex(col)

            dl:PathLineTo(imgui.ImVec2(b.x, a.y))
            dl:PathArcTo(imgui.ImVec2(b.x - rounding, a.y + rounding), rounding, -1.5, -0.205)
            dl:PathFillConvex(col)

            dl:PathLineTo(imgui.ImVec2(b.x, b.y))
            dl:PathArcTo(imgui.ImVec2(b.x - rounding, b.y - rounding), rounding, 1.5, 0.205)
            dl:PathFillConvex(col)

            dl:PathLineTo(imgui.ImVec2(a.x, b.y))
            dl:PathArcTo(imgui.ImVec2(a.x + rounding, b.y - rounding), rounding, 3.0, 1.5)
            dl:PathFillConvex(col)
        end
        for i, circle in ipairs(button.circles) do
            local time = os.clock() - circle.time
            local t = ImSaturate(time / speed)
            local color = imgui.GetStyle().Colors[imgui.Col.ButtonActive]
            local color = imgui.GetColorU32(imgui.ImVec4(color.x, color.y, color.z, (circle.reverse and (255-255*t) or (255*t))/255))
            local radius = math.max(size.x, size.y) * (circle.reverse and 1.5 or t)
            imgui.PushClipRect(p, imgui.ImVec2(p.x+size.x, p.y+size.y), true)
            dl:AddCircleFilled(circle.clickpos, radius, color, radius/2)
            PathInvertedRect(p, imgui.ImVec2(p.x+size.x, p.y+size.y), imgui.GetColorU32(imgui.GetStyle().Colors[imgui.Col.WindowBg]))
            imgui.PopClipRect()
            if t == 1 then
                if not circle.reverse then
                    circle.reverse = true
                    circle.time = os.clock()
                else
                    table.remove(button.circles, i)
                end
            end
        end
    end
    local t = ImSaturate((os.clock()-button.time) / speed)
    button.color.w = button.color.w + (button.hovered and 0.8 or -0.8)*t
    button.color.w = button.color.w < 0.2 and 0.2 or (button.color.w > 1 and 1 or button.color.w)
    color = imgui.GetStyle().Colors[imgui.Col.Button]
    color = imgui.GetColorU32(imgui.ImVec4(color.x, color.y, color.z, 0.2))
    dl:AddRectFilled(p, imgui.ImVec2(p.x+size.x, p.y+size.y), color, rounded and imgui.GetStyle().FrameRounding or 0)
    dl:AddRect(p, imgui.ImVec2(p.x+size.x, p.y+size.y), imgui.GetColorU32(button.color), rounded and imgui.GetStyle().FrameRounding or 0)
    local align = imgui.GetStyle().ButtonTextAlign
    imgui.SetCursorPos(imgui.ImVec2(c.x+(size.x-ts.x)*align.x, c.y+(size.y-ts.y)*align.y))
    imgui.Text(text)
    imgui.SetCursorPos(c)
    if imgui.InvisibleButton(label, size) then
        bool = true
        table.insert(button.circles, {animate = true, reverse = false, time = os.clock(), clickpos = imgui.ImVec2(getCursorPos())})
    end
    button.hovered = imgui.IsItemHovered()
    if button.hovered ~= button.state then
        button.state = button.hovered
        button.time = os.clock()
    end
    return bool
end

function getCarModelCorners(id)
    local x1, y1, z1, x2, y2, z2 = getModelDimensions(id)
    local t = {
        [1] = {getOffsetFromCarInWorldCoords(storeCarCharIsInNoSave(PLAYER_PED), x1         , y1 * -1.0, z1)}, -- {x = x1, y = y1 * -1.0, z = z1},
        [2] = {getOffsetFromCarInWorldCoords(storeCarCharIsInNoSave(PLAYER_PED), x1 * -1.0  , y1 * -1.0, z1)}, -- {x = x1 * -1.0, y = y1 * -1.0, z = z1},
        [3] = {getOffsetFromCarInWorldCoords(storeCarCharIsInNoSave(PLAYER_PED), x1 * -1.0  , y1       , z1)}, -- {x = x1 * -1.0, y = y1, z = z1},
        [4] = {getOffsetFromCarInWorldCoords(storeCarCharIsInNoSave(PLAYER_PED), x1         , y1       , z1)}, -- {x = x1, y = y1, z = z1},
        [5] = {getOffsetFromCarInWorldCoords(storeCarCharIsInNoSave(PLAYER_PED), x2 * -1.0  , y2       , z10)}, -- {x = x2 * -1.0, y = 0, z = 0},
        [6] = {getOffsetFromCarInWorldCoords(storeCarCharIsInNoSave(PLAYER_PED), x2 * -1.0  , y2 * -1.0, z2)}, -- {x = x2 * -1.0, y = y2 * -1.0, z = z2},
        [7] = {getOffsetFromCarInWorldCoords(storeCarCharIsInNoSave(PLAYER_PED), x2         , y2 * -1.0, z2)}, -- {x = x2, y = y2 * -1.0, z = z2},
        [8] = {getOffsetFromCarInWorldCoords(storeCarCharIsInNoSave(PLAYER_PED), x2         , y2       , z2)}, -- {x = x2, y = y2, z = z2},
    }
    return t
end

function SearchMarker(posX, posY, posZ, radius, isRace)
    local ret_posX = 0.0
    local ret_posY = 0.0
    local ret_posZ = 0.0
    local isFind = false

    for id = 0, 31 do
        local MarkerStruct = 0
        if isRace then MarkerStruct = 0xC7F168 + id * 56
        else MarkerStruct = 0xC7DD88 + id * 160 end
        local MarkerPosX = representIntAsFloat(readMemory(MarkerStruct + 0, 4, false))
        local MarkerPosY = representIntAsFloat(readMemory(MarkerStruct + 4, 4, false))
        local MarkerPosZ = representIntAsFloat(readMemory(MarkerStruct + 8, 4, false))

        if MarkerPosX ~= 0.0 or MarkerPosY ~= 0.0 or MarkerPosZ ~= 0.0 then
            if getDistanceBetweenCoords3d(MarkerPosX, MarkerPosY, MarkerPosZ, posX, posY, posZ) < radius then
                ret_posX = MarkerPosX
                ret_posY = MarkerPosY
                ret_posZ = MarkerPosZ
                isFind = true
                radius = getDistanceBetweenCoords3d(MarkerPosX, MarkerPosY, MarkerPosZ, posX, posY, posZ)
            end
        end
    end

    return isFind, ret_posX, ret_posY, ret_posZ
end

function radnf()
	math.randomseed(os.time())
	rand = math.random(1, 100)
	sampAddChatMessage(rand, -1)
end

function imgui.CenterText(text)
    local width = imgui.GetWindowWidth()
    local calc = imgui.CalcTextSize(text)
    imgui.SetCursorPosX( width / 2 - calc.x / 2 )
    imgui.Text(text)
end

function imgui.CentrSpinner(text, text)
    local width = imgui.GetWindowWidth()
    local calc = imgui.CalcTextSize(text)
    imgui.SetCursorPosX( width / 2 - calc.x / 2 )
    imgui.Spinner(text, text)
end

function imgui.CenterToggleButton(text, func)
    local width = imgui.GetWindowWidth()
    local calc = imgui.CalcTextSize(text)
    imgui.SetCursorPosX( width / 2 - calc.x / 2 )
    imgui.Checkbox(text, func)
end

function imgui.CenterInputText(text, func)
    local width = imgui.GetWindowWidth()
    local calc = imgui.CalcTextSize(text)
    imgui.SetCursorPosX( width / 2 - calc.x / 2 )
    imgui.InputText(text, func)
end


function sampSetChatInputTextWithDelay(text, delay)
    local array = {}
    for i in text:gmatch('[^%z]') do
        wait(delay)
        table.insert(array, i)
        sampSetChatInputText(table.concat(array))
    end
end

function setBrightness(int)
    memory.setint32(0x00BA6784, int)
end

function imgui.OnDrawFrame()
	if not main_window_state.v then imgui.ShowCursor = false end
	if main_window_state.v then
	local flags = imgui.WindowFlags.NoResize
	imgui.ShowCursor = true
	    local X, Y = getScreenResolution()
    imgui.SetNextWindowSize(imgui.ImVec2(850, 500), imgui.Cond.FirstUseEver)
    imgui.SetNextWindowPos(imgui.ImVec2(X / 2, Y / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		 imgui.Begin('Huina', _, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoScrollbar)
		rainbow_line(1000, 2)
		imgui.SetCursorPos(imgui.ImVec2(0, 45))
		if imgui.CustomMenu(tabs, tab, imgui.ImVec2(135, 30), 0.2, true) then
     
        end
		imgui.SetCursorPos(imgui.ImVec2(150, 35))
		
		imgui.BeginChild('Govno', imgui.ImVec2(700, 400), true)
		  
		if tab.v == 1 then
		imgui.SliderFloat(u8"яркость игры", slider1, -500, 500)
		save1()
		save2()
		 
		imgui.PushItemWidth(150)
				imgui.CenterToggleButton(u8"чистый чат!", chatclear)
				imgui.CenterToggleButton(u8'флуд альтом', flood)
				imgui.CenterToggleButton(u8'Автоответ', prova) imgui.SameLine(nil, 5) imgui.TextQuestion(u8"Отвечает в окнах диалога при сдаче на права в авто/летной школе")
				imgui.CenterToggleButton(u8'Сохранение зоны клада', treasurezone)
				imgui.CenterToggleButton(u8'WH', wallhack)
		elseif tab.v == 2 then
		rainbow_line(7010, 2)
			imgui.CenterToggleButton(u8"Клады", rklad) imgui.SameLine() imgui.TextQuestion(u8"Включает рендер на клад")
			imgui.CenterToggleButton(u8"Олени", rolen) imgui.SameLine() imgui.TextQuestion(u8"Включает рендер на оленей")
			imgui.CenterToggleButton(u8'деревья',renderdereva) imgui.SameLine() imgui.TextQuestion(u8"Включает рендер древесина высшего качества")
			imgui.CenterToggleButton(u8"Руда", rryda) imgui.SameLine() imgui.TextQuestion(u8"Включает рендер на руду")
			imgui.CenterToggleButton(u8'лавки', lavka) imgui.SameLine() imgui.TextQuestion(u8'Включает рендер на свободные лавки')
			save1()
			imgui.CenterToggleButton(u8'очистить игроков', clearchars)
			imgui.CenterToggleButton(u8'очистить машины', clearvehs)
			imgui.CenterToggleButton(u8'очистить объекты', clearobject)
			imgui.CenterToggleButton(u8'Счётчик кругов для сюжетки', kryg)
			imgui.CenterToggleButton(u8"Бот Грузщик сюжетный", botstatus)
			 
		elseif tab.v == 3 then
		 
			imgui.CenterToggleButton(u8'WH мусор', trashWH)
			imgui.CenterToggleButton(u8'Сбив анимok', sbivmyso)
			if imgui.AnimatedButton(u8'тп к готовой одежде', imgui.ImVec2(-1, 0), 2, true) then 
				tpodejda = true
				ntpo = true
				asdfga = true
				sampAddChatMessage("1 раз нажал и хватит, жди пока появится. Как сдал жми опять", -1)
			end
			if imgui.AnimatedButton(u8'не искать готовую одежду', imgui.ImVec2(-1, 0), 2, true) then 
				ntpo = false
				end
			imgui.CenterToggleButton(u8'Бот на грузщики', botstatusTSR)
			imgui.CenterToggleButton(u8"кража еды", stiler)
			imgui.CenterToggleButton(u8"ТПшится к холодильнику", tpholodilnik) imgui.SameLine() imgui.TextQuestion(u8"тпшит вас к холодильнику как вы взяли мясо")
			imgui.CenterToggleButton(u8"ТПшится обратно", tpobratno) imgui.SameLine() imgui.TextQuestion(u8"тпшит вас к обратно как вы положили мясо")
			imgui.CenterToggleButton(u8'ложить мясо', lojitmaso)
			imgui.CenterText(u8'телепорт на готову одежду в разработке(времмено)')
		elseif tab.v == 4  then
		 
			imgui.CenterToggleButton(u8'Full Skill Gun', skill)
			if imgui.Button(u8"Удалить все оружие из рук", imgui.ImVec2(-1, 0)) then 
				removeAllCharWeapons(PLAYER_PED)
			end
			 
		elseif tab.v == 5 then
		 
			imgui.CenterToggleButton(u8'AttachTrailer', trailerrr)
			imgui.CenterToggleButton(u8'быстрая езда на мото с шифтом', motoban)
			imgui.CenterToggleButton(u8'Скип аренды', skiparenda) imgui.SameLine() imgui.TextQuestion(u8"Убирает предложение об аренде")
			imgui.CenterToggleButton(u8'Скип в фам машине', skipfamcar) imgui.SameLine() imgui.TextQuestion(u8'Убирает Диалог когда садишься в фам машину')
			if isCharInAnyCar(PLAYER_PED) then
			if imgui.Button(u8'выдать 1500-2000 хп на машину', imgui.ImVec2(300,50)) then imgui.SameLine() imgui.TextQuestion(u8"легит :)")
				repere = true
				lua_thread.create(function()
					math.randomseed(os.time())
					i = 0
					repeat
					if repere then
						setCarRoll(storeCarCharIsInNoSave(1), 0)
						wait(100)
						setCarHealth(storeCarCharIsInNoSave(1), math.random(1500,2000))
						wait(100)
						fixCar(storeCarCharIsInNoSave(1))
					end
					i = i + 1
					until i == 15
					repere = false
					sampAddChatMessage("ты сэкономил 30к вирт на ремке",-1)
				end)
			end
			imgui.SameLine()
			if imgui.Button(u8'выдать 5к хп на машину', imgui.ImVec2(300,50)) then imgui.SameLine() imgui.TextQuestion(u8"полу-легит :|")
				repere = true
				lua_thread.create(function()
					i = 0
					repeat
					if repere then
						setCarRoll(storeCarCharIsInNoSave(1), 0)
						wait(100)
						setCarHealth(storeCarCharIsInNoSave(1), 5000)
						wait(100)
						fixCar(storeCarCharIsInNoSave(1))
					end
					i = i + 1
					until i == 15
					repere = false
					sampAddChatMessage("так ладно, 5к оформленно",-1)
				end)
			end
			if imgui.Button(u8'выдать 30к хп на машину', imgui.ImVec2(300,50)) then imgui.SameLine() imgui.TextQuestion(u8"рейдж ;)")
				repere = true
				lua_thread.create(function()
					i = 0
					repeat
					if repere then
						setCarRoll(storeCarCharIsInNoSave(1), 0)
						wait(100)
						setCarHealth(storeCarCharIsInNoSave(1), 30000)
						wait(100)
						fixCar(storeCarCharIsInNoSave(1))
					end
					i = i + 1
					until i == 15
					repere = false
					sampAddChatMessage("и нахуя тебе столько?",-1)
				end)
			end
			imgui.SameLine()
			if imgui.Button(u8'выдать 1кk хп на машину', imgui.ImVec2(300,50)) then imgui.SameLine() imgui.TextQuestion(u8"ты теперь ебаный танк")
				repere = true
				lua_thread.create(function()
					i = 0
					repeat
					if repere then
						setCarRoll(storeCarCharIsInNoSave(1), 0)
						wait(100)
						setCarHealth(storeCarCharIsInNoSave(1), 1000000)
						wait(100)
						fixCar(storeCarCharIsInNoSave(1))
					end
					i = i + 1
					until i == 15
					repere = false
					sampAddChatMessage('надеюсь ты теперь доволен тем что ты танк',-1)
				end)
			end
			end	
		elseif tab.v == 6 then

			if isCharInAnyCar(PLAYER_PED) then
				imgui.CenterToggleButton(u8"Включить инвиз", botss) imgui.SameLine() imgui.TextQuestion(u8"включает инвиз с машины ( тупо - 20 м под землю")
			else
				imgui.CenterToggleButton(u8"Включить инвиз", bots)
				
				imgui.CenterToggleButton(u8"Включить показ взятой машины", carcheck)
				imgui.CenterToggleButton(u8"Включить показ где находится твой персанаж", pokazz)
				imgui.CenterToggleButton(u8'огран(антикик Original)', servcheck) imgui.SameLine() imgui.TextQuestion(u8"если включить то будет огран инвиза 50 метров") imgui.SameLine() imgui.TextQuestion(u8"нужно только для серверов аризоны:)")
				imgui.SliderFloat(u8"Invis X", invx, -50, 50)
				
				imgui.SliderFloat(u8"Invis Y", invy, -50, 50)
				imgui.SliderFloat(u8"Invis Z", invz, -50, 50)
				
				if servcheck.v then
					imgui.SliderFloat(u8"Invis Dist", invdist, 10, 50)
					invdist.v = 50
				else
					imgui.SliderFloat(u8"Invis Dist", invdist, 10, 200)
				end
			end
			rainbow_line(700, 2)
		elseif tab.v == 7 then
		
		
		elseif tab.v == 8 then
			imgui.CenterText(u8"/bottsr") imgui.SameLine() imgui.TextQuestion(u8'включение/выключение бота на трс')
			imgui.CenterText(u8"/rescam") imgui.SameLine() imgui.TextQuestion(u8'фиксит камеру если та зависла')
			imgui.CenterText(u8"/ivcdmenu") imgui.SameLine() imgui.TextQuestion(u8'открывает это меню :)')
			imgui.CenterText(u8"/spos") imgui.SameLine() imgui.TextQuestion(u8'сохраняет ваши ненешние координаты')
			imgui.CenterText(u8"/rand") imgui.SameLine() imgui.TextQuestion(u8'выводит число от 1 до 100')
			imgui.CenterText(u8"/recc") imgui.SameLine() imgui.TextQuestion(u8'переподключает вас к серверу без задержки')
			imgui.CenterText(u8"/setmark 'x', 'y', 'z' ") imgui.SameLine() imgui.TextQuestion(u8'ставит метку на заданных координатах')
			imgui.CenterText(u8"Flooder ALT") imgui.SameLine() imgui.TextQuestion(u8'зажми R что бы флудился ALT')
			imgui.CenterText(u8"Взаимодействие с игроками") imgui.SameLine() imgui.TextQuestion(u8'зажми ПКМ + Z')
			imgui.Separator()
			imgui.CenterText(u8'телепорт на готову одежду в разработке(времмено)')
			imgui.CenterToggleButton(u8'показывает установленые анимации сервером', anims)
			imgui.Text(u8'Author')
			imgui.SameLine()
			imgui.Link(u8'https://vk.com/gclustov', 'VK "click"')
			imgui.Text(u8'SampHack')
			imgui.SameLine()
			imgui.Link(u8'www.youtube.com/@TheSampHack?sub_confirmation=1', 'YouTube  "click"')
			imgui.Text(u8'Author')
			imgui.SameLine()
			imgui.Link(u8'www.youtube.com/@vensuelateams1033?sub_confirmation=1', 'YouTube: "click"')
			imgui.Text(u8'Author')
			imgui.SameLine()
			imgui.Link(u8'https://www.blast.hk/members/463300/', 'BlastHack ццц"click"')
			elseif tab.v == 9 then
			if imgui.Button(u8'начать телепорт по метке',imgui.ImVec2(-1, 0)) then
				freezeCharPosition(PLAYER_PED, true)
				speed = sped.v
				tphkablip.v = true
			end
			if imgui.Button(u8'закончить телепорт по метке',imgui.ImVec2(-1, 0)) then
				freezeCharPosition(PLAYER_PED, false)
				speed = sped.v
				tphkablip.v = false
			end
			if imgui.Button(u8'начать телепорт по чекпоинту',imgui.ImVec2(-1, 0)) then
				freezeCharPosition(PLAYER_PED, true)
				speed = sped.v
				tphkacheck.v = true
			end
			if imgui.Button(u8'закончить телепорт по чекпоинту',imgui.ImVec2(-1, 0)) then
				freezeCharPosition(PLAYER_PED, false)
				speed = sped.v
				tphkacheck.v = false
			end
			imgui.SliderFloat(u8'шаг ТП по меткам', sped, 1, 9)
			imgui.SliderFloat(u8'скорость шага', waitt, 1, 1000)
		elseif tab.v == 10 then
			imgui.CenterToggleButton(u8"trololo", asdzxc)
			imgui.CenterToggleButton(u8'Рванка с машины', rvankacars)
			imgui.CenterToggleButton(u8'Рванка с ног', rvankaonfoot)
			imgui.InputInt(u8'ID PLAYER', playeridd, 0)
			imgui.CenterToggleButton(u8'писать?', pissat)
			imgui.CenterToggleButton(u8'крутиться', spinner)
			if spinner.v then
				imgui.SliderFloat(u8'Скорость вращения', speedspiner, 0.1, 5)
			end
			imgui.CenterToggleButton(u8'телепортироваться за жетрвой', slejka) 
			
		end
		imgui.EndChild()
		rainbow_line(1000, 2)
		save1()
		save2()
		imgui.End()
	end
end



function renderDrawLineBy3dCoordss(posX, posY, posZ, posX2, posY2, posZ2, width, color)
    local SposX, SposY = convert3DCoordsToScreen(posX, posY, posZ)
    local SposX2, SposY2 = convert3DCoordsToScreen(posX2, posY2, posZ2)
    if isPointOnScreen(posX, posY, posZ, 1) and isPointOnScreen(posX2, posY2, posZ2, 1) then
        renderDrawLine(SposX, SposY, SposX2, SposY2, width, color)
    end
end

function setDistanceAngle(dist)
    local sBase = require 'memory'
    local memory = { 11989248, 11989228, 11989244, 11989224 }
    for i = 1, #memory do
        sBase.setfloat(memory[i], dist)
    end
end

function nameTagOn()
 
    local pStSet = sampGetServerSettingsPtr();
  --  print(NTdist)
    NTdist = memory.getfloat(pStSet + 39)
    NTwalls = memory.getint8(pStSet + 47)
    NTshow = memory.getint8(pStSet + 56)
    memory.setfloat(pStSet + 39, 999)
    memory.setint8(pStSet + 47, 0)
    memory.setint8(pStSet + 56, 1)
end

function nameTagOff()

	local pStSet = sampGetServerSettingsPtr();
	memory.setfloat(pStSet + 39, 20)
	memory.setint8(pStSet + 47, 0)
	memory.setint8(pStSet + 56, 1)
end

function sampev.onShowDialog(id, style, title, button1, button2, text)
	if skiparenda.v then
		if text:find("Транспорт для аренды!") then
			sampSendChat("/gps")
			gpshide = true
			return false
		end
	end
	if text:find("Вы хотите начать") and dancer.v then
		sampAddChatMessage("начинаю танец", -1)
		sampSendDialogResponse(1600, 1, 0, nil)
	end
	if text:find("тренировки") and dancer.v then
		return false
	end
	if id == 7881 and stiler.v and isKeyDown(0x52) then
    	local number = 0
    	for s in string.gmatch(text, "[^[]+") do
    		if s:find('{FFDB56}') then
    			sampSendDialogResponse(id, 1, number - 1)
    			break
    		else
    			number = number + 1
    		end
		end
		return false
    end
	
	if skipfamcar.v then
		if text:find("хотите взять") then
			sampAddChatMessage("123", -1)
			sampSendDialogResponse(id, 1, nil, nil)
			sampSendChat("/gps")
			gpshide = true
			return false
		end
		if title:find("Аренда семейного авто") then
			--sampAddChatMessage("321", -1)
			sampSendChat("/gps")
			gpshide = true
			return false
		end
	end
	if gpshide then
			sampSendDialogResponse(id, 0, nil, nil)
			gpshide = false
			return false
	end
	if prova.v then
		if id == 70 then -- Сдача в автошколе
			sampSendDialogResponse(id, 1, title:find("Максимальная скорость вне") and 1 or title:find("Что нужно делать при тумане?") and 0 or title:find("Разрешена ли парковка на тротуаре") and 2 or title:find("Максимальная скорость в городе") and 1 or 0, nil)
			return false
		end
	end
	if prova.v then
		if id == 3339 then -- Сдача в авиашколе
			sampSendDialogResponse(id, 1, title:find("Какая дистанция должна быть между двумя") and 3 or title:find("Летать разрешено") and 3 or title:find("Можно ли садиться на зданиях") and 2 or title:find("Полет между зданиями") and 1 or title:find("Перед взлетом необходимо проверить") and 1 or title:find("Разрешено ли буксировать другие") and 1 or title:find("Покидать кабину летательного аппарата") and 0 or 0, nil)
			return false
		end
	end
	if lojitmaso.v and id == 7881 then
		local number = 0
    	for s in string.gmatch(text, "[^[]+") do
    		if s:find('Пустая полка') then
    			sampSendDialogResponse(id, 1, number - 1)
    			break
    		else
    			number = number + 1
    		end
		end
		return false
	end
    if id == 7881 and stiler.v and isKeyDown(52) then
    	local number = 0
    	for s in string.gmatch(text, "[^[]+") do
    		if s:find('{FFDB56}') then
    			sampSendDialogResponse(id, 1, number - 1)
    			break
    		else
    			number = number + 1
    		end
		end
		return false
    end
	if title:find('Выберите клад') then
		sampAddChatMessage('запуская рандом',-1)
		progbarr.v = true
	end	
end
function imgui.SelectButton(name, bool, size)
    if bool.v then
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.0, 0.6, 0.0, 0.40))
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.0, 0.8, 0.0, 1.0))
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.0, 1.0, 0.0, 1.0))
    else
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.6, 0.0, 0.0, 0.40))
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.8, 0.0, 0.0, 1.0))
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(1.0, 0.0, 0.0, 1.0))
    end
    if not size then size = imgui.ImVec2(0, 0) end
    local result = imgui.Button(name, size)
    imgui.PopStyleColor(3)
    if result then bool.v = not bool.v end
    return result
end

function join_argb(a, r, g, b) -- by FYP
    local argb = b  -- b
    argb = bit.bor(argb, bit.lshift(g, 8))  -- g
    argb = bit.bor(argb, bit.lshift(r, 16)) -- r
    argb = bit.bor(argb, bit.lshift(a, 24)) -- a
    return argb
end

function sampev.onShowTextDraw(arg0_a1051, arg1_a1077)
	if dancer and arg1_a1077.position.x >= 303.4 and arg1_a1077.position.x <= 324.6 then
		if arg1_a1077.text == "LD_BEAT:up" then
			setGameKeyState(1, -128)
		elseif arg1_a1077.text == "LD_BEAT:down" then
			setGameKeyState(1, 128)
		elseif arg1_a1077.text == "LD_BEAT:right" then
			setGameKeyState(0, 128)
		elseif arg1_a1077.text == "LD_BEAT:left" then
			setGameKeyState(0, -128)
		end
	end
end

function imgui.custom_togglebutton(name, bool, size)
    local function bringFloatTo(from, to, start_time, duration)
        local timer = os.clock() - start_time
        if timer >= 0.00 and timer <= duration then
            local count = timer / (duration / 100)
            return from + (count * (to - from) / 100), true
        end
        return (timer > duration) and to or from, false
    end

    local rounding = imgui.GetStyle().FrameRounding
    local size = size or imgui.ImVec2(60, 25)
    local dl = imgui.GetWindowDrawList()
    local p = imgui.GetCursorScreenPos()

    if UI_CUSTOM_TOGGLEBUTTON == nil then UI_CUSTOM_TOGGLEBUTTON = {} end

    if UI_CUSTOM_TOGGLEBUTTON[name] == nil then
        UI_CUSTOM_TOGGLEBUTTON[name] = {
            argument = bool[0],
            bool = false,
            alignment = {bool[0] and size.x / 1.5 - 5 or 0, true},
            clock = 0
        }
    end

    local go_anim = true
    if UI_CUSTOM_TOGGLEBUTTON[name].argument ~= bool[0] then
        UI_CUSTOM_TOGGLEBUTTON[name].argument = bool[0]
        if go_anim then
            UI_CUSTOM_TOGGLEBUTTON[name].bool = true
            UI_CUSTOM_TOGGLEBUTTON[name].clock = os.clock()
        else
            UI_CUSTOM_TOGGLEBUTTON[name].alignment = {bool[0] and size.x / 1.5 - 5 or 0, true}
        end
    end

    local color = {
        constant_color = bool[0] and imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.CheckMark]) or imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.FrameBg]),
        temp_color = bool[0] and imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.CheckMark]) or imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.FrameBg])
    }

    local get_cursor_y = imgui.GetCursorPosY()
    if imgui.InvisibleButton(name, imgui.ImVec2(size)) then UI_CUSTOM_TOGGLEBUTTON[name].bool = true; UI_CUSTOM_TOGGLEBUTTON[name].clock = os.clock(); bool[0] = not bool[0] end
    if imgui.IsItemHovered() then color.temp_color = imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.FrameBgHovered]) end
    if imgui.IsItemActive() then color.temp_color = imgui.GetColorU32Vec4(imgui.GetStyle().Colors[imgui.Col.FrameBgActive]) end
    imgui.SameLine()
    imgui.BeginGroup()
    imgui.SetCursorPosY(get_cursor_y + (size.y - imgui.CalcTextSize(name).y) / 2)
    imgui.Text(name)
    imgui.EndGroup()

    if UI_CUSTOM_TOGGLEBUTTON[name].bool then
        UI_CUSTOM_TOGGLEBUTTON[name].alignment = {bringFloatTo((bool[0] and 0 or size.x / 1.5 - 5), (bool[0] and size.x / 1.5 - 5 or 0), UI_CUSTOM_TOGGLEBUTTON[name].clock, 0.3)}
        if UI_CUSTOM_TOGGLEBUTTON[name].alignment[2] == false then UI_CUSTOM_TOGGLEBUTTON[name].bool = false end
    end

    dl:AddRect(p, imgui.ImVec2(p.x + size.x, p.y + size.y), color.temp_color, rounding, nil, 2)
    dl:AddRectFilled(imgui.ImVec2(p.x + 5 + UI_CUSTOM_TOGGLEBUTTON[name].alignment[1], p.y + 5), imgui.ImVec2(p.x + size.x - size.x / 1.5 + UI_CUSTOM_TOGGLEBUTTON[name].alignment[1], p.y + size.y - 5), color.constant_color, rounding)
end

function sampev.onServerMessage(color, text)
	if dancer.v and text:find("«акончилось врем¤, тренировка завершена.") then
		sampAddChatMessage("text findet", -1)
		dancer.v = true
	end
	if oocchat.v then
		if text:find("%(%( %S+%[%d+%]: {B7AFAF}.-{FFFFFF} %)%)") then
			local id, t = text:match("%(%( %S+%[(%d+)%]: {B7AFAF}(.-){FFFFFF} %)%)")
			local _, char = sampGetCharHandleBySampPlayerId(id)
			if _ then
				--{playerId = 'int16'}, {color = 'int32'}, {distance = 'float'}, {duration = 'int32'}, {message = 'string8'}
				t = "(( {B7AFAF}"..t.." {FFFFFF}))"
				local bs = raknetNewBitStream()
				raknetBitStreamWriteInt16(bs,id)
				raknetBitStreamWriteInt32(bs,-1)
				raknetBitStreamWriteFloat(bs,15)
				raknetBitStreamWriteInt32(bs,6000)
				raknetBitStreamWriteInt8(bs,#t)
				raknetBitStreamWriteString(bs,t)
				raknetEmulRpcReceiveBitStream(raknet.RPC.CHATBUBBLE,bs)
				raknetDeleteBitStream(bs)
			end
		end
	end
	if text:find('Депозит в банке:') then
		sampSendChat('/jmeat')
	end
	if tpholodilnik.v and text:find("для сохранения!") then
		setCharCoordinates(PLAYER_PED, 1412.248046875, 1348.8830566406, 10.975312232971)
		setGameKeyState(21, 255)
		setGameKeyState(21, 0)
		--setCharCoordinates(PLAYER_PED, 1406.4703369141, 1351.0064697266, 10.975312232971)
		obratno = true
	end
	lua_thread.create(function()
		while true do wait(0)
			if obratno and tpholodilnik.v and tpobratno.v then
				wait(1000)
				setCharCoordinates(PLAYER_PED, 1406.953125, 1351.2314453125, 10.975312232971)
				obratno = false
			end
		end
	end)
	if ntpo and text:find("взяли чистую") then
		--setCharCoordinates(PLAYER_PED, 1397.7794189453, 1358.2172851563, 10.93906211853)
		tpodejda = false
		asdfga = false
	end
	if naebal then
		local sync = samp_create_sync_data("player")
		sync.position = {1397.7794189453, 1358.2172851563, 10.93906211853}
		setCharCoordinates(PLAYER_PED, 1397.7794189453, 1358.2172851563, 10.93906211853)
		sync.send()
		altsync()
		naebal = false
	end
	if sbivmyso.v and text:find("мусор, ") or text:find("положили кусок ") or text:find('кусок') then
		sbivaka = true
		lua_thread.create(function()
			while true do wait(0)
				if sbivaka then
					wait(1)
					clearCharTasks(PLAYER_PED)
					sbivaka = false
				end
			end
		end)
	end
	if text:find("успешно положил") then 
		return false
	end
	if text:find("Добро пожаловать на Arizona Role Play!") then
		sampAddChatMessage('{4FFF38}Хуйня какае-то, наверно блять {FF00FF}стиллер{4FFF38} или  {FF00FF}лоадер ', -1)
	end
	if text:find("Вы попали на локацию мероприятия “Небесный плен”.") then
		delgun = true
		lua_thread.create(function()
			if delgun then
				while true do wait(0)
					removeAllCharWeapons(PLAYER_PED)
				end
			wait(5000)
			delgun = false
			end
		end)
	end
end

function rainbow(speed, alpha, offset) -- by rraggerr
    local clock = os.clock() + offset
    local r = math.floor(math.sin(clock * speed) * 127 + 128)
    local g = math.floor(math.sin(clock * speed + 2) * 127 + 128)
    local b = math.floor(math.sin(clock * speed + 4) * 127 + 128)
    return r,g,b,alpha
end

function rainbow_line(distance, size) -- by Fomikus
    local op = imgui.GetCursorPos()
    local p = imgui.GetCursorScreenPos()
    for i = 0, distance do
    r, g, b, a = rainbow(1, 255, i / -50)
    imgui.GetWindowDrawList():AddRectFilled(imgui.ImVec2(p.x + i, p.y), imgui.ImVec2(p.x + i + 1, p.y + size), join_argb(a, r, g, b))
    end
    imgui.SetCursorPos(imgui.ImVec2(op.x, op.y + size + imgui.GetStyle().ItemSpacing.y))
end

function static_rainbow_line(distance, size) -- by Fomikus
    local op = imgui.GetCursorPos()
    local p = imgui.GetCursorScreenPos()
    for i = 0, distance do
    r, g, b, a = rainbow_v2(1, 255, i / -50)
    imgui.GetWindowDrawList():AddRectFilled(imgui.ImVec2(p.x + i, p.y), imgui.ImVec2(p.x + i + 1, p.y + size), join_argb(a, r, g, b))
    end
    imgui.SetCursorPos(imgui.ImVec2(op.x, op.y + size + imgui.GetStyle().ItemSpacing.y))
end

function rainbow_v2(speed, alpha, offset) -- by rraggerr
    local r = math.floor(math.sin(offset * speed) * 127 + 128)
    local g = math.floor(math.sin(offset * speed + 2) * 127 + 128)
    local b = math.floor(math.sin(offset * speed + 4) * 127 + 128)
    return r,g,b,alpha
end

function sampev.onSetRaceCheckpoint(type, position, nextPosition, size)
	if asdfga then
		if type == 1 then
			naebal = true
		end
	end
end

function imgui.Link(link, text)
    text = text or link
    local tSize = imgui.CalcTextSize(text)
    local p = imgui.GetCursorScreenPos()
    local DL = imgui.GetWindowDrawList()
    local col = { 0xFFFF7700, 0xFFFF9900 }
    if imgui.InvisibleButton("##" .. link, tSize) then os.execute("explorer " .. link) end
    local color = imgui.IsItemHovered() and col[1] or col[2]
    DL:AddText(p, color, text)
    DL:AddLine(imgui.ImVec2(p.x, p.y + tSize.y), imgui.ImVec2(p.x + tSize.x, p.y + tSize.y), color)
end


function isKeyCheckAvailable()
	if not isSampLoaded() then
		return true
	end
	if not isSampfuncsLoaded() then
		return not sampIsChatInputActive() and not sampIsDialogActive()
	end
	return not sampIsChatInputActive() and not sampIsDialogActive() and not isSampfuncsConsoleActive()
end

 function runToPoint(tox, toy)
    local x, y, z = getCharCoordinates(PLAYER_PED)
    local angle = getHeadingFromVector2d(tox - x, toy - y)
    local xAngle = math.random(-50, -50)/100
    setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
    stopRun = false
    while botstatus.v and getDistanceBetweenCoords2d(x, y, tox, toy) > 0.8 do
        setGameKeyState(1, -255)
        setGameKeyState(16, 1)
        wait(1)
        x, y, z = getCharCoordinates(PLAYER_PED)
        angle = getHeadingFromVector2d(tox - x, toy - y)
        setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
        if stopRun then
            stopRun = false
            break
        end
    end
end

function rt(tox, toy)
    local x, y, z = getCharCoordinates(PLAYER_PED)
    local angle = getHeadingFromVector2d(tox - x, toy - y)
    local xAngle = math.random(-50, -50)/100
    setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
    stopRun = false
    while botstatus.v and getDistanceBetweenCoords2d(x, y, tox, toy) > 0.8 do
        setGameKeyState(1, -255)
        setGameKeyState(16, 1)
        wait(1)
        x, y, z = getCharCoordinates(PLAYER_PED)
        angle = getHeadingFromVector2d(tox - x, toy - y)
        setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
        if stopRun then
            stopRun = false
            break
        end
    end
end

function runPoint(tox, toy)
    local x, y, z = getCharCoordinates(PLAYER_PED)
    local angle = getHeadingFromVector2d(tox - x, toy - y)
    local xAngle = math.random(-50, -50)/100
    setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
    stopRun = false
    while botstatusTSR.v and getDistanceBetweenCoords2d(x, y, tox, toy) > 0.8 do
        setGameKeyState(1, -255)
        setGameKeyState(16, 1)
        wait(1)
        x, y, z = getCharCoordinates(PLAYER_PED)
        angle = getHeadingFromVector2d(tox - x, toy - y)
        setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
        if stopRun then
            stopRun = false
            break
        end
    end
end

function imgui.TextQuestion(text)
    imgui.TextDisabled('(?)')
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.PushTextWrapPos(450)
        imgui.TextUnformatted(text)
        imgui.PopTextWrapPos()
        imgui.EndTooltip()
    end
end

function ClearChat()
    memory.fill(sampGetChatInfoPtr() + 306, 0x0, 25200)
    memory.write(sampGetChatInfoPtr() + 306, 25562, 4, 0x0)
    memory.write(sampGetChatInfoPtr() + 0x63DA, 1, 1)
end

function getSelectedText()
    local input = sampGetChatInputText()
    local ptr = sampGetInputInfoPtr()
    local chat = getStructElement(ptr, 0x8, 4)
    local pos1 = readMemory(chat + 0x11E, 4, false)
    local pos2 = readMemory(chat + 0x119, 4, false)
    local count = pos2 - pos1
    return string.sub(input, count < 0 and pos2 + 1 or pos1 + 1, count < 0 and pos2 - count or pos2)
end

function sampev.onSendPlayerSync(data)
	if enabled then 
        data.moveSpeed.x = math.sin(-math.rad(getCharHeading(PLAYER_PED))) * 0.4
        data.moveSpeed.y = math.cos(-math.rad(getCharHeading(PLAYER_PED))) * 0.4
	end
	if enabledd then 
        data.moveSpeed.x = math.sin(-math.rad(getCharHeading(PLAYER_PED))) * 0.4
        data.moveSpeed.y = math.cos(-math.rad(getCharHeading(PLAYER_PED))) * 0.4
	end
	if bots.v then
        local px, py, pz = getCharCoordinates(1)
		local resc, veh = sampGetCarHandleBySampVehicleId(getClosestCarId())
		if resc then
			lua_thread.create(function()
				while true do wait(0)
					if bots.v then
						if carcheck.v then
							local _, veh = sampGetCarHandleBySampVehicleId(getClosestCarId())
							if veh == -1 then return end
							local x, y, z = getCarCoordinates(veh)
							DrawCube(x, y, z+1.612412)
							if pokazz.v then
								local _, veh = sampGetCarHandleBySampVehicleId(getClosestCarId())
								local xx, yy, zz = getCarCoordinates(veh)
								local x = xx + invx.v
								local y = yy + invy.v
								local z = zz + invz.v
								DrawCube(x, y, z+1.5)
							end	
						end
					end
				end
			end)
			local _, veh = sampGetCarHandleBySampVehicleId(getClosestCarId())
			local res, idcar = sampGetVehicleIdByCarHandle(veh)
				if res then
					data.specialAction = 3
					data.surfingVehicleId = idcar
					data.surfingOffsets = {invx.v, invy.v, invz.v}
					data.health = math.random(1, 100)
					data.animationId = 1018
					data.animationFlags = 12211
					data.moveSpeed = {0.3, 0.3, -0.1}
					data.position = {px, py, pz}
				end
			else 
			sampAddChatMessage("Машин нет, инвиз выключен. Включи его повторно", -1)
			--bots.v = false
		end
    end
	lua_thread.create(function()
		while true do wait(0)
		local px, py, pz = getCharCoordinates(1)
			if asdzxc.v then
				local _, handle = sampGetCharHandleBySampPlayerId(playeridd.v)
				if _ == nil then
					sampAddChatMessage('не найден', -1)
				else
					local xzc, yzc, zzc = getCharCoordinates(handle)
					if asdzxc.v and getDistanceBetweenCoords3d(xzc, yzc, zzc, px, py, pz) < 25 then
						local qwe = getCharHeading(PLAYER_PED)
						data.moveSpeed.x = math.sin(-math.rad(qwe)) * 0.001
						data.moveSpeed.y = math.cos(-math.rad(qwe)) * 0.001
							if _ then
								math.randomseed(os.time())
								
								local x, y, z = getCharCoordinates(handle)
								local angle = getCharHeading(handle)
								local bx = x - math.sin(-math.rad(angle)) / 6
								local by = y - math.cos(-math.rad(angle)) / 6
								local botAngle = getHeadingFromVector2d(x - bx, y - by)
								local x, y, bz = getCharCoordinates(handle)
									
								setCharHeading(PLAYER_PED, angle+rtot)
								setCharCoordinates(PLAYER_PED, bx, by, bz+1.4)
								if pissat.v then
									sampSetSpecialAction(68)
								else
									sampSetSpecialAction(0)
								end
								if spinner.v then
									rtot = rtot + (speedspiner.v / 4)
									if rtot > 360 then
										rtot = 0
									end
								end
							else
								sampAddChatMessage("игрок не найден, я наверно выключюсь!", -1)
								asdzxc.v = false
								sampSetSpecialAction(0)
							end
					else
						sampAddChatMessage("Игрок находтся далеко", -1)
						asdzxc.v = false
					end
				end
			end
		end
	end)
	if rvankaonfoot.v then
		if playeridd.v ~= -1 then
			if count >= 4 then
				data.moveSpeed.x = 0
				data.moveSpeed.y = 0
				data.moveSpeed.z = 0
				count = 0
				return true
			end
			local _, char = sampGetCharHandleBySampPlayerId(playeridd.v)
			if _ then
				local x, y, z = getCharCoordinates(char)
				local xx, yy, zz = getCharCoordinates(1)
				local h = getHeadingFromVector2d(x - xx, y - yy)
				local _, plid = sampGetPlayerIdByCharHandle(char)
				local nick = sampGetPlayerNickname(plid)
				setCharHeading(1, h)
				data.moveSpeed.x = 0
				data.moveSpeed.y = 2.8
				data.moveSpeed.z = up and 0.7 or -0.6
				data.position = {x, y - 3, z}
				data.surfingVehicleId = 0
				data.surfingOffsets = {0, 0, 0}
				setCharCoordinates(1, x, y - 3, z - 1)
				
				printStringNow('~r~Pizdim:~w~ '..nick.. '~r~ ID [~w~'..plid..'~r~]', 50)
				up = not up
				setGameKeyState(1, 255)
				setGameKeyState(1, 1)
				count = count + 1
				
			else
				id = -1
			end
		end
	end
end



function removePlayer(id)
    local bs = raknetNewBitStream()
    raknetBitStreamWriteInt16(bs, id)
    raknetEmulRpcReceiveBitStream(163, bs)
    raknetDeleteBitStream(bs)
end

function removeVehicle(id)
    local bs = raknetNewBitStream()
    raknetBitStreamWriteInt16(bs, id)
    raknetEmulRpcReceiveBitStream(165, bs)
    raknetDeleteBitStream(bs)
end

function sampev.onPlayerStreamIn()
	if clearchars.v then
		return false
	end
end

function sampev.onPlayerStreamOut()
	if clearchars.v then
		return false
	end
end

function sampev.onVehicleStreamIn()
	if clearvehs.v then
		return false
	end
end

function sampev.onVehicleStreamOut()
	if clearvehs.v then
		return false
	end
end

function sampev.onCreateObject(objectId, data)
	if getAllObjectsNow(data.modelId) and clearobject.v then 
		return false 
	end
end

function sampev.onCreate3DText(id, color, position, distance, testLOS, attPid, attVid, text)
	if clearobject.v then
		return false
	end
end

function sampev.onCreatePickup()
	if clearobject.v then
		return false
	end
end

function getAllObjectsNow(model)
    for k, v in pairs(getAllObjects()) do
        if model == v then 
            return true 
        end
    end
    return false
end


function sampev.onApplyPlayerAnimation(id, q,name)
	if anims.v then
		sampAddChatMessage(name, -1)
		return false
	end
	lua_thread.create(function()
	while true do wait(0)
			if name == "CRRY_PRTIAL" and botbox then
				CoordMaster(239.32678222656, 2026.6452636719, 16.687019348145, 3, 100)
			end
			if name == "PUTDWN" and botbox then
				CoordMaster(257.7116394043, 2013.0008544922, 16.667016983032, 3, 100)
			end
		end
	end)
end

function CoordMaster(px, py, pz, step, time)
  local x, y, z = getCharCoordinates(PLAYER_PED)
  local d = getDistanceBetweenCoords3d(px, py, pz, x, y, z)
  if d <= step then
   printStringNow('~r~you ~r~~h~~h~~h~ t~r~e~y~l~g~e~w~~b~p~b~o~p~r~p~~h~t ~w~gandon ~y~XDD', 10000)
   
    setCharCoordinates(PLAYER_PED, px, py, pz)
else
    local dx, dy, dz = px - x, py - y, pz - z
    x = x + step / d * dx
    y = y + step / d * dy
    z = z + step / d * dz
    setCharCoordinates(PLAYER_PED, x, y, z-1)
    wait(time)
    CoordMaster(px, py, pz, step, time)
    end
end

function sampev.onSetPlayerPos(pos)
	if bots.v then
		return false
	end
	if asdzxc.v then
		return false
	end
end

function imgui.CircleButton(text, bool, number)
    if bool.v == number then
        imgui.PushStyleVar(imgui.StyleVar.FrameRounding, 15)
        imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(1.00, 0.16, 0.16, 1.00))
        imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(1.00, 0.16, 0.16, 1.00))
        imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(1.00, 0.16, 0.16, 1.00))
        local button = imgui.Button(text, imgui.ImVec2(10, 10))
        imgui.PopStyleColor(3)
        imgui.PopStyleVar(1)
        return button
    else
        if imgui.Button(text, imgui.ImVec2(10, 10)) then
            bool.v = number
            return true
        end
    end
end

function samp_create_sync_data(sync_type, copy_from_player)
    local ffi = require 'ffi'
    local sampfuncs = require 'sampfuncs'
    local raknet = require 'samp.raknet'
    require 'samp.synchronization'
    copy_from_player = copy_from_player or true
    local sync_traits = {
        player = {'PlayerSyncData', raknet.PACKET.PLAYER_SYNC, sampStorePlayerOnfootData},
        vehicle = {'VehicleSyncData', raknet.PACKET.VEHICLE_SYNC, sampStorePlayerIncarData},
    }
    local sync_info = sync_traits[sync_type]
    local data_type = 'struct ' .. sync_info[1]
    local data = ffi.new(data_type, {})
    local raw_data_ptr = tonumber(ffi.cast('uintptr_t', ffi.new(data_type .. '*', data)))
    if copy_from_player then
        local copy_func = sync_info[3]
        if copy_func then
            local _, player_id
            if copy_from_player == true then
                _, player_id = sampGetPlayerIdByCharHandle(PLAYER_PED)
            else
                player_id = tonumber(copy_from_player)
            end
            copy_func(player_id, raw_data_ptr)
        end
    end
    local func_send = function()
        local bs = raknetNewBitStream()
        raknetBitStreamWriteInt8(bs, sync_info[2])
        raknetBitStreamWriteBuffer(bs, raw_data_ptr, ffi.sizeof(data))
        raknetSendBitStreamEx(bs, sampfuncs.HIGH_PRIORITY, sampfuncs.UNRELIABLE_SEQUENCED, 1)
        raknetDeleteBitStream(bs)
    end
    local mt = {
        __index = function(t, index)
            return data[index]
        end,
        __newindex = function(t, index, value)
            data[index] = value
        end
    }
    return setmetatable({send = func_send}, mt)
end

function sampev.onGangZoneDestroy(zoneId1)
	if treasurezone.v then
		if zoneId1 == kladZone then 
			removeGangZone(610)
			addGangZone(610, left, up, right, down, -2130706433)
			zoneActive = true
			sampAddChatMessage(sName .. 'Территория возвращена! ', -1)
		end
	end
end

function addGangZone(id, left, up, right, down, color) -- Создание ганг-зоны.
	if treasurezone.v then	
		local bs = raknetNewBitStream()
		raknetBitStreamWriteInt16(bs, id)
		raknetBitStreamWriteFloat(bs, left)
		raknetBitStreamWriteFloat(bs, up)
		raknetBitStreamWriteFloat(bs, right)
		raknetBitStreamWriteFloat(bs, down)
		raknetBitStreamWriteInt32(bs, color)
		raknetEmulRpcReceiveBitStream(108, bs)
		raknetDeleteBitStream(bs)
	end
end

function removeGangZone(id) -- Удаление ганг-зоны по ID
    local bs = raknetNewBitStream()
    raknetBitStreamWriteInt16(bs, id)
    raknetEmulRpcReceiveBitStream(120, bs)
    raknetDeleteBitStream(bs)
end

function sampev.onCreateGangZone(zoneId, squareStart, squareEnd, color)
	if treasurezone.v then	
		--print(color)
		if color == -16776961 then
			mapUsed = true
			kladZone = zoneId
			left = squareEnd.x
			up = squareEnd.y
			right = squareStart.x
			down = squareStart.y
		--print('l: ' .. left .. '; u: ' .. up .. '; r: ' .. right .. '; d: ' .. down)
			sampAddChatMessage(sName .. 'Территория найдена! После ее исчезновения она будет автоматически восстановлена.', -1)
		end
	end
end

function sampev.onDestroyObject(id)
    for k = 1, #lavki do
        local ob = sampGetObjectHandleBySampId(id)
        if ob == lavki[k] then
            table.remove(lavki, k)
        end
    end
end

function sampev.onSetObjectMaterialText(id, data)
    if data.text:find('Номер %d+%. {......}Свободная!') then
        local object = sampGetObjectHandleBySampId(id) 
        table.insert(lavki, object)
    else
        local ob = sampGetObjectHandleBySampId(id)
        for i = 1, #lavki do
            if ob == lavki[i] then
                table.remove(lavki, i)
            end
        end
    end
end

function DrawCube(x,y,z)
	if isPointOnScreen(x,y,z) then
		x = x-1
		y = y-1
		local xx,yy = convert3DCoordsToScreen(x,y,z)
		local xxx,yyy = convert3DCoordsToScreen(x+2,y,z)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x+2,y,z)
		local xxx,yyy = convert3DCoordsToScreen(x+2,y,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x,y,z)
		local xxx,yyy = convert3DCoordsToScreen(x,y,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x,y,z-2)
		local xxx,yyy = convert3DCoordsToScreen(x+2,y,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x,y,z)
		local xxx,yyy = convert3DCoordsToScreen(x,y+2,z)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x,y+2,z)
		local xxx,yyy = convert3DCoordsToScreen(x,y+2,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x,y+2,z-2)
		local xxx,yyy = convert3DCoordsToScreen(x,y,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x+2,y+2,z)
		local xxx,yyy = convert3DCoordsToScreen(x+2,y+2,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x+2,y,z)
		local xxx,yyy = convert3DCoordsToScreen(x+2,y+2,z)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x+2,y+2,z-2)
		local xxx,yyy = convert3DCoordsToScreen(x,y+2,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x+2,y+2,z-2)
		local xxx,yyy = convert3DCoordsToScreen(x+2,y,z-2)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
		local xx,yy = convert3DCoordsToScreen(x+2,y+2,z)
		local xxx,yyy = convert3DCoordsToScreen(x,y+2,z)
		renderDrawLine(xx,yy,xxx,yyy,3,-1)
	end
end


function runto(tox, toy)
    local x, y, z = getCharCoordinates(PLAYER_PED)
    local angle = getHeadingFromVector2d(tox - x, toy - y)
    local xAngle = math.random(-50, -50)/100
    setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
    stopRun = false
    while botcoordrodina.v and getDistanceBetweenCoords2d(x, y, tox, toy) > 0.8 do
        setGameKeyState(1, -255)
        setGameKeyState(16, 1)
        wait(1)
        x, y, z = getCharCoordinates(PLAYER_PED)
        angle = getHeadingFromVector2d(tox - x, toy - y)
        setCameraPositionUnfixed(xAngle, math.rad(angle - 90))
        if stopRun then
            stopRun = false
            break
        end
    end
end


function apply_custom_style()
   imgui.SwitchContext()
   local style = imgui.GetStyle()
   local colors = style.Colors
   local clr = imgui.Col
   local ImVec4 = imgui.ImVec4
   local ImVec2 = imgui.ImVec2

    style.WindowPadding = ImVec2(15, 15)
    style.WindowRounding = 15.0
    style.FramePadding = ImVec2(5, 5)
    style.ItemSpacing = ImVec2(12, 8)
    style.ItemInnerSpacing = ImVec2(8, 6)
    style.IndentSpacing = 25.0
    style.ScrollbarSize = 15.0
    style.ScrollbarRounding = 15.0
    style.GrabMinSize = 15.0
    style.GrabRounding = 7.0
    style.ChildWindowRounding = 8.0
    style.FrameRounding = 6.0
  

      colors[clr.Text] = ImVec4(0.95, 0.96, 0.98, 1.00)
      colors[clr.TextDisabled] = ImVec4(0.36, 0.42, 0.47, 1.00)
      colors[clr.WindowBg] = ImVec4(0.11, 0.15, 0.17, 1.00)
      colors[clr.ChildWindowBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
      colors[clr.PopupBg] = ImVec4(0.08, 0.08, 0.08, 0.94)
      colors[clr.Border] = ImVec4(0.43, 0.43, 0.50, 0.50)
      colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
      colors[clr.FrameBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.FrameBgHovered] = ImVec4(0.12, 0.20, 0.28, 1.00)
      colors[clr.FrameBgActive] = ImVec4(0.09, 0.12, 0.14, 1.00)
      colors[clr.TitleBg] = ImVec4(0.09, 0.12, 0.14, 0.65)
      colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51)
      colors[clr.TitleBgActive] = ImVec4(0.08, 0.10, 0.12, 1.00)
      colors[clr.MenuBarBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
      colors[clr.ScrollbarBg] = ImVec4(0.02, 0.02, 0.02, 0.39)
      colors[clr.ScrollbarGrab] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.ScrollbarGrabHovered] = ImVec4(0.18, 0.22, 0.25, 1.00)
      colors[clr.ScrollbarGrabActive] = ImVec4(0.09, 0.21, 0.31, 1.00)
      colors[clr.ComboBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.CheckMark] = ImVec4(0.28, 0.56, 1.00, 1.00)
      colors[clr.SliderGrab] = ImVec4(0.28, 0.56, 1.00, 1.00)
      colors[clr.SliderGrabActive] = ImVec4(0.37, 0.61, 1.00, 1.00)
      colors[clr.Button] = ImVec4(0.20, 0.25, 0.29, 1.00)
      colors[clr.ButtonHovered] = ImVec4(0.28, 0.56, 1.00, 1.00)
      colors[clr.ButtonActive] = ImVec4(0.06, 0.53, 0.98, 1.00)
      colors[clr.Header] = ImVec4(0.20, 0.25, 0.29, 0.55)
      colors[clr.HeaderHovered] = ImVec4(0.26, 0.59, 0.98, 0.80)
      colors[clr.HeaderActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
      colors[clr.ResizeGrip] = ImVec4(0.26, 0.59, 0.98, 0.25)
      colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
      colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
      colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
      colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
      colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
      colors[clr.PlotLines] = ImVec4(0.61, 0.61, 0.61, 1.00)
      colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)
      colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
      colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
      colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
      colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end
apply_custom_style()



function GetCoordinates()
    if isCharInAnyCar(playerPed) then
        local car = storeCarCharIsInNoSave(playerPed)
        return getCarCoordinates(car)
    else
        return getCharCoordinates(playerPed)
    end
end

function onScriptTerminate(script, quit)
    if script == thisScript() and marker then
        deleteCheckpoint(marker)
        removeBlip(checkpoint)
    end
end

function setMarker(type, x, y, z, radius, color)
    deleteCheckpoint(marker)
    removeBlip(checkpoint)
    checkpoint = addBlipForCoord(x, y, z)
    marker = createCheckpoint(type, x, y, z, 1, 1, 1, radius)
    changeBlipColour(checkpoint, color)
    lua_thread.create(function()
        while marker do
            wait(0)
            local x1, y1, z1 = getCharCoordinates(PLAYER_PED)
            if getDistanceBetweenCoords3d(x, y, z, x1, y1, z1) <= radius+4 then
                deleteCheckpoint(marker)
                removeBlip(checkpoint)
                addOneOffSound(0, 0, 0, 1149)
            end
        end
    end)
end

function renderFigure2D(x, y, points, radius, color)
    local step = math.pi * 2 / points
    local render_start, render_end = {}, {}
    for i = 0, math.pi * 2, step do
        render_start[1] = radius * math.cos(i) + x
        render_start[2] = radius * math.sin(i) + y
        render_end[1] = radius * math.cos(i + step) + x
        render_end[2] = radius * math.sin(i + step) + y
        renderDrawLine(render_start[1], render_start[2], render_end[1], render_end[2], 1, color)
    end
end
function getNearCharToCenter(radius)
    local arr = {}
    local sx, sy = getScreenResolution()
    for _, player in ipairs(getAllChars()) do
        if select(1, sampGetPlayerIdByCharHandle(player)) and isCharOnScreen(player) and player ~= playerPed then
            local plX, plY, plZ = getCharCoordinates(player)
            local cX, cY = convert3DCoordsToScreen(plX, plY, plZ)
            local distBetween2d = getDistanceBetweenCoords2d(sx / 2, sy / 2, cX, cY)
            if distBetween2d <= tonumber(radius and radius or sx) then
                table.insert(arr, {distBetween2d, player})
            end
        end
    end
    if #arr > 0 then
        table.sort(arr, function(a, b) return (a[1] < b[1]) end)
        return arr[1][2]
    end
    return nil
end
  
function BH_theme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
 
    style.WindowPadding = ImVec2(6, 4)
    style.WindowRounding = 5.0
    style.ChildWindowRounding = 5.0
    style.FramePadding = ImVec2(5, 2)
    style.FrameRounding = 5.0
    style.ItemSpacing = ImVec2(7, 5)
    style.ItemInnerSpacing = ImVec2(1, 1)
    style.TouchExtraPadding = ImVec2(0, 0)
    style.IndentSpacing = 6.0
    style.ScrollbarSize = 12.0
    style.ScrollbarRounding = 5.0
    style.GrabMinSize = 20.0
    style.GrabRounding = 2.0
    style.WindowTitleAlign = ImVec2(0.5, 0.5)

    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.28, 0.30, 0.35, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.16, 0.18, 0.22, 1.00)
    colors[clr.ChildWindowBg]          = ImVec4(0.19, 0.22, 0.26, 1)
    colors[clr.PopupBg]                = ImVec4(0.05, 0.05, 0.10, 0.90)
    colors[clr.Border]                 = ImVec4(0.19, 0.22, 0.26, 1.00)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]                = ImVec4(0.16, 0.18, 0.22, 1.00)
    colors[clr.FrameBgHovered]         = ImVec4(0.22, 0.25, 0.30, 1.00)
    colors[clr.FrameBgActive]          = ImVec4(0.22, 0.25, 0.29, 1.00)
    colors[clr.TitleBg]                = ImVec4(0.19, 0.22, 0.26, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.19, 0.22, 0.26, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.19, 0.22, 0.26, 0.59)
    colors[clr.MenuBarBg]              = ImVec4(0.19, 0.22, 0.26, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.20, 0.25, 0.30, 0.60)
    colors[clr.ScrollbarGrab]          = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.49, 0.63, 0.86, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.49, 0.63, 0.86, 1.00)
    colors[clr.ComboBg]                = ImVec4(0.20, 0.20, 0.20, 0.99)
    colors[clr.CheckMark]              = ImVec4(0.90, 0.90, 0.90, 0.50)
    colors[clr.SliderGrab]             = ImVec4(1.00, 1.00, 1.00, 0.30)
    colors[clr.SliderGrabActive]       = ImVec4(0.80, 0.50, 0.50, 1.00)
    colors[clr.Button]                 = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.ButtonHovered]          = ImVec4(0.49, 0.62, 0.85, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.49, 0.62, 0.85, 1.00)
    colors[clr.Header]                 = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.HeaderHovered]          = ImVec4(0.43, 0.57, 0.80, 1.00)
    colors[clr.HeaderActive]           = ImVec4(0.43, 0.57, 0.80, 1.00)
    colors[clr.Separator]              = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.SeparatorHovered]       = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.SeparatorActive]        = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.ResizeGripHovered]      = ImVec4(0.49, 0.61, 0.83, 1.00)
    colors[clr.ResizeGripActive]       = ImVec4(0.49, 0.62, 0.83, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.CloseButtonHovered]     = ImVec4(0.50, 0.63, 0.84, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.PlotLines]              = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.TextSelectedBg]         = ImVec4(0.41, 0.55, 0.78, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.16, 0.18, 0.22, 0.76)
    
    
end

function applyTheme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
 
 
    style.WindowPadding = ImVec2(6, 4)
    style.WindowRounding = 5.0
    style.FramePadding = ImVec2(5, 2)
    style.FrameRounding = 5.0
    style.ItemSpacing = ImVec2(7, 5)
    style.ItemInnerSpacing = ImVec2(1, 1)
    style.TouchExtraPadding = ImVec2(0, 0)
    style.IndentSpacing = 6.0
    style.ScrollbarSize = 12.0
    style.ScrollbarRounding = 16.0
    style.GrabMinSize = 20.0
    style.GrabRounding = 2.0
 
    style.WindowTitleAlign = ImVec2(0.5, 0.5)

    colors[clr.Border] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.WindowBg] = ImVec4(0.13, 0.14, 0.17, 1.00)
    colors[clr.FrameBg] = ImVec4(0.200, 0.220, 0.270, 0.85)
    colors[clr.TitleBg] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.TitleBgActive] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.Button] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.Separator] = ImVec4(1, 0, 0.3, 1.00)
    --CollapsingHeader
    colors[clr.Header] = ImVec4(1, 0, 0.3, 1.00)
    colors[clr.HeaderHovered] = ImVec4(0.68, 0, 0.2, 0.86)
    colors[clr.HeaderActive] = ImVec4(1, 0.24, 0.47, 1.00)
    colors[clr.CheckMark] = ImVec4(1, 0, 0.3, 1.00)
end

function theme()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2

    style.WindowPadding = imgui.ImVec2(8, 8)
    style.WindowRounding = 6
    style.ChildWindowRounding = 5
    style.FramePadding = imgui.ImVec2(5, 3)
    style.FrameRounding = 3.0
    style.ItemSpacing = imgui.ImVec2(5, 4)
    style.ItemInnerSpacing = imgui.ImVec2(4, 4)
    style.IndentSpacing = 21
    style.ScrollbarSize = 10.0
    style.ScrollbarRounding = 13
    style.GrabMinSize = 8
    style.GrabRounding = 1
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)

    colors[clr.Text]                   = ImVec4(0.95, 0.96, 0.98, 1.00);
    colors[clr.TextDisabled]           = ImVec4(0.29, 0.29, 0.29, 1.00);
    colors[clr.WindowBg]               = ImVec4(0.14, 0.14, 0.14, 1.00);
    colors[clr.ChildWindowBg]          = ImVec4(0.12, 0.12, 0.12, 1.00);
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94);
    colors[clr.Border]                 = ImVec4(0.14, 0.14, 0.14, 1.00);
    colors[clr.BorderShadow]           = ImVec4(1.00, 1.00, 1.00, 0.10);
    colors[clr.FrameBg]                = ImVec4(0.22, 0.22, 0.22, 1.00);
    colors[clr.FrameBgHovered]         = ImVec4(0.18, 0.18, 0.18, 1.00);
    colors[clr.FrameBgActive]          = ImVec4(0.09, 0.12, 0.14, 1.00);
    colors[clr.TitleBg]                = ImVec4(0.14, 0.14, 0.14, 0.81);
    colors[clr.TitleBgActive]          = ImVec4(0.14, 0.14, 0.14, 1.00);
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51);
    colors[clr.MenuBarBg]              = ImVec4(0.20, 0.20, 0.20, 1.00);
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.39);
    colors[clr.ScrollbarGrab]          = ImVec4(0.36, 0.36, 0.36, 1.00);
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.18, 0.22, 0.25, 1.00);
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.24, 0.24, 0.24, 1.00);
    colors[clr.ComboBg]                = ImVec4(0.24, 0.24, 0.24, 1.00);
    colors[clr.CheckMark]              = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.SliderGrab]             = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.SliderGrabActive]       = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.Button]                 = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.ButtonHovered]          = ImVec4(1.00, 0.39, 0.39, 1.00);
    colors[clr.ButtonActive]           = ImVec4(1.00, 0.21, 0.21, 1.00);
    colors[clr.Header]                 = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.HeaderHovered]          = ImVec4(1.00, 0.39, 0.39, 1.00);
    colors[clr.HeaderActive]           = ImVec4(1.00, 0.21, 0.21, 1.00);
    colors[clr.ResizeGrip]             = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.ResizeGripHovered]      = ImVec4(1.00, 0.39, 0.39, 1.00);
    colors[clr.ResizeGripActive]       = ImVec4(1.00, 0.19, 0.19, 1.00);
    colors[clr.CloseButton]            = ImVec4(0.40, 0.39, 0.38, 0.16);
    colors[clr.CloseButtonHovered]     = ImVec4(0.40, 0.39, 0.38, 0.39);
    colors[clr.CloseButtonActive]      = ImVec4(0.40, 0.39, 0.38, 1.00);
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00);
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00);
    colors[clr.PlotHistogram]          = ImVec4(1.00, 0.21, 0.21, 1.00);
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.18, 0.18, 1.00);
    colors[clr.TextSelectedBg]         = ImVec4(1.00, 0.32, 0.32, 1.00);
    colors[clr.ModalWindowDarkening]   = ImVec4(0.26, 0.26, 0.26, 0.60);
end


function ocianic()
	imgui.SwitchContext()
local style = imgui.GetStyle()
local colors = style.Colors
local clr = imgui.Col
local ImVec4 = imgui.ImVec4

style.Alpha = 1.0
style.ChildWindowRounding = 3
style.WindowRounding = 3
style.GrabRounding = 1
style.GrabMinSize = 20
style.FrameRounding = 3

colors[clr.Text] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.TextDisabled] = ImVec4(0.00, 0.40, 0.41, 1.00)
colors[clr.WindowBg] = ImVec4(0.00, 0.00, 0.00, 1.00)
colors[clr.ChildWindowBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
colors[clr.Border] = ImVec4(0.00, 1.00, 1.00, 0.65)
colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
colors[clr.FrameBg] = ImVec4(0.44, 0.80, 0.80, 0.18)
colors[clr.FrameBgHovered] = ImVec4(0.44, 0.80, 0.80, 0.27)
colors[clr.FrameBgActive] = ImVec4(0.44, 0.81, 0.86, 0.66)
colors[clr.TitleBg] = ImVec4(0.14, 0.18, 0.21, 0.73)
colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.54)
colors[clr.TitleBgActive] = ImVec4(0.00, 1.00, 1.00, 0.27)
colors[clr.MenuBarBg] = ImVec4(0.00, 0.00, 0.00, 0.20)
colors[clr.ScrollbarBg] = ImVec4(0.22, 0.29, 0.30, 0.71)
colors[clr.ScrollbarGrab] = ImVec4(0.00, 1.00, 1.00, 0.44)
colors[clr.ScrollbarGrabHovered] = ImVec4(0.00, 1.00, 1.00, 0.74)
colors[clr.ScrollbarGrabActive] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.ComboBg] = ImVec4(0.16, 0.24, 0.22, 0.60)
colors[clr.CheckMark] = ImVec4(0.00, 1.00, 1.00, 0.68)
colors[clr.SliderGrab] = ImVec4(0.00, 1.00, 1.00, 0.36)
colors[clr.SliderGrabActive] = ImVec4(0.00, 1.00, 1.00, 0.76)
colors[clr.Button] = ImVec4(0.00, 0.65, 0.65, 0.46)
colors[clr.ButtonHovered] = ImVec4(0.01, 1.00, 1.00, 0.43)
colors[clr.ButtonActive] = ImVec4(0.00, 1.00, 1.00, 0.62)
colors[clr.Header] = ImVec4(0.00, 1.00, 1.00, 0.33)
colors[clr.HeaderHovered] = ImVec4(0.00, 1.00, 1.00, 0.42)
colors[clr.HeaderActive] = ImVec4(0.00, 1.00, 1.00, 0.54)
colors[clr.ResizeGrip] = ImVec4(0.00, 1.00, 1.00, 0.54)
colors[clr.ResizeGripHovered] = ImVec4(0.00, 1.00, 1.00, 0.74)
colors[clr.ResizeGripActive] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.CloseButton] = ImVec4(0.00, 0.78, 0.78, 0.35)
colors[clr.CloseButtonHovered] = ImVec4(0.00, 0.78, 0.78, 0.47)
colors[clr.CloseButtonActive] = ImVec4(0.00, 0.78, 0.78, 1.00)
colors[clr.PlotLines] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.PlotLinesHovered] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.PlotHistogram] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.PlotHistogramHovered] = ImVec4(0.00, 1.00, 1.00, 1.00)
colors[clr.TextSelectedBg] = ImVec4(0.00, 1.00, 1.00, 0.22)
colors[clr.ModalWindowDarkening] = ImVec4(0.04, 0.10, 0.09, 0.51)
end

function apply_custom_style2()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4

    style.WindowRounding = 2.0
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 2.0
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0

    colors[clr.FrameBg]                = ImVec4(0.48, 0.16, 0.16, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.98, 0.26, 0.26, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.98, 0.26, 0.26, 0.67)
    colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
    colors[clr.TitleBgActive]          = ImVec4(0.48, 0.16, 0.16, 1.00)
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.88, 0.26, 0.24, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.Button]                 = ImVec4(0.98, 0.26, 0.26, 0.40)
    colors[clr.ButtonHovered]          = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.98, 0.06, 0.06, 1.00)
    colors[clr.Header]                 = ImVec4(0.98, 0.26, 0.26, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.98, 0.26, 0.26, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.98, 0.26, 0.26, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.75, 0.10, 0.10, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.75, 0.10, 0.10, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.98, 0.26, 0.26, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.98, 0.26, 0.26, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.98, 0.26, 0.26, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.98, 0.26, 0.26, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function save1()
	mainIni.config.trans      =  trans.v 
--	mainIni.config.fps		  =  fps.v
	mainIni.config.act		  =  act.v
	mainIni.config.the		  =  the.v
	mainIni.config.sh         =  sh.v
	mainIni.config.arenda     =  skiparenda.v
	mainIni.config.objcar     =  objcar.v
	mainIni.config.famarenda  =  skipfamcar.v
	mainIni.config.servcheck  =  servcheck.v
	mainIni.config.carcheck   =  carcheck.v
	mainIni.config.pokazz      =  pokazz.v
	mainIni.config.pokaz      =  pokaz.v
	mainIni.config.godcar     =  godm.v
	mainIni.config.chat       =  checkchat.v
	mainIni.config.boomtest   =  boom.v
	mainIni.config.showfps    =  showfps.v
	mainIni.config.airbraker  =  airbraker.v
	mainIni.config.prova      =  prova.v
	mainIni.config.oocchat    =  oocchat.v
	mainIni.config.trailerrr  =  trailerrr.v
	mainIni.config.lavka      = lavka.v
	mainIni.config.zoneklad   =  treasurezone.v
	mainIni.config.infinrun   =  infin.v
	mainIni.config.trashWH    =  trashWH.v
	mainIni.config.wallhack   =	 wallhack.v
	mainIni.config.themergb   =  themergb.v
	mainIni.config.skill      =	 skill.v
	mainIni.config.kryjok     =  kryjok.v
    inicfg.save(mainIni, "[helper].ini")
end

function save2()
		mainIni.config.invz     =  invz.v
		mainIni.config.process = process.v
		mainIni.config.sped  = sped.v
		mainIni.config.waitt = waitt.v
	mainIni.config.invy    =  invy.v
	mainIni.config.invx     =  invx.v
	mainIni.config.objx     =  objx.v
	mainIni.config.objy     =  objy.v
	mainIni.config.objz     =  objz.v
	mainIni.config.objrtx     =  objrtx.v
	mainIni.config.objrty     =  objrty.v
	mainIni.config.objrtz     =  objrtz.v
	mainIni.config.spinner     =  spinner.v
	mainIni.config.speedspiner     =  speedspiner.v
	mainIni.config.pissat     =  pissat.v
	mainIni.config.invdist     =  invdist.v
	mainIni.config.blain      =  slider1.v
	mainIni.config.camdist    =  slider.v
    mainIni.config.rklad      =  rklad.v
	mainIni.config.sbivmyso   =  sbivmyso.v
	mainIni.config.rzakladka  =  rzakladka.v
	mainIni.config.rolen      =  rolen.v
	mainIni.config.renderdereva = renderdereva.v
	mainIni.config.rlen       =  rlen.v
	mainIni.config.rhlopok    =  rhlopok.v
	mainIni.config.rsem       =  rsem.v
	mainIni.config.rryda      =  rryda.v
    mainIni.config.rderevo    =  rderevo.v
	mainIni.config.rgrove     =  rgrove.v
	mainIni.config.rballas    =  rballas.v
	mainIni.config.rrifa      =  rrifa.v
	mainIni.config.raztec     =  raztec.v
	mainIni.config.rnw        =  rnw.v
	mainIni.config.rvagos     =  rvagos.v
	mainIni.config.boxmp      =  boxmp.v
	mainIni.config.rvetok     =  rvetok.v
    mainIni.config.roskolok   =  roskolok.v
    mainIni.config.rkypidon   =  rkypidon.v
	mainIni.config.motoban    =  motoban.v
	mainIni.config.cub        =  cub.v
	inicfg.save(mainIni, "[helper].ini")
end
