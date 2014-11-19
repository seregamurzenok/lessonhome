@route = '/tutor/edit/general'

@struct = state 'tutor/template/template'

@struct.header.top_menu.items =
  'Описание'           : 'general'
  'Предметы и условия' : 'subjects'

@struct.header.top_menu.active_item = 'Описание'

@struct.sub_top_menu = state 'tutor/template/sub_top_menu'

@struct.sub_top_menu.items =
  'Общие'       : 'general'
  'Контакты'    : 'contacts'
  'Образование' : 'education'
  'Карьера'     : 'career'
  'О себе'      : 'about'
  'Медиа'       : 'media'

@struct.sub_top_menu?.active_item = 'Общие'


@struct.left_menu.items =
  'Анкета': '../profile'
  'Заявки': '../bids'
  'Оплата': '#'
  'Документы': '#'
  'Форум': '#'
  'Статьи': '#'
  'Поддержка': '#'

@struct.left_menu.active_item = 'Анкета'
###
@struct.content = module 'tutor/edit/description/general' :

  first_name : module 'tutor/template/forms/input' :
    #id     : '#'#
    width  : '335px'

  second_name : module 'tutor/template/forms/input' :
    #id     : '#'#
    width  : '335px'

  patronymic : module 'tutor/template/forms/input' :
    #id     : '#'#
    width  : '335px'

  sex :
    width  : '335px'
    male   : module 'tutor/template/button' :
      text : 'М'
      type : 'fixed'

    female : module 'tutor/template/button' :
      text : 'Ж'
      type : 'fixed'

  date_of_birth : module 'tutor/template/forms/input' :
    #id     : '#'#
    width  : '335px'

  save_button : module 'tutor/template/button' :
    text  : 'Сохранить'
    type  : 'fixed'

  hint : module 'tutor/template/hint' :
    type   : 'horizontal'
    header : 'Это подсказка'
    text   : 'Поскольку состояния всего нашего мира зависят от времени, то и состояние какой-либо системы тоже может зависеть от времени, как обычно и происходит. Однако в некоторых исключительных случаях зависимость какой-либо величины от времени может оказаться пренебрежимо слабой, так что с высокой точностью можно считать эту характеристику независящей от времени. Если такие величины описывают динамику какой-либо системы,'
###