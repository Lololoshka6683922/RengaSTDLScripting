Интерфейсы взаимодействия с Renga
=================================

Скрипты выполняются в глобальном окружении ``renga``, в котором определены интерфейсы для непосредственного взаимодействия с Renga:

1. ``renga.geometry`` — создание геометрии для различного отображения оборудования:
    * ``renga.reometry.detailed`` — создание твердотельной 3D-геометрии;
    * ``renga.reometry.symbolic`` — создание плоской геометрии на различных проекциях с условным уровнем детализации;
    * ``renga.reometry.symbol`` — создание плоской геометрии на различных проекциях с символьным уровнем детализации.
2. ``renga.ports`` — создание портов оборудования.
3. ``renga.ui`` — отображение параметров в окне стиля оборудования (на вкладке "Параметры").

Создание твердотельной 3D-геометрии оборудования
""""""""""""""""""""""""""""""""""""""""""""""""

.. function:: renga.geometry.detailed.add_solid(*args)

    :param args: В качестве аргументов передаётся твердотельная 3D-геометрия и его методы.
    :type args: :doc:`Solid <../geometry>`

.. code-block:: lua
    :caption: Пример. Создание 3D-геометрии в форме куба с размером грани *size*:
    :linenos:

    local solid = Cube(size)
    renga.geometry.detailed.add_solid(solid)

Создание условного изображения оборудования
"""""""""""""""""""""""""""""""""""""""""""

.. function:: renga.geometry.symbolic.add_planar_geometry(*args)

    :param args: В качестве аргументов передаётся плоская геометрия и ее методы.
    :type args: :doc:`PlanarGeometry <../planar>`

.. code-block:: lua
    :caption: Пример. Создание условного отображения в виде квадрата с размером грани *size*:
    :linenos:

    local plane_geometry = PlanarGeometryPlane()    
    plane_geometry:add_curve(Rectangle(size, size))    
    renga.geometry.symbolic.add_planar_geometry(plane_geometry)

Создание символьного изображение оборудования
"""""""""""""""""""""""""""""""""""""""""""""

.. function:: renga.geometry.symbol.add_planar_geometry(*args)

    :param args: В качестве аргументов передается плоская геометрия и ее методы.
    :type args: :doc:`PlanarGeometry <../planar>`

.. code-block:: lua
    :caption: Пример. Создание символьного отображения в виде квадрата с размером грани *size*:
    :linenos:

    local plane_geometry = PlanarGeometryPlane()
    plane_geometry:add_curve(Rectangle(size, size))
    renga.geometry.symbol.add_planar_geometry(plane_geometry:set_unscalable(true))

Создание точки подключения (порта) оборудования
"""""""""""""""""""""""""""""""""""""""""""""""

.. function:: renga.ports.inlet

    :param ports: Порт
    :type ports: :doc:`Port <../ports>`
    :param inlet: Направление потока
    :type inlet: :ref:`Enum <flow>`

Задание видимости параметра в окне стиля оборудования
"""""""""""""""""""""""""""""""""""""""""""""""""""""

.. function:: renga.ui.set_param_visible(parameter, bool)

    :param parameter: Задает идентификатор (имя) :doc:`параметра <../createparams>`.
    :param bool: Задает видимость параметра. True - видимый, False - невидимый
    :type bool: boolean

Задание видимости группы параметров в окне стиля оборудования
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

.. function:: renga.ui.set_group_visible(group, bool)

    :param group: Задает идентификатор (имя) :doc:`группы параметров <../createparams>`.
    :param bool: Задает видимость группы параметров. True - видимый, False - невидимый
    :type bool: boolean