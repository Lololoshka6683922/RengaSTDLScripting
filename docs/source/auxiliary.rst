Вспомогательные функции
=======================

Геометрические
--------------

.. _boundingrect:

Габаритный прямоугольник
^^^^^^^^^^^^^^^^^^^^^^^^

Конструктор:

.. function:: BoundingRect(point1, point2)

    :param point1: Задает нижнюю левую точку.
    :type point1: :ref:`Point2d <point2d>`
    :param point2: Задает верхнюю правую точку.
    :type point2: :ref:`Point2d <point2d>`

Методы
""""""

* Вернуть минимум по оси X

.. function:: :x_min()

    :rtype: number

* Вернуть минимум по оси Y

.. function:: :y_min()

    :rtype: number

* Вернуть максимум по оси X

.. function:: :x_max()

    :rtype: number

* Вернуть максимум по оси Y

.. function:: :y_max()

    :rtype: number

* Вернуть ширину габаритного прямоугольника

.. function:: :width()

    :rtype: number

* Вернуть высоту габаритного прямоугольника

.. function:: :height()

    :rtype: number

.. _boundingbox:

Габаритный параллелепипед
^^^^^^^^^^^^^^^^^^^^^^^^^

Габаритный параллелепипед - это область 3D-пространства, ограниченная прямым параллелепипедом, грани которого параллельны плоскостям системы координат.

Конструктор:

.. function:: BoundingBox(point1, point2)

    :param point1: Задает нижнюю левую точку.
    :type point1: :ref:`Point3d <point3d>`
    :param point2: Задает верхнюю правую точку.
    :type point2: :ref:`Point3d <point3d>`

Методы
""""""

* Вернуть минимум по оси X

.. function:: :x_min()

    :rtype: number

* Вернуть минимум по оси Y

.. function:: :y_min()

    :rtype: number

* Вернуть минимум по оси Z

.. function:: :z_min()

    :rtype: number

* Вернуть максимум по оси X

.. function:: :x_max()

    :rtype: number

* Вернуть максимум по оси Y

.. function:: :y_max()

    :rtype: number

* Вернуть максимум по оси Z

.. function:: :z_max()

    :rtype: number

* Вернуть центр габаритного куба

.. function:: :center()

    :rtype: :ref:`Point3d <point3d>`

Логические
----------

* Сравнить "=" с метрической точностью

.. function:: is_metric_equal(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: number
    :param num2: Задает переменную для сравнения.
    :type num2: number
    :rtype: boolean

* Сравнить "<" с метрической точностью

.. function:: is_metric_less(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: number
    :param num2: Задает переменную для сравнения.
    :type num2: number
    :rtype: boolean

* Сравнить "<=" с метрической точностью

.. function:: is_metric_less_or_equal(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: number
    :param num2: Задает переменную для сравнения.
    :type num2: number
    :rtype: boolean

* Сравнить ">" с метрической точностью

.. function:: is_metric_greater(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: number
    :param num2: Задает переменную для сравнения.
    :type num2: number
    :rtype: boolean

* Сравнить ">=" с метрической точностью

.. function:: is_metric_greater_or_equal(num1, num2)

    :param num1: Задает сравниваемую переменную.
    :type num1: number
    :param num2: Задает переменную для сравнения.
    :type num2: number
    :rtype: boolean

Сервисные
---------

* Печатать аргументы в консоль через табуляцию

.. function:: print(*args)

    :param args: Задает функцию или переменную
    :return: Печатает в консоли возвращаемое значение функции или переменную