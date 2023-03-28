Назначение параметров
=====================

Все параметры, описанные в ``parameters.json``, импортируются в глобальное окружение. Поэтому могут быть легко доступны из любой части скрипта, например с помощью такого кода:

.. code-block:: lua
    :caption: Пример 1. Присвоение локальной переменной *value* значения параметра *param_name*
    :linenos:
    
    local value = _G[param_name]

Подробнее см. `Accessing Global Variables with Dynamic Names <https://www.lua.org/pil/14.1.html>`_

.. code-block:: lua
    :caption: Пример 2. 
    :linenos:
    
    local nipple = Cylinder(_G[connector].outer_diameter / 2, dimensions.nipples_length):place(nipple_placement)

.. attention:: Этот блок дописывается