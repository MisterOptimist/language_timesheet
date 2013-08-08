# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  Morris.Line
    element: 'home_timesheets_chart'
    data: $('#home_timesheets_chart').data('orders')
    xkey: 'day'
    ykeys: ['teacher', 'study', 'conversation']
    labels: ['Teacher Hours', 'Self Study Hours', 'Conversation Hours']
    
  