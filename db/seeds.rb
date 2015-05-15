# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all

user = User.create([
                       {id:1 ,email:'badsa@badsacorp.com',name:'badsa',manager:true,password:'12345678'},
                       {id:2 ,email:'daniel@badsacorp.com',name:'daniel',manager:false,password:'12345678'},
                       {id:3 ,email:'alonso@badsacorp.com',name:'alonso',manager:false,password:'12345678'},
                       {id:4 ,email:'bayron@badsacorp.com',name:'bayron',manager:false,password:'12345678'},
                       {id:5 ,email:'sebas@badsacorp.com',name:'sebas',manager:false,password:'12345678'}
                   ])