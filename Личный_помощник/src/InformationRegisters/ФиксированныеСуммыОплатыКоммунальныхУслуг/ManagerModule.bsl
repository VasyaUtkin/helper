Функция ПолучитьСуммыОплаты(Знач Услуги = Неопределено, Знач Дата = Неопределено) Экспорт
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ФиксированныеСуммыОплатыКоммунальныхУслуг.Сумма,
		|	ФиксированныеСуммыОплатыКоммунальныхУслуг.ВидУслуги
		|ИЗ
		|	РегистрСведений.ФиксированныеСуммыОплатыКоммунальныхУслуг.СрезПоследних(&Дата, ВидУслуги В (&Услуги)) КАК ФиксированныеСуммыОплатыКоммунальныхУслуг";
		
	Если Не ЗначениеЗаполнено(Услуги) Тогда
		Запрос.Текст = СтрЗаменить(Запрос.Текст, "ВидУслуги В (&Услуги)", "");		
	КонецЕсли;
		
	Запрос.УстановитьПараметр("Дата", Дата);
	Запрос.УстановитьПараметр("Услуги", Услуги);
	
	Возврат Запрос.Выполнить().Выгрузить();
		
КонецФункции