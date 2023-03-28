Интерфейсы взаимодействия с Renga
=================================

Для непосредственного взаимодействия с Renga созданы следующие интерфейсы:

``renga.geometry`` — *namespace* создания геометрии оборудования в Renga для различного отображения:

+ ``renga.reometry.detailed`` — создание твердотельной 3D-геометрии;    
+ ``renga.reometry.symbolic`` — создание плоской геометрии на различных проекциях с условным уровнем детализации;
+ ``renga.reometry.symbol`` — создание плоской геометрии на различных проекциях с символьным уровнем детализации.

``renga.ports`` — *namespace* создания портов оборудования.

``renga.api`` — *namespace* встроенных функций, порождающих геометрию.

``renga.ui`` — *namespace* отображения параметров в окне стиля оборудования (на вкладке "Параметры").

``renga.core_enum`` — *namespace* :doc:`системных перечислений </coreenums>`.

.. attention:: *namespace* заменить на LUA-термин

Создание геометрического примитива c помощью встроенных функций
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Интерфейс:  ``renga.api``

.. code-block:: lua
    :caption: Пример 1. Создание твердотельной 3D-геометрии в виде сферы, радиусом ``radius``:
    :linenos:

    local solid = renga.api.Sphere(radius)

.. code-block:: lua
    :caption: Пример 2. Создание плоской геометрии PlanarGeometryAxis90():
    :linenos:

    local planar_geometry = renga.api.PlanarGeometryAxis90()

.. code-block:: lua
    :caption: Пример 3. Создание точки в трёхмерном пространстве:
    :linenos:

    local point_3d = renga.api.Point3d(x, y, z)   

Передача в Renga геометрического примитива для создания твердотельной 3D-геометрии оборудования
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Интерфейс:  ``renga.geometry.detailed``

Метод:

.. function:: :add_solid(*args)

    :param args: В качестве аргументов передаётся твердотельная 3D-геометрия и его методы.
    :type args: :doc:`Solid <../geometry>`

.. code-block:: lua
    :caption: Пример. Создание 3D-геометрии в форме куба с размером грани ``size``:
    :linenos:

    local solid = renga.api.Cube(size)

    renga.geometry.detailed:add_solid(solid)

Передача в Renga геометрии для создания условного изображения оборудования
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Интерфейс:  ``renga.geometry.symbolic``

Метод:

.. function:: :add_planar_geometry(*args)

    :param args: В качестве аргументов передаётся плоская геометрия и ее методы.
    :type args: :doc:`PlanarGeometry <../planar>`

.. code-block:: lua
    :caption: Пример. Создание условного отображения в виде квадрата с размером грани ``size``:
    :linenos:

    local plane_geometry = renga.api.PlanarGeometryPlane()
    local curve_2d = renga.api.Rectangle(size, size)

    plane_geometry:add_curve(curve_2d))    
    renga.geometry.symbolic:add_planar_geometry(plane_geometry)

Передача в Renga геометрии для создания символьного изображение оборудования
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Интерфейс:  ``renga.geometry.symbol``

Метод:

.. function:: :add_planar_geometry(*args)

    :param args: В качестве аргументов передается плоская геометрия и ее методы.
    :type args: :doc:`PlanarGeometry <../planar>`

.. code-block:: lua
    :caption: Пример. Создание символьного отображения в виде квадрата с размером грани ``size``:
    :linenos:

    local plane_geometry = renga.api.PlanarGeometryPlane()
    local curve_2d = renga.api.Rectangle(size, size)

    plane_geometry:add_curve(curve_2d)
    renga.geometry.symbol:add_planar_geometry(plane_geometry:set_unscalable(true))

Создание в Renga точки подключения (порта) оборудования
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

Интерфейс:  ``renga.ports``

.. code-block:: lua
    :caption: Пример. Создание порта оборудования с входящим направлением потока ``inlet`` c заданием собственной ЛСК ``inlet_placement``:
    :linenos:

    renga.ports.inlet:place(inlet_placement)

Задание видимости параметра в окне стиля оборудования
"""""""""""""""""""""""""""""""""""""""""""""""""""""

Интерфейс:  ``renga.ui``

Метод:

.. function:: :set_param_visible(parameter, bool)

    :param parameter: Задает идентификатор (имя) :doc:`параметра <../createparams>`.
    :type parameter: String
    :param bool: Задает видимость параметра. True - видимый, False - невидимый
    :type bool: Boolean

.. code-block:: lua
    :caption: Пример. Создание видимости параметра ``body_width`` группы параметров ``dimensions`` во вкладке "Параметры" окна стиля оборудования:
    :linenos:

    renga.ui:set_param_visible("dimensions.body_width", true)

Задание видимости группы параметров в окне стиля оборудования
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Интерфейс:  ``renga.ui``

Метод:

.. function:: :set_group_visible(group, bool)

    :param group: Задает идентификатор (имя) :doc:`группы параметров <../createparams>`.
    :type group: String
    :param bool: Задает видимость группы параметров. True - видимый, False - невидимый
    :type bool: Boolean

.. code-block:: lua
    :caption: Пример. Создание видимости группы параметров ``inlet_1`` во вкладке "Параметры" окна стиля оборудования:
    :linenos:

    renga.ui:set_group_visible("inlet_1", true)