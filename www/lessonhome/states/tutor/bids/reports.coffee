class @main extends template '../../tutor'
  route : '/tutor/reports'
  model   : 'tutor/reports'
  title : "отчет"
  tree : ->
    items : [
      module 'tutor/header/button' : {
        title : 'Поиск'
        href  : '/tutor/search_bids'
      }
      module 'tutor/header/button' : {
        title : 'Входящие'
        href  : '/tutor/in_bids'
      }
      module 'tutor/header/button' : {
        title : 'Исходящие'
        href  : '/tutor/out_bids'
      }
      module 'tutor/header/button' : {
        title : 'Отчёты'
        href  : '/tutor/reports'
      }
    ]
    content : module '$' :
      hint : module 'tutor/hint' :
        selector  : 'horizontal_hide_ability'
        header    : ''
        text      : 'Поскольку состояния всего нашего мира зависят от времени, то и состояние какой-либо системы тоже может зависеть от времени,
               как обычно и происходит. Однако в некоторых исключительных случаях зависимость какой-либо величины от времени может оказаться пренебрежимо слабой,
                так что с высокой точностью можно считать эту характеристику независящей от времени. Если такие величины описывают динамику какой-либо системы,'

      select_all_checkbox : module 'tutor/forms/checkbox'
      select_all_list     : module 'tutor/forms/drop_down_list'
      subject : module 'tutor/forms/drop_down_list'

      list_bids : module 'tutor/bids/list_bids' :
        titles_bid : module '//titles_bid' :
          indent     : true

          number_date   : 'Номер/Дата'
          subject_level : 'Предмет/Уровень'
          place         :'Место'
          city_district : 'Город/Район'
          bet           : 'Ставка'
          price         : 'Цена'
          status        : 'Статус'

        all_bids : [
          module '//bid' :
            selectable     : true
            report_block   : true
            checkbox       : module 'tutor/forms/checkbox' :
              selector : 'bid'
            fill_button    : module 'tutor/button' :
              text  : 'Заполнить'
              selector  : 'fill'
            support_button : module 'tutor/button' :
              text  : 'Поддержка'
              selector  : 'support'

            number    : 25723
            date      : "10 ноября"
            subject   : 'Физика'
            level     : '6 класс'
            place     : 'У ученика'
            city      : 'Москва'
            district  : 'Бирюлёво'
            bet_price : '1000 руб.'
            bet_time  : '90 мин.'
            price     : '1500 руб.'
            status    : 'start'

            category_pupil      : 'школьники 6-8 классов'
            training_direction  : 'ЕГЭ'
            number_of_lessons   :  'Более 20'
            wishes              : 'Утро выходных дней'
            near_metro          : 'м.Крюково'
            comments            : '-'
            lesson_goal         : 'Устранить пробелы в знаниях'

            full_name           : 'Дудко Артемий Львович'
            phone               : '+7(499)4653638'
            post                : 'seragj@mail.ru'
            skype               : 'melanholic'
            wish_time           : 'вторник 18:30-20:00'


          module '//bid' :
            selectable   : true
            report_block : true
            checkbox  : module 'tutor/forms/checkbox' :
              selector : 'bid'
            fill_button    : module 'tutor/button' :
              text  : 'Заполнить'
              selector  : 'fill'
            support_button : module 'tutor/button' :
              text  : 'Поддержка'
              selector  : 'support'

            number    : 15723
            date      : "20 декабря"
            subject   : 'Математика'
            level     : '8 класс'
            place     : 'У ученика'
            city      : 'Москва'
            district  : 'Выхино'
            bet_price : '1000 руб.'
            bet_time  : '90 мин.'
            price     : '1500 руб.'
            status    : 'start'

            category_pupil      : 'школьники 6-8 классов'
            training_direction  : 'ЕГЭ'
            number_of_lessons   :  'Более 20'
            wishes              : 'Утро выходных дней'
            near_metro          : 'м.Крюково'
            comments            : '-'
            lesson_goal         : 'Устранить пробелы в знаниях'

            full_name           : 'Дудко Артемий Львович'
            phone               : '+7(499)4653638'
            post                : 'seragj@mail.ru'
            skype               : 'melanholic'
            wish_time           : 'вторник 18:30-20:00'
        ]
  init : ->
    @parent.tree.left_menu.setActive 'Заявки'