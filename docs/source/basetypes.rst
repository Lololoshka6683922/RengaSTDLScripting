Базовые типы геометрии
=======================

Служат для определения более сложных геометрических примитивов (:doc:`двумерных </symbolic>` и :doc:`трёхмерных </geometry>`), а также для размещения в локальной системе координат.

.. _point2d:

Декартова двухмерная точка
--------------------------

Конструктор:

.. function:: Point2d(x, y)

    :param x: Задает координату по оси X.
    :type x: number
    :param y: Задает координату по оси Y.
    :type y: number

Методы
^^^^^^^

* Сместить по осям X, Y

.. function:: :shift(d_x, d_y)

    :param d_x: Задает смещение по оси X.
    :type d_x: number
    :param d_y: Задает смещение по оси Y.
    :type d_y: number

* Повернуть на угол

.. function:: :rotate(point, angle)

    :param point: Задает точку центра вращения.
    :type point: :ref:`Point2d <point2d>`
    :param angle: Задает угол поворота.
    :type angle: number

* Вернуть копию объекта

.. function:: :clone()

    :return: Двухмерная точка
    :rtype: :ref:`Point2d <point2d>`

* Вернуть значение координаты X точки

.. function:: :x()

* Вернуть значение координаты Y точки

.. function:: :y()

* Сконвертировать точку в строку

.. function:: :tostring(point)

    :param point: Задает точку.
    :type point: :ref:`Point2d <point2d>`
    :rtype: String

Операторы
^^^^^^^^^^

* Сравнить на равенство с другой точкой

.. function:: ==

    :return: Логическое значение
    :rtype: Boolean

.. _point3d:

Точка в трёхмерном пространстве
-------------------------------

Конструктор:

.. function:: Point3d(x, y, z)

    :param x: Задает координату по оси X.
    :type x: number
    :param y: Задает координату по оси Y.
    :type y: number
    :param z: Задает координату по оси Z.
    :type z: number

Методы
^^^^^^^

* Сместить по осям X, Y, Z

.. function:: :shift(d_x, d_y, d_z)

    :param d_x: Задает смещение по оси X.
    :type d_x: number
    :param d_y: Задает смещение по оси Y.
    :type d_y: number
    :param d_z: Задает смещение по оси Z.
    :type d_z: number

* Повернуть на угол

.. function:: :rotate(axis, angle)

    :param axis: Задает ось вращения.
    :type axis: :ref:`Vector3d <vector3d>`
    :param angle: Задает угол поворота.
    :type angle: number

* Вернуть копию объекта

.. function:: :clone()

    :return: Копия точки
    :rtype: :ref:`Point3d <point3d>`  

* Вернуть значение координаты X точки

.. function:: :x()

* Вернуть значение координаты Y точки

.. function:: :y()

* Вернуть значение координаты Z точки

.. function:: :z()    

Операторы
^^^^^^^^^^

* Сложить точки

.. function:: +

    :return: Трёхмерный вектор
    :rtype: :ref:`Vector3d <vector3d>`  

* Вычесть точки

.. function:: -

    :return: Трёхмерный вектор
    :rtype: :ref:`Vector3d <vector3d>` 

.. _vector3d:

Вектор в трёхмерном пространстве
--------------------------------

Вектор - элемент геометрического пространства, характеризующийся направлением. Направление вектора задаётся набором коэффициентов (соотношение направления) по координатным осям. Как правило, коэффициенты указываются от -1 до 1. Поскольку вектор указывает только направление, соотношение направлений не обязательно нормализовывать.

Конструктор:

.. function:: Vector3d(x, y, z)

    :param x: Задает соотношение направления по оси X.
    :type x: number
    :param y: Задает соотношение направления по оси Y.
    :type y: number
    :param z: Задает соотношение направления по оси Z.
    :type z: number

Методы
^^^^^^^

* Вернуть соотношение направления по оси X

.. function:: :x()

* Вернуть соотношение направления по оси Y

.. function:: :y()

* Вернуть соотношение направления по оси Z

.. function:: :z()

Операторы
^^^^^^^^^^

* Унарный минус

.. function:: -

    :return: Вектор, обращенный в обратную сторону
    :rtype: :ref:`Vector3d <vector3d>`  

.. _axis:

Ось
---

Ось - вектор, привязанный к фиксированной точке.

Конструктор:

.. function:: Axis(point, vector)

    :param point: Задает точку начала оси.
    :type point: :ref:`Point3d <point3d>`
    :param vector: Задает направление оси.
    :type vector: :ref:`Vector3d <vector3d>`

Альтернативные конструкторы:

.. function:: AxisX()

    :return: Ось X
    :rtype: :ref:`Axis <axis>`

.. function:: AxisY()

    :return: Ось Y
    :rtype: :ref:`Axis <axis>`

.. function:: AxisZ()

    :return: Ось Z
    :rtype: :ref:`Axis <axis>`    

Методы
^^^^^^

* Вернуть вектор оси Z

.. function:: :axis_z()

    :rtype: :ref:`Vector3d <vector3d>`

* Вернуть точку начала оси

.. function:: :origin()

    :rtype: :ref:`Point3d <point3d>`

Операторы
^^^^^^^^^^

* Унарный минус

.. function:: -

    :return: Ось, обращенная в обратную сторону
    :rtype: :ref:`Axis <axis>`  

.. _placement3d:

Локальная система координат в трёхмерном пространстве
-----------------------------------------------------

.. function:: Placement3d(origin, vector_z, vector_x)

    :param origin: Задает точку начала координат.
    :type origin: :ref:`Point3d <point3d>`
    :param vector_z: Задает направление оси Y.
    :type vector_z: :ref:`Vector3d <vector3d>`
    :param vector_x: Задает направление оси Z.
    :type vector_x: :ref:`Vector3d <vector3d>`

Методы
^^^^^^

* Сместить ЛСК по осям X, Y, Z

.. function:: :shift(d_x, d_y, d_z)

    :param d_x: Задает смещение по оси X.
    :type d_x: number
    :param d_y: Задает смещение по оси Y.
    :type d_y: number
    :param d_z: Задает смещение по оси Z.
    :type d_z: number

* Повернуть ЛСК относительно заданной оси

.. function:: :rotate(axis, angle)

    :param axis: Задает ось вращения.
    :type axis: :ref:`Axis <axis>`
    :param angle: Задает угол вращения.
    :type angle: number

* Переместить СК в новую ЛСК

.. function:: :place(placement)

    :param placement: Задает новую ЛСК.
    :type placement: :ref:`Placement3d <placement3d>`

* Вернуть копию объекта

.. function:: :clone()

    :return: Копия ЛСК
    :rtype: :ref:`Placement3d <placement3d>`

* Вернуть начало ЛСК

.. function:: :origin()

    :return: Начало ЛСК
    :rtype: :ref:`Point3d <point3d>`

* Вернуть ось X

.. function:: :axis_x()

    :rtype: :ref:`Axis <axis>`

* Вернуть ось Y

.. function:: :axis_y()

    :rtype: :ref:`Axis <axis>`

* Вернуть ось Z

.. function:: :axis_z()

    :rtype: :ref:`Axis <axis>`

* Вернуть вектор оси X

.. function:: :vector_x()

    :rtype: :ref:`Vector3d <vector3d>`

* Вернуть вектор оси Y

.. function:: :vector_y()

    :rtype: :ref:`Vector3d <vector3d>`

* Вернуть вектор оси Z

.. function:: :vector_z()

    :rtype: :ref:`Vector3d <vector3d>`
