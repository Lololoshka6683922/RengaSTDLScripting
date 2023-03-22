Графические примитивы
=====================

К графическим примитивам относятся:

* :ref:`Двумерные кривые <curve2d>`
* :ref:`Двумерные регионы <region>`

.. note:: Двухмерные примитивы в основном используются в условно-графическом отображении оборудования.

* :ref:`Трёхмерные кривые <curve3d>`

.. note:: Трёхмерные кривые в основном используются как направляющие для построения сложных :doc:`3D-тел </geometry>`

.. _curve2d:

Кривая в двумерном пространстве
-------------------------------

Под общим названием *Двумерные кривые* содержатся функции для построения различных видов кривых. 

Производные функции
^^^^^^^^^^^^^^^^^^^

Линия по двум точкам
""""""""""""""""""""

Конструктор:

.. function:: Line(point1, point2)

    :param point1: Задает точку начала линии.
    :type point1: :ref:`Point2d <point2d>`
    :param point2: Задает точку конца линии.
    :type point2: :ref:`Point2d <point2d>`

Дуга окружности по трём точкам
"""""""""""""""""""""""""""""""

Конструктор:

.. function:: ArcBy3Points(point1, point2, point3)

    :param point1: Задает точку начала дуги.
    :type point1: :ref:`Point2d <point2d>`
    :param point2: Задает точку, лежащую на дуге.
    :type point2: :ref:`Point2d <point2d>`
    :param point3: Задает точку конца дуги.
    :type point3: :ref:`Point2d <point2d>`

Дуга окружности по центру, начальной точке и конечной точке
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Конструктор:

.. function:: ArcByCenter(center, point1, point2, clockwise)

    :param center: Задает точку центра дуги.
    :type center: :ref:`Point2d <point2d>`
    :param point1: Задает точку начала дуги.
    :type point1: :ref:`Point2d <point2d>`
    :param point2: Задает точку конца дуги.
    :type point2: :ref:`Point2d <point2d>`
    :param clockwise: Задает направление дуги. True - по часовой стрелке, False - против часовой стрелки.
    :type clockwise: Boolean

Архимедова спираль
""""""""""""""""""

Конструктор:

.. function:: ArchimedeanSpiral(center, begin_radius, end_radius, begin_angle, end_angle)

    :param center: Задает точку центра спирали.
    :type center: :ref:`Point2d <point2d>`
    :param begin_radius: Задает радиус начала спирали.
    :type begin_radius: number
    :param end_radius: Задает радиус конца спирали.
    :type end_radius: number
    :param begin_angle: Задает угол начала спирали.
    :type begin_angle: number
    :param end_angle: Задает угол конца спирали.
    :type end_angle: number

Окружность
""""""""""

Конструктор:

.. function:: Circle(center, radius)

    :param center: Задает центр окружности.
    :type center: :ref:`Point2d <point2d>`
    :param radius: Задает радуис окружности.
    :type radius: number

Замкнутый контур по точкам
""""""""""""""""""""""""""

Конструктор:

.. function:: ClosedContourByPoints({points})

    :param points: Задает таблицу точек контура.
    :type points: table of :ref:`Points2d <point2d>`

Эллипс
""""""

Конструктор:

.. function:: Ellipse(center, half_radius_x, half_radius_y)

    :param center: Задает центр эллипса.
    :type center: :ref:`Point2d <point2d>`
    :param half_radius_x: Задает радиус полуоси вдоль оси X.
    :type half_radius_x: number
    :param half_radius_y: Задает радиус полуоси вдоль оси Y.
    :type half_radius_y: number

Дуга эллипса
""""""""""""

Конструктор:

.. function:: EllipticalArcByCenter(center, half_radius_x, half_radius_y, point1, point2, clockwise)

    :param center: Задает центр эллипса.
    :type center: :ref:`Point2d <point2d>`
    :param half_radius_x: Задает радиус полуоси вдоль оси X.
    :type half_radius_x: number
    :param half_radius_y: Задает радиус полуоси вдоль оси Y.
    :type half_radius_y: number
    :param point1: Задает точку начала дуги.
    :type point1: :ref:`Point2d <point2d>`   
    :param point2: Задает точку конца дуги.
    :type point2: :ref:`Point2d <point2d>`
    :param clockwise: Задает направление дуги. True - по часовой стрелке, False - против часовой стрелки.
    :type clockwise: Boolean

Открытый контур по точкам
""""""""""""""""""""""""""

Конструктор:

.. function:: OpenContourByPoints({points})

    :param points: Задает таблицу точек контура.
    :type points: table of :ref:`Points2d <point2d>`

Прямоугольник с центром в начале координат
""""""""""""""""""""""""""""""""""""""""""

Конструктор:

.. function:: Rectangle(width, height)

    :param width: Задает ширину прямоугольника.
    :type width: number
    :param height: Задает высоту прямоугольника.
    :type height: number

Методы
^^^^^^

* Сместить по осям X, Y

.. function:: :shift(d_x, d_y)

    :param d_x: Задает смещение по оси X.
    :type d_x: number
    :param d_y: Задает смещение по оси Y.
    :type d_y: number

* Повернуть на угол вокруг точки

.. function:: :rotate(point, angle)

    :param point: Задает точку вращения.
    :type point: :ref:`Point2d <point2d>`
    :param angle: Задает угол поворота.
    :type angle: number

* Масштабировать по двум осям относительно указанной точки

.. function:: :scale(point, x_scale, y_scale)

    :param point: Задает точку, относительно которой будет масштабироваться кривая.
    :type point: :ref:`Point2d <point2d>`
    :param x_scale: Задает коэффициент масштабирования по оси X.
    :type x_scale: number
    :param y_scale: Задает коэффициент масштабирования по оси Y.
    :type y_scale: number

* Изменить направление кривой на противоположное

.. function:: :inverse()

    :return: Инвертированная кривая
    :rtype: :ref:`Point2d <point2d>`

* Скруглить все сегменты контура

.. function:: :fillet(radius)

    :param radius: Задает радиус скругления.
    :type radius: number

* Скруглить два соседних сегмента кривой

.. function:: :fillet_nth(segment_index, radius)

    :param segment_index: Задает индекс (порядковый номер) сегмента (вершины?) кривой.
    :type segment_index: number
    :param radius: Задает радиус скругления.
    :type radius: number

* Обрезать кривую по двум точкам

.. function:: :cut(begin_point, end_point)

    :param begin_point: Задает первую точку.
    :type begin_point: :ref:`Point2d <point2d>`
    :param end_point: Задает вторую точку.
    :type end_point: :ref:`Point2d <point2d>`

* Вернуть начальную точку кривой

.. function:: :begin_point()

    :return: Двухмерная точка
    :rtype: :ref:`Point2d <point2d>`

* Вернуть конечную точку кривой

.. function:: :end_point()

    :return: Двухмерная точка
    :rtype: :ref:`Point2d <point2d>`

* Вернуть ближайшую точку до соседней кривой

.. function:: :nearest_point_for(other_curve)

    :param other_curve: Задает другую кривую.
    :type other_curve: :ref:`Curve2d <curve2d>`

* Вернуть габаритный прямоугольник кривой

.. function:: :bounding_rect()

    :return: Габаритный прямоугольник
    :rtype: :ref:`BoundingRect <boundingrect>`

* Вернуть список точек пересечений кривых Curve1 и Curve2d

.. function:: :intersection_points(first, second)

    :param first: Задает первую кривую.
    :type first: :ref:`Curve2d <curve2d>`
    :param second: Задает вторую кривую.
    :type second: :ref:`Curve2d <curve2d>`
    :return: Список точек
    :rtype: set of :ref:`Points2d <point2d>`

Операторы
^^^^^^^^^

* Булевое сложение

.. function:: +

    :return: Двухмерная кривая
    :rtype: :ref:`Curve2d <curve2d>`

Функции, не члены класса
^^^^^^^^^^^^^^^^^^^^^^^^

* Вернуть точку пересения кривых Curve1 и Curve2d (Альтернативный конструктор :ref:`Point2d <point2d>`).

.. function:: LineIntersection(first, second)

    :param first: Задает первую кривую.
    :type first: :ref:`Curve2d <curve2d>`
    :param second: Задает вторую кривую.
    :type second: :ref:`Curve2d <curve2d>`
    :return: Двухмерная точка.
    :rtype: :ref:`Point2d <point2d>`

* Обрезать кривые по регионам

.. function:: clip_curves_by_regions({clipped_curves}, {clipper_regions}, invertRegions, cutOnCurve)

    :param {clipped_curves}: Задает таблицу регионов, которые необходимо обрезать.
    :type {clipped_curves}: table of :ref:`Curves2d <curve2d>`
    :param {clipper_regions}: Задает таблицу регионов, по которым обрезать.
    :type {clipper_regions}: table of :ref:`Regions <region>`
    :param invertRegions: Инвертировать регионы.
    :type invertRegions: boolean
    :param cutOnCurve: Если False, не удаляются части кривой, совпадающие с участками границы.
    :type cutOnCurve: boolean
    :return: Обрезанные кривые
    :rtype: table of :ref:`Curves2d <curve2d>`

.. _region:

Двумерный регион
----------------

Регион состоит из набора замкнутых составных кривых (контуров). Регион представляет собой связное множество точек двумерного пространства, границы которого описывают контуры. Контуры региона замкнуты и не имеют самопересечений (но могут иметь самокасания). В произвольном регионе обязан быть один (и только один) внешний контур (положительный обход внешнего контура осуществляется против часовой стрелки) и несколько внутренних контуров (положительный обход внутреннего контура осуществляется по часовой стрелке), которые полностью лежат внутри внешнего контура (или могут его касаться). В массиве contours первым всегда лежит внешний контур.

Конструктор:

.. function:: Region({contours})

    :param contours: Задает таблицу замкнутых кривых.
    :type contours: table of :ref:`Curves2d <curve2d>`

Методы
^^^^^^

* Сместить по осям X, Y

.. function:: :shift(d_x, d_y)

    :param d_x: Задает смещение по оси X.
    :type d_x: number
    :param d_y: Задает смещение по оси Y.
    :type d_y: number

* Повернуть относительно точки

.. function:: :rotate(point, angle)

    :param point: Задает точку-центр вращения.
    :type point: :ref:`Point2d <point2d>`
    :param angle: Задает угол поворота.
    :type angle: number

* Масштабировать по двум осям относительно указанной точки

.. function:: :scale(point, x_scale, y_scale)

    :param point: Задает точку, относительно которой будет масштабироваться кривая.
    :type point: :ref:`Point2d <point2d>`
    :param x_scale: Задает коэффициент масштабирования по оси X.
    :type x_scale: number
    :param y_scale: Задает коэффициент масштабирования по оси Y.
    :type y_scale: number

* Вернуть количество контуров в регионе

.. function:: :contour_count()

    :rtype: number

* Вернуть контур с индексом index

.. function:: :contour(index)

    :param index: Задает индекс контура.
    :type index: number

Операторы
^^^^^^^^^

* Булевое сложение

.. function:: +

    :return: Трёхмерная кривая.
    :rtype: :ref:`Curve3d <curve3d>`

Функции, не члены класса
^^^^^^^^^^^^^^^^^^^^^^^^

* Обрезать регионы по регионам

.. function:: clip_regions_by_regions({clipped_regions}, {clipper_regions})

    :param {clipped_regions}: Задает таблицу регионов, которые необходимо обрезать.
    :type {clipped_regions}: table of :ref:`Regions <region>`
    :param {clipper_regions}: Задает таблицу регионов, по которым обрезать.
    :type {clipper_regions}: table of :ref:`Regions <region>`
    :return: Обрезанные регионы.
    :rtype: table of :ref:`Regions <region>`

.. _curve3d:

Кривая в трехмерном пространстве
--------------------------------

Под общим названием *Трёхмерные кривые* содержатся функции для построения различных видов кривых.

Производные функции
^^^^^^^^^^^^^^^^^^^

Линия по трем точкам
""""""""""""""""""""

Конструктор:

.. function:: Line3d(point1, point2)

    :param point1: Задает точку начала линии.
    :type point1: :ref:`Point3d <point3d>`
    :param point2: Задает точку конца линии.
    :type point2: :ref:`Point3d <point3d>`

Дуга окружности по центру, начальной и конечной точкам
""""""""""""""""""""""""""""""""""""""""""""""""""""""

Конструктор:

.. function:: Arc3dByCenterAndTwoPoints(point1, point2, point3)

    :param point1: Задает точку центра дуги.
    :type point1: :ref:`Point3d <point3d>`
    :param point2: Задает точку начала дуги.
    :type point2: :ref:`Point3d <point3d>`
    :param point3: Задает точку конца дуги.
    :type point3: :ref:`Point3d <point3d>`

Трёхмерная кривая по плоской кривой и ЛСК
"""""""""""""""""""""""""""""""""""""""""

Конструктор:

.. function:: Curve3dByCurveAndPlacement(curve, placement)

    :param curve: Задает плоскую кривую.
    :type curve: :ref:`Curve2d <curve3d>`
    :param placement: Задает локальную систему координат.
    :type placement: :ref:`Placement3d <placement3d>`

Трёхмерная спираль
""""""""""""""""""

.. function:: Helix(radius, step, height)

    :param radius: Задает радиус спирали.
    :type radius: number
    :param step: Задает расстояние между витками спирали.
    :type step: number
    :param height: Задает высоту спирали.
    :type height: number

Методы
^^^^^^

* Сместить по осям X, Y, Z

.. function:: :shift(d_x, d_y, d_z)

    :param d_x: Задает смещение по оси X.
    :type d_x: number
    :param d_y: Задает смещение по оси Y.
    :type d_y: number
    :param d_z: Задает смещение по оси Z.
    :type d_z: number

* Повернуть относительно оси

.. function:: :rotate(axis, angle)

    :param axis: Задает ось вращения.
    :type axis: :ref:`Axis <axis>`
    :param angle: Задает угол поворота.
    :type angle: number

* Вернуть центр кривой

.. function:: :center()

    :return: Трёхмерная точка
    :rtype: :ref:`Point3d <point3d>`

* Скруглить все сегменты кривой

.. function:: :fillet(radius)

    :param radius: Задает радиус скругления.
    :type radius: number

* Вернуть начальную точку кривой

.. function:: :begin_point()

    :return: Трёхмерная точка.
    :rtype: :ref:`Point3d <point3d>`


* Вернуть конечную точку кривой

.. function:: :end_point()

    :return: Трёхмерная точка.
    :rtype: :ref:`Point3d <point3d>`

Операторы
^^^^^^^^^

* Булевое сложение

.. function:: +

    :return: Трёхмерная кривая.
    :rtype: :ref:`Curve3d <curve3d>`
