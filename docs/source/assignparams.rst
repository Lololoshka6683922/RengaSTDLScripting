Работа с параметрами
====================

После импорта шаблона категории в Renga, все параметры, описанные в JSON, будут являться объектами таблицы ``Style`` и храниться в группе, к которой они принадлежат.

.. _parameter:

Методы параметров
-----------------

Вернуть значение параметра
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. lua:method:: :GetValue()

    :return: Значение параметра.

Включить или отключить отображение параметра в редакторе стилей объекта
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. lua:method:: :SetVisible(isVisible)

    :param isVisible: Булевое значение (true/false)
    :rtype: Boolean

Установить возможность редактирования параметра в редакторе стилей объекта
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. lua:method:: :SetEnabled(isEnabled)

    :param isEnabled: Булевое значение (true/false)
    :rtype: Boolean

.. _access_to_parameters:

Доступ к параметрам
-------------------

Получить доступ к нужному параметру в скриптовой части можно следующими способами:

.. note:: Имена групп параметров и параметров берутся из JSON

Получить таблицу значений параметров
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. lua:function:: GetParameterValues()

    :return: Таблица значений параметров вида [имя группы][имя параметра][значение параметра].
    :rtype: table of :ref:`Parameters <parameter>`

.. code-block:: lua
    :caption: Пример 1. Присвоение локальной переменной ``width`` значения параметра ``bodyWidth`` из группы параметров ``Dimensions``
    :linenos:
    
    local parameters = Style.GetParameterValues()   -- получение таблицы значений параметров

    local width = parameters["Dimensions"].bodyWidth

Эта запись эквивалентна:

.. code-block:: lua
    :caption: Пример 2.
    :linenos:
    
    local width = parameters.Dimensions.bodyWidth

Получить параметр по имени группы и параметра
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. lua:function:: GetParameter(groupName, parameterName)

    :param groupName: Задает идентификатор (имя) :doc:`группы параметров <../createparams>`.
    :type groupName: String
    :param parameterName: Задает идентификатор (имя) :doc:`параметра <../createparams>`.
    :type parameterName: String
    :return: Параметр
    :rtype: :ref:`Parameter <parameter>`

.. note:: Имена групп параметров и параметров берутся из JSON

.. code-block:: lua
    :caption: Пример 3. Присвоение локальной переменной ``width`` значения параметра ``bodyWidth`` из группы параметров ``Dimensions`` с использованием функций ``GetParameter()`` и ``GetValue()``
    :linenos:
    
    local width = Style.GetParameter("Dimension", "bodyWidth"):GetValue()

Получить группу параметров по имени
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. lua:function:: GetParameterGroup(groupName)

    :param groupName: Задает идентификатор (имя) :doc:`группы параметров <../createparams>`.
    :type groupName: String
    :return: Группа параметров

.. code-block:: lua
    :caption: Пример 3. Скрытие группы параметров ``Dimension`` из диалога стилей объекта.
    :linenos:
    
    Style.GetParameterGroup("Dimension"):SetVisible(false)
