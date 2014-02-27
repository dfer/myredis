require 'rubygems'
require 'myredis'

# Параметры подключения к базам redis
# Пример для работы с кластером из 8 баз редис
$r_new[0] = Redis.new(:host=>"ip-адрес1", :port=>"порт1", :password=>'пароль1')
$r_new[1] = Redis.new(:host=>"ip-адрес2", :port=>"порт2", :password=>'пароль2')
$r_new[2] = Redis.new(:host=>"ip-адрес3", :port=>"порт3", :password=>'пароль3')
$r_new[3] = Redis.new(:host=>"ip-адрес4", :port=>"порт4", :password=>'пароль4')
$r_new[4] = Redis.new(:host=>"ip-адрес5", :port=>"порт5", :password=>'пароль5')
$r_new[5] = Redis.new(:host=>"ip-адрес6", :port=>"порт6", :password=>'пароль6')
$r_new[6] = Redis.new(:host=>"ip-адрес7", :port=>"порт7", :password=>'пароль7')
$r_new[7] = Redis.new(:host=>"ip-адрес8", :port=>"порт8", :password=>'пароль8')

# Сохраняем строку в кластере Redis
# В какую конкретно базу сохраняется значение не важно, все скрыто в логике работы прокси-класса 

$r = MyRedis.new
text = 'Time is '+Time.now.to_i.to_s

puts 'insert in cluster: '+text
$r.set 'time_text', text

puts 'get text from cluster: ' + ($r.get 'time_text')