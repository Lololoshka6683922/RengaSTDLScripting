Планарная геометрия (класс GeometrySet2D)
=========================================

Общий класс **GeometrySet2D** не имеет конструктора. Служит для создания условного или символьного уровня детализации стиля.
Планарная геометрия является контейнером, вмещающим в себя графические примитивы (из которых будет состоять УГО) таких типов, как:

* :ref:`Двумерные кривые <curve2d>`
* :ref:`Двумерные области заливки <fillarea>`

.. code-block:: lua
    :caption: Пример 1. Создание планарной геометрии, состоящей из 2-х кривых и одной области заливки.
    :linenos:

    local symbolGeometry = ModelGeometry()
    local planarGeometry = GeometrySet2D()    
    planarGeometry:AddCurve(CreateRectangle2D(20, 10))
    planarGeometry:AddCurve(CreateLineSegment2D(Point2D(10, -5),
                                                Point2D(-10, 5)))
    planarGeometry:AddLineColorSolidArea(FillArea({CreatePolyline2D({Point2D(10, -5),
                                                                    Point2D(-10, 5),
                                                                    Point2D(-10, -5),
                                                                    Point2D(10, -5)})}))
    symbolGeometry:AddGeometrySet2D(planarGeometry, placement)
    Style.SetSymbolGeometry(symbolGeometry)

Результат:

.. image:: _static/PlanarGeometry.png
    :height: 230 px
    :width: 400 px
    :align: center

Методы класса
-------------

Методы планарной геометрии GeometrySet2D.

* Сместить по осям X, Y

.. lua:method:: :Shift(dX, dY)

    :param dX: Задает смещение по оси X.
    :type dX: Number
    :param dY: Задает смещение по оси Y.
    :type dY: Number

* Повернуть относительно точки

.. lua:method:: :Rotate(point, angle)

    :param point: Задает точку-центр вращения.
    :type point: :ref:`Point2D <point2d>`
    :param angle: Задает угол поворота в радианах.
    :type angle: Number

* Масштабировать по двум осям относительно указанной точки

.. lua:method:: :Scale(point, scaleX, scaleY)

    :param point: Задает точку, относительно которой будет масштабироваться кривая.
    :type point: :ref:`Point2D <point2d>`
    :param scaleX: Задает коэффициент масштабирования по оси X.
    :type scaleX: Number
    :param scaleY: Задает коэффициент масштабирования по оси Y.
    :type scaleY: Number

* Преобразовать согласно матрице

.. lua:method:: :Transform(matrix)

    :param matrix: Задает матрицу преобразования в двумерном пространстве.
    :type matrix: :ref:`Matrix2D <matrix2d>`

* Вернуть копию планарной геометрии

.. lua:method:: :Clone()

    :return: Копия планарной геометрии
    :rtype: GeometrySet2D

* Добавить кривую к планарной геометрии

.. lua:method:: :AddCurve(curve)

    :param curve: Задает двухмерную кривую.
    :type curve: :ref:`Curve2D <curve2d>`

* Добавить область с заливкой цвета материала

.. lua:method:: :AddMaterialColorSolidArea(region)

    :param region: Задает область заливки.
    :type region: :ref:`FillArea <fillarea>`

* Добавить область с заливкой цвета линий

.. lua:method:: :AddLineColorSolidArea(region)

    :param region: Задает область заливки.
    :type region: :ref:`FillArea <fillarea>`
