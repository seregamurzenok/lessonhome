class @main
  tree : => module '$' :
      list_course     : module 'tutor/forms/drop_down_list'  :
        selector        : 'list_course'
        placeholder     : 'Например ЕГЭ'
      add_course      : module '../selected_tag'  :
        selector  : 'choose_course'
        text      : 'ЕГЭ'
        close     : true
      calendar        : module './calendar' :
        choose_all      : module 'tutor/forms/checkbox':
          selector        : 'small'
        from_time     : module 'tutor/forms/input' :
          selector      : 'center_text'
        till_time     : module 'tutor/forms/input' :
          selector      : 'center_text'
        button_add    : module 'button_add' :
          text          : '+'
      time_spend_lesson   : state './slider_main' :
        selector    : 'lesson_time'
        start       : 'time_spend'
        end         : 'time_spend'
        measurement : 'мин.'
        dash        : '-'
      time_spend_way   : state './slider_main' :
        selector    : 'lesson_time'
        start       : 'time_spend'
        end         : 'time_spend'
        measurement : 'мин.'
        dash        : '-'
      female            : module 'gender_button' :
        selector    : 'female'
      male              : module 'gender_button' :
        selector    : 'male'
      with_reviews      : module 'tutor/forms/checkbox_text'  :
        text        : 'С отзывами'
        checkBox    : module 'tutor/forms/checkbox' :
          selector  : 'small'
      with_verification : module 'tutor/forms/checkbox_text'  :
        text        : 'Верифицированные'
        checkBox    : module 'tutor/forms/checkbox' :
          selector  : 'small'