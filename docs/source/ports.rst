Порты (класс Port)
==================

Порты служат для подключения оборудования к трассам инженерных систем.

Конструктор класса:

.. attention:: Этот блок дописывается

Методы класса
-------------

* Разместить порт в локальной системе координат

.. function:: :place(placement)

    :param placement: Задает ЛСК порта.
    :type placement: :ref:`Placement3d <placement3d>`

* Задать у порта якорь на трассе

.. function:: :anchor(axis)

    :param placement: Задает ЛСК порта.
    :type placement: :ref:`Placement3d <placement3d>`
    :param axis: Ось порта.
    :type axis: :ref:`Axis <axis>`

* Задать параметры порта трубопроводных систем

.. function:: :pipe_attributes(*args)

* Задать параметры порта трубопроводных систем с резьбовым соединением

.. function:: :pipe_threaded_attributes(*args)

* Задать параметры порта вентиляционных систем с воздуховодами круглого сечения

.. function:: :duct_circular_attributes(*args)

* Задать параметры порта вентиляционных систем с воздуховодами прямоугольного сечения

.. function:: :duct_rectangular_attributes(*args)