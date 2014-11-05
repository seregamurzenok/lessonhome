@route = '/tutor/edit/media'

@struct = state 'tutor/template/template'

@struct.edit_line.top_menu.items = {
  'Описание' : '#'
  'Предметы и условия' : '#'
}

@struct.sub_top_menu = {
  'Общие' : '#'
  'Контакты' : '#'
  'Образование' : '#'
  'Карьера' : '#'
  'О себе' : '#'
  'Медиа' : '/editing/media'
}

@struct.sub_top_menu.active_item = 'Медиа'

@struct.content = module 'tutor/edit/media':
  photos : [
    module 'mime/photo' :
      src : '#'

    module 'mime/photo' :
      src : '#'

    module 'mime/photo' :
      src : '#'

  ]
  video : module 'mime/video' :
    src : '#'

  help : module 'help_block'
