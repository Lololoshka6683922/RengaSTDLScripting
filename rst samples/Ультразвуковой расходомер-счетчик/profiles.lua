-- Функция возвращает 2D-полилинию = равносторонний многоугольник
function createRegularPolygon(polygonSides, polygonRadius, polygonRotation)
    local regularPolygon = {}
    polygonRotation = polygonRotation or 0
    polygonRotation = math.rad(polygonRotation % 360)

    -- Угол между каждой стороной
    polygonAngle = (math.pi * 2) / polygonSides

    -- По-умолчанию ориентируем плоской стороной вниз
    -- поворачивая фигуру на половину угла между сторонами
    polygonRotation = polygonRotation + (polygonAngle / 2)

    for i = 0, polygonSides, 1 do
        angle = polygonAngle * i
        angle = angle + polygonRotation

        x = math.sin(angle) * polygonRadius
        y = -math.cos(angle) * polygonRadius

        regularPolygon[#regularPolygon + 1] = Point2D(x, y)
    end

    return CreatePolyline2D(regularPolygon)
end

-- Функция возвращает 2D-прямоугольник со скругленными углами, если filletRadius > 0,
-- либо простой 2D-прямоугольник
function createRoundedRectangle2D(width, height, filletRadius)
    local curve = CreateRectangle2D(Point2D(0,0), 0, width, height)
    local radius = math.min(math.min(width/2, height/2), filletRadius)

    if filletRadius > 0 then
        FilletCorners2D(curve, radius)
    end

    return curve
end

-- Функция возвращает 3D-прямоугольник со скругленными углами, если filletRadius > 0,
-- либо простой 3D-прямоугольник
function createRoundedRectangle3D(width, height, filletRadius)
    local curve = CreateRectangle3D(Point3D(0,0,0), Vector3D(0,0,1), Vector3D(1,0,0), width, height)
    local radius = math.min(math.min(width/2-1, height/2-1), filletRadius)

    if filletRadius > 0 then
        local p0 = Point3D(-width/2+radius, height/2, 0)
        local p1 = Point3D(width/2-radius, height/2, 0)
        local p2 = Point3D(width/2, height/2-radius, 0)
        local p3 = Point3D(width/2, -height/2+radius, 0)
        local p4 = Point3D(width/2-radius, -height/2, 0)
        local p5 = Point3D(-width/2+radius, -height/2, 0)
        local p6 = Point3D(-width/2, -height/2+radius, 0)
        local p7 = Point3D(-width/2, height/2-radius, 0)
        local cp0 = Point3D(-width/2+radius, height/2-radius, 0)
        local cp1 = Point3D(width/2-radius, height/2-radius, 0)
        local cp2 = Point3D(width/2-radius, -height/2+radius, 0)
        local cp3 = Point3D(-width/2+radius, -height/2+radius, 0)

        curve = CreateCompositeCurve3D({
            CreateLineSegment3D(p0, p1),
            CreateArc3DByCenterStartEndPoints(cp1, p1, p2, false),
            CreateLineSegment3D(p2, p3),
            CreateArc3DByCenterStartEndPoints(cp2, p3, p4, false),
            CreateLineSegment3D(p4, p5),
            CreateArc3DByCenterStartEndPoints(cp3, p5, p6, false),
            CreateLineSegment3D(p6, p7),
            CreateArc3DByCenterStartEndPoints(cp0, p7, p0, false)
        })
    end

    return curve
end

-- Функция возвращает 2D-полилинию = прямоугольник со скошенными углами, если bevelLength > 0,
-- либо простой 2D-прямоугольник
function createBeveledRectangle2D(width, height, bevelLength)
    local beveledRectangle = {}
    local a = bevelLength / math.sqrt(2)
    
    if bevelLength == 0 then
        -- Если фаска = 0, то обычный прямоугольник по точкам
        beveledRectangle = {
            Point2D(-width/2, -height/2),
            Point2D(width/2, -height/2),
            Point2D(width/2, height/2),
            Point2D(-width/2, height/2),
            Point2D(-width/2, -height/2)}
    else
        beveledRectangle = {
            Point2D(-width/2 + a, -height/2),
            Point2D(width/2 - a, -height/2),
            Point2D(width/2, -height/2 + a),
            Point2D(width/2, height/2 - a),
            Point2D(width/2 - a, height/2),
            Point2D(-width/2 + a, height/2),
            Point2D(-width/2, height/2 - a),
            Point2D(-width/2, -height/2 + a),
            Point2D(-width/2 + a, -height/2)}
    end

    return CreatePolyline2D(beveledRectangle)
end