cat Price\ identification\ -\ NetHack\ Wiki.html | grep -i -e '</\?TABLE\|</\?TD\|</\?TR\|</\?TH' >> price_id-tablesONLY.html

# выцепляет таблицы из хтмла, как результат - D:\nikita\prjcts\nethack-dashboard\scripts\out\price_id-tablesONLY_28042022-2124.html
# почемуто не выводит список предметов в таблицах
# 
# и хотелось бы выцеплять названия таблиц

#попробуй через переменную окружения добавлять дату-время в названии выходного файла
