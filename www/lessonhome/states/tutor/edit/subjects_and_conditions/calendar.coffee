@route = '/tutor/edit/calendar'

@struct = state 'tutor/template/template'

@struct.header.top_menu.items =
  'Описание'           : 'general'
  'Предметы и условия' : 'subjects'

@struct.header.top_menu.active_item = 'Предметы и условия'

@struct.sub_top_menu = state 'tutor/template/sub_top_menu'

@struct.sub_top_menu?.items =
  'Предметы'     : 'subjects'
  'Место'        : 'location'
  'Календарь'    : 'calendar'
  'Предпочтения' : 'preferences'

@struct.sub_top_menu?.active_item = 'Календарь'



@left_menu_href = ['../profile', '../bids', '#', '#', '#', '#', '#']
for href,i in @left_menu_href
  @struct.left_menu.items[i].href = href

@struct.left_menu.setActive.call(@struct.left_menu,'Анкета')


@struct.content = module 'tutor/edit/subjects_and_conditions/calendar':
  dates : '#'
  hint : module 'tutor/template/hint' :
    type : 'vertical'
    header : 'Это подсказка'
    text : 'Поскольку состояния всего нашего мира зависят от времени, то и состояние какой-либо системы тоже может зависеть от времени, как обычно и происходит'

  button : module 'tutor/template/button' :
    text  : 'Сохранить'
    type  : 'fixed'