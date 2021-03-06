class @main extends template '../registration_popup'
  route : '/tutor/profile/first_step'
  model : 'tutor/profile_registration/first_step'
  title : "первый вход"
  tree : ->
    content : module '$' :
      understand_button : module '//understand_button'
      first_name  : module 'tutor/forms/input'
      last_name   : module 'tutor/forms/input'
      patronymic  : module 'tutor/forms/input'
      sex_man     : module 'tutor/forms/sex_button' :
        selector : 'man'
      sex_woman   : module 'tutor/forms/sex_button' :
        selector : 'woman'
      birth_day   : module 'tutor/forms/drop_down_list' :
        placeholder : 'День'
      birth_month : module 'tutor/forms/unable_enter_list' :
        placeholder : 'Месяц'
        type : 'unable_to_enter'
        list : [
          'Январь'
          'Февраль'
          'Март'
          'Апрель'
          'Май'
          'Июнь'
          'Июль'
          'Август'
          'Сентябрь'
          'Октябрь'
          'Ноябрь'
          'Декабрь'
        ]
      birth_year  : module 'tutor/forms/drop_down_list' :
        placeholder : 'Год'
      status      : module 'tutor/forms/drop_down_list'

  init : ->
    @parent.tree.popup.footer.button_back.selector = 'inactive'
    @parent.tree.popup.footer.back_link = false
    @parent.tree.popup.footer.next_link = 'second_step'
