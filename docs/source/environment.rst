Окружение
=========

Благодаря cкриптам, написанным на языке LUA, Renga расширяет свои внутренние возможности по созданию пользовательских категорий инженерного оборудования.

Cкрипты, описывающие оборудование, должны создаваться в модуле ``main.lua``. Модуль — это некоторый код или скрипт, который может состоять из набора операторов и определений функций, сохраненный в виде отдельного файла.
Все, что модуль экспортирует, будь то функции, переменные или таблицы, LUA определяет внутри этого модуля, который выступает в качестве локального окружения.

Скрипты могут состоять из нескольких модулей. Например, в одном модуле ``geometry.lua`` описывается 3D-геометрия, в другом модуле ``ports.lua`` — порты и т.д. Но основным модулем должен быть ``main.lua``.

Переменные и функции, которые создаются и используются в одном модуле, объявляются с помощью ключевого слова ``local``. Переменные и функции, которые будут использованы в других модулях не требуют объявления. Подробнее см. `Programming in LUA <https://www.lua.org/pil/14.html>`_

Глобальные функции
------------------

Скрипты выполняются в глобальном окружении ``renga``, в котором определены глобальные функции для непосредственного создания в Renga нового оборудования:

.. note:: Окружения в LUA — это аналог `namespaces в C <https://learn.microsoft.com/ru-ru/cpp/cpp/namespaces-cpp?view=msvc-170>`_

* Создать 3D-геометрию для нового оборудования

.. function:: renga.geometry.detailed.add_solid(*args)

    :param args: В качестве аргументов передаются 3D-тела.
    :type args: :doc:`Solid <../geometry>`

Пример:

.. code-block:: console
    :caption: Создание 3D-тела в форме куба с размером грани *size*:

    local solid = Cube(size)
    renga.geometry.detailed.add_solid(solid)

* Создать условное изображение для нового оборудования

.. function:: renga.geometry.symbolic.add_planar_geometry(*args)

    :param args: В качестве аргументов передается плоская геометрия.
    :type args: :doc:`PlanarGeometry <../planar>`

Пример:

.. code-block:: console
    :caption: Создание условного отображения в виде квадрата с размером грани *size*:

    local plane_geometry = PlanarGeometryPlane()
    plane_geometry:add_curve(Rectangle(size, size))
    renga.geometry.symbolic.add_planar_geometry(plane_geometry)

* Создать символьное изображение для нового оборудования

.. function:: renga.geometry.symbol.add_planar_geometry(*args)

    :param args: В качестве аргументов передается плоская геометрия.
    :type args: :doc:`PlanarGeometry <../planar>`

Пример:

.. code-block:: console
    :caption: Создание символьного отображения в виде квадрата с размером грани *size*:

    local plane_geometry = PlanarGeometryPlane()
    plane_geometry:add_curve(Rectangle(size, size))
    renga.geometry.symbolic.add_planar_geometry(plane_geometry:set_unscalable(true))

* Создать точку подключения (порт) оборудования

.. function:: renga.ports.flow_direction

    :param ports: Порт
    :type ports: :doc:`Port <../ports>`
    :param flow_direction: Направление потока
    :type flow_direction: :ref:`Enum <flow>`

* Задать видимость параметра

.. function:: renga.set_param_visible(parameter, bool)

    :param parameter: Задает идентификатор (имя) параметра.
    :param bool: Задает видимость параметра. True - видимый, False - невидимый
    :type bool: boolean

* Задать видимость группы параметров

.. function:: renga.set_group_visible(group, bool)

    :param group: Задает идентификатор (имя) группы параметров.
    :param bool: Задает видимость параметра. True - видимый, False - невидимый
    :type bool: boolean