@route = '/tutor/edit/career'

@struct = state 'tutor/template/template'

@struct.header.top_menu.items =
  'Описание'           : '#'
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

@struct.sub_top_menu?.active_item = 'Карьера'


@struct.left_menu.items = {
  'Анкета': '../profile'
  'Заявки': '../bids'
  'Оплата': '#'
  'Документы': '#'
  'Форум': '#'
  'Статьи': '#'
  'Поддержка': '#'
}

@struct.left_menu.active_item = 'Анкета'

@struct.content = module 'tutor/edit/description/career' :
  place_of_work : module 'tutor/template/forms/input' :
    width : @struct.vars.input_width1

  post : module 'tutor/template/forms/input' :
    width : @struct.vars.input_width1

  add_button : module 'tutor/template/button' :
    text  : '+ Добавить'
    type  : 'fixed'

  experience_tutoring : module 'tutor/template/forms/drop_down_list' :
    width : @struct.vars.input_width1

  number_of_students : module 'tutor/template/forms/drop_down_list' :
    width : @struct.vars.input_width1

  extra_info : module 'tutor/template/forms/textarea' :
    id     : 'extra_info'
    width  : @struct.vars.input_width1
    height : '82px'

  save_button : module 'tutor/template/button' :
    text  : 'Сохранить'
    type  : 'fixed'


  hint : module 'tutor/template/hint' :
    type : 'horizontal'
    header : 'Это подсказка'
    text : 'Поскольку состояния всего нашего мира зависят от времени, то и состояние какой-либо системы тоже может зависеть от времени, как обычно и происходит. Однако в некоторых исключительных случаях зависимость какой-либо величины от времени может оказаться пренебрежимо слабой, так что с высокой точностью можно считать эту характеристику независящей от времени. Если такие величины описывают динамику какой-либо системы,'