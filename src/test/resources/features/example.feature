# language: ru
@unit
Функция: Проверка шагов DataGenerationSteps

####################################################################################

  Сценарий: Шаг конкатенации строк
    Когда конкатенация строк "аааа" и "1111" и сохранено в переменную "конкатенация"
    Тогда значение переменной "конкатенация" равно "аааа1111"
