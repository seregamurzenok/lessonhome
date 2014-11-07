@route = '/tutor/edit/media'

@struct = state 'tutor/template/template'

@struct.edit_line.top_menu.items =
  'Описание'           : '#'
  'Предметы и условия' : '#'

@struct.edit_line.top_menu.active_item = 'Описание'

@struct.sub_top_menu = state 'tutor/template/sub_top_menu'

@struct.sub_top_menu?.items =
  'Общие'       : '#'
  'Контакты'    : '#'
  'Образование' : '#'
  'Карьера'     : '#'
  'О себе'      : '#'
  'Медиа'       : '/media'

@struct.sub_top_menu?.active_item = 'Медиа'

@struct.content = module 'tutor/edit/description/media':
  photos : [
    module 'mime/photo' :
      src : '#'

    module 'mime/photo' :
      src : '#'

    module 'mime/photo' :
      src : '#'
  ]
  videos : [
    module 'mime/video' :
      src : '#'

    module 'mime/video' :
      src : '#'
  ]

  hint : module 'tutor/template/hint'