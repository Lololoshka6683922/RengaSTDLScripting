Назначение параметров
=====================

Все параметры, описанные в `parameters.json`, импортируются в глобальное окружение ``renga``. Получить значение нужного параметера можно с помощью кода:

.. code-block:: lua
    :caption: Присвоение локальной переменной *value* значения параметра *param_name*
    :linenos:
    
    local value = _G[param_name]

Подробнее см. `Accessing Global Variables with Dynamic Names <https://www.lua.org/pil/14.1.html>`_

.. attention:: Этот блок дописывается