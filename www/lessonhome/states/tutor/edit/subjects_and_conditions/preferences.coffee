@route = '/tutor/edit/preferences'

@struct = state 'tutor/template/template'

@struct.edit_line.top_menu.items =
  'Описание'           : '#'
  'Предметы и условия' : '#'

@struct.edit_line.top_menu.active_item = 'Предметы и условия'

@struct.sub_top_menu = state 'tutor/template/sub_top_menu'

@struct.sub_top_menu?.items =
  'Предметы'     : 'subjects'
  'Место'        : '#'
  'Календарь'    : 'calendar'
  'Предпочтения' : 'preferences'

@struct.sub_top_menu?.active_item = 'Предпочтения'

@struct.content = module 'tutor/edit/subjects_and_conditions/preferences':
  sex  : module 'tutor/template/choice' :
    id : 'sex'
    choice_list : [
      module 'tutor/template/button' :
        text  : 'М'
        type  : 'fixed'

      module 'tutor/template/button' :
        text  : 'Ж'
        type  : 'fixed'

    ]

  category : module 'tutor/template/forms/drop_down_list' :
    width : '335px'

  status : module 'tutor/template/forms/drop_down_list' :
    width : '335px'

  hint : module 'tutor/template/hint' :
    type : 'vertical'
    header : 'Это подсказка'
    text : 'Поскольку состояния всего нашего мира зависят от времени, то и состояние какой-либо системы тоже может зависеть от времени, как обычно и происходит'

  button : module 'tutor/template/button' :
    text  : 'Сохранить'
    type : 'fixed'