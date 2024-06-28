require("profiles")

-- берем параметры из JSON
local parameters = Style.GetParameterValues() -- таблица групп параметров

-- объявление локальных переменных
local dims = parameters.Dimensions -- таблица параметров группы Dimensions

local bodyLength = dims.bodyLength
local bodyDiameter = dims.bodyDiameter
local branchLength = dims.branchLength
local branchDiameter = dims.branchDiameter
local branchPrecession = dims.branchPrecession
local pinOffset = dims.pinOffset
local blockSize = dims.blockSize
local blockHeight = dims.blockHeight
local blockOffsetZ = dims.blockOffsetZ

local indentation = parameters.ElectricConnections.indentation

--[[видимость параметров в диалоге стиля]]--
local isThread = parameters.PipeConnections.connectionType == PipeConnectorType.Thread
Style.GetParameter("PipeConnections", "nominalDiameter"):SetVisible(not isThread)
Style.GetParameter("PipeConnections", "threadSize"):SetVisible(isThread)

local localPlacement = Placement3D(Point3D(0,0,0), Vector3D(0,0,1), Vector3D(1,0,0))

-- функция создает трубу длиной=length, диаметром=diameter
local function createPipe(diameter, length)
    return CreateRightCircularCylinder(diameter/2, length)
end

-- функция создает гайку радиусом=nutRadius, высотой=nutHeight
local function createNut(nutRadius, nutHeight, sideNumder)    
    local contour = createRegularPolygon(sideNumder, nutRadius, 0)
    local params = ExtrusionParameters(nutHeight)
    return Extrude(contour, params)
end

-- функция создает модуль обработки
local function createProcessingBlock()
    local profiles = {
        createRoundedRectangle2D(blockSize, blockSize, blockSize/10):Scale(Point2D(0,0), 0.75, 0.75),
        createRoundedRectangle2D(blockSize, blockSize, blockSize/10),
        createRoundedRectangle2D(blockSize, blockSize, blockSize/10),
    }
    local placements = {
        localPlacement:Clone(),
        localPlacement:Clone():Shift(0,0,blockHeight*0.3),
        localPlacement:Clone():Shift(0,0,blockHeight)
    }
    return Loft(profiles, placements)
end

-- функция создает контакты ПЭА
local function createPin()
    local width = (branchLength+pinOffset)*2
    local height = (blockOffsetZ+bodyDiameter)/2
    local guideCurve = createRoundedRectangle3D(width, height, 16):Rotate(CreateXAxis3D(), math.pi/2)
    return CreateSweptDiskSolid(8, 0, guideCurve)
end

--[[детальная геометрия]]--
local detailedGeometry = ModelGeometry()

-- части геометрии
local bodySolid = createPipe(bodyDiameter, bodyLength)
local branchSolid = createPipe(branchDiameter, branchLength*2)
local legSolid = createPipe(16, blockOffsetZ+bodyDiameter/2)
local processingBlockSolid = createProcessingBlock()
local pinSolid = createPin()
local nutSolid = createNut(10, 16, 6)
local matrix = Matrix3D():Rotate(CreateYAxis3D(), math.pi/2):Rotate(CreateZAxis3D(), math.rad(branchPrecession))

-- собираем
local fullCase = Unite({
    bodySolid:Rotate(CreateYAxis3D(), math.pi/2):Shift(-bodyLength/2,0,0),
    branchSolid:Shift(0,0,-branchLength):Transform(matrix),
    processingBlockSolid:Shift(0,0,bodyDiameter/2+blockOffsetZ)
})

if blockOffsetZ >= 20 then
    fullCase = Unite({
        fullCase,
        legSolid,
        pinSolid:Rotate(CreateZAxis3D(), math.rad(branchPrecession)):Shift(0,0,(blockOffsetZ+bodyDiameter)/4),
        nutSolid:Clone():Shift(0,0,branchLength):Transform(matrix),
        nutSolid:Clone():Shift(-(blockOffsetZ+bodyDiameter)/2,0,8):Transform(matrix),
        nutSolid:Clone():Shift(0,0,-branchLength-16):Transform(matrix),
        nutSolid:Clone():Shift(-(blockOffsetZ+bodyDiameter)/2,0,-24):Transform(matrix)
    })
end

detailedGeometry:AddSolid(fullCase:ShowTangentEdges(false))
Style.SetDetailedGeometry(detailedGeometry)

--[[условная и символьная геометрия]]--
local symbolicGeometry = ModelGeometry() -- условный уровень детализации
local symbolGeometry = ModelGeometry() -- символьный уровень детализации

local symbolPlacement = Placement3D(Point3D(0,0,0), Vector3D(0,-1,0), Vector3D(1,0,0))

local function createUltrasonicFlowMeterSymbol(width, height)
    local symbolSet = GeometrySet2D()

    local p0 = Point2D(-width/2, height/2)
    local p1 = Point2D(0, height/4)
    local p2 = Point2D(width/2, height/4)
    local p3 = Point2D(width/2, -height/4)
    local p4 = Point2D(0, -height/4)
    local p5 = Point2D(-width/2, -height/2)
    local contour = CreatePolyline2D({p0, p1, p2, p3, p4, p5, p0})

    symbolSet:AddCurve(contour)
    symbolSet:AddMaterialColorSolidArea(FillArea(contour))

    return symbolSet
end

-- размеры символа в символьном уровне детализации
local w = 10
local h = w/2

-- размеры символа в условном уровне детализации
local symbolicHeight = bodyDiameter+blockOffsetZ+blockHeight
local symbolicWidth = bodyLength

symbolicGeometry:AddGeometrySet2D(createUltrasonicFlowMeterSymbol(symbolicWidth, symbolicHeight), symbolPlacement)
Style.SetSymbolicGeometry(symbolicGeometry)

symbolGeometry:AddGeometrySet2D(createUltrasonicFlowMeterSymbol(w, h), symbolPlacement)
Style.SetSymbolGeometry(symbolGeometry)

--[[порты]]--
-- размещаем трубопроводные порты
Style.GetPort("Inlet"):SetPlacement(Placement3D(Point3D(-bodyLength/2,0,0), Vector3D(-1,0,0), Vector3D(0,1,0)))
Style.GetPort("Outlet"):SetPlacement(Placement3D(Point3D(bodyLength/2,0,0), Vector3D(1,0,0), Vector3D(0,1,0)))

-- размещаем электрические порты
Style.GetPort("Port1"):SetPlacement(Placement3D(Point3D(-blockSize/2,indentation/2,bodyDiameter/2+blockOffsetZ+blockHeight/2), Vector3D(-1,0,0), Vector3D(0,1,0)))
Style.GetPort("Port2"):SetPlacement(Placement3D(Point3D(-blockSize/2,-indentation/2,bodyDiameter/2+blockOffsetZ+blockHeight/2), Vector3D(-1,0,0), Vector3D(0,1,0)))