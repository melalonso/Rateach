# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

TeacherComment.delete_all
Teacher.delete_all
Course.delete_all
Career.delete_all
User.delete_all
Faculty.delete_all
University.delete_all





user = User.create([
                       {id:1 ,email:'badsa@badsacorp.com',name:'badsa',manager:true,password:'12345678'},
                       {id:2 ,email:'daniel@badsacorp.com',name:'daniel',manager:false,password:'12345678'},
                       {id:3 ,email:'alonso@badsacorp.com',name:'alonso',manager:false,password:'12345678'},
                       {id:4 ,email:'bayron@badsacorp.com',name:'bayron',manager:false,password:'12345678'},
                       {id:5 ,email:'sebas@badsacorp.com',name:'sebas',manager:false,password:'12345678'}
                   ])


universities = University.create ([
    {id: 1, name: 'Instituto Tecnologico de Costa Rica', description: 'El Tecnológico de Costa Rica (TEC) es una institución
nacional autónoma de educación superior universitaria,
dedicada a la docencia, la investigación y la extensión
de la tecnología y ciencias conexas para el desarrollo
de Costa Rica. Fue creado mediante ley No. 4777 del
10 de junio de 1971. En su estructura organizativa se
destacan las siguientes instancias:
- Asamblea Institucional: mpaxima autoridad del TEC.
- Consejo Institucional: órgano directivo superior del TEC.
- Rector: el rector es el funcionario de más alta jerarquía ejecutiva del TEC.
- Vicerrectorías: para cumplir con sus políticas específicas, el TEC cuenta con cuatro.',logo: 'ITCR_logo.svg.png'},

    {id:2, name: 'Universidad de Costa Rica', description: 'Desde su creación en 1940, la Universidad de Costa Rica es una institución que ha
encauzado su quehacer en concordancia con una búsqueda constante, inagotable y libre, de la verdad, la eficacia y la belleza, como lo establece su Estatuto Orgánico.',logo: 'UCR_logo.png'},

    {id:3, name:'Universidad Nacional de Costa Rica', description:'La Universidad Nacional es una de las instituciones más representativas de la Educación Superior costarricense,
no solo por ser la segunda casa de estudios universitarios creada en el país, sino porque, desde sus orígenes, ha construido un proyecto educativo, científico, cultural y social integral,
inclusivo y sobre todo, al servicio de la sociedad costarricense. Esta misión la ha emprendido mediante el desarrollo de dos importantes tareas: la formación de profesionales de alto nivel y el intercambio con la sociedad civil,
de conocimientos y saberes en sus más variadas expresiones, por medio de la investigación y la extensión social.',logo: 'UNA_logo.png'}
])


faculty = Faculty.create([
                             {id:1,university_id:1,name:"Administacion de empresas"},
                             {id:2,university_id:2,name:"Agronegocios"},
                             {id:3,university_id:1,name:"Biologia"},
                             {id:4,university_id:1,name:"Ciencia e Ingeniería de los Materiales"},
                             {id:5,university_id:1,name:"Ciencias del Lenguaje"},
                             {id:6,university_id:1,name:"Ciencias Sociales"},
                             {id:7,university_id:1,name:"Cultura y Deporte"},
                             {id:8,university_id:1,name:"Electromecanica"},
                             {id:9,university_id:1,name:"Electronica"},
                             {id:10,university_id:1,name:"Computacion"}
                         ])

teachers = Teacher.create([
    {id:1, university_id:1, faculty_id:1, name: 'Diego', last_name:'Munguia', eval_sum:250.0, eval_amount:3},
    {id:2, university_id:2, faculty_id:2, name: 'Diego', last_name:'Munguia', eval_sum:250.0, eval_amount:3}
                          ])

careers = Career.create ([
                            {id:1, university_id:1, faculty_id:10, name:"Ingenieria en Computacion"},
                            {id:2, university_id:2, faculty_id:2, name:"Ingenieria en Computadores"}
                        ])

courses = Course.create([
                            {id:1, university_id:1, faculty_id:1, career_id:2, name:'Ingles_I_para_Computacion'},
                            {id:2, university_id:2, faculty_id:2, career_id:1, name: 'Comunicacion_Tecnica'},
                            {id:3, university_id:1, faculty_id:1, career_id:1, name: 'Fundamentos_de_Organizacion_de_Computadoras'},
                            {id:4, university_id:1, faculty_id:1, career_id:1, name: 'Introduccion_a_la_Programacion'},
                            {id:5, university_id:1, faculty_id:1, career_id:1, name: 'Taller_de_Programacion'},
                            {id:6, university_id:1, faculty_id:1, career_id:1, name: 'Matematica_Discreta'},
                            {id:7, university_id:1, faculty_id:1, career_id:1, name: 'Actividad_Cultural_I'}
                        ])
TeacherComment.create([
                          {id:1, user_id:1, teacher_id:1, content: "Es un excelente profesor"},
                          {id:2, user_id:2, teacher_id:1, content: "Es el dicipulo de Charls, excelente pero hay que tomar apuntes"},
                          {id:3, user_id:2, teacher_id:1, content: "Es el dicipulo de Charls, excelente pero hay que tomar apuntes"},
                          {id:4, user_id:2, teacher_id:1, content: "Es el dicipulo de Charls, excelente pero hay que tomar apuntes"},
                          {id:5, user_id:2, teacher_id:1, content: "Es el dicipulo de Charls, excelente pero hay que tomar apuntes"},
                          {id:6, user_id:2, teacher_id:1, content: "Es el dicipulo de Charls, excelente pero hay que tomar apuntes"},
                          {id:7, user_id:2, teacher_id:1, content: "Es el dicipulo de Charls, excelente pero hay que tomar apuntes"},
                          {id:8, user_id:2, teacher_id:1, content: "Es el dicipulo de Charls, excelente pero hay que tomar apuntes"}
                      ])